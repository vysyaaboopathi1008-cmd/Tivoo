import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/domain/models/live_stream_card_model.dart';
import '../../../../core/widgets/live_video_player.dart';
import '../../domain/models/gift_item.dart';
import '../controllers/live_stream_controller.dart';
import '../widgets/active_gift_animation_overlay.dart';
import '../widgets/floating_hearts_overlay.dart';
import '../widgets/floating_stars_overlay.dart';
import '../widgets/gift_bottom_sheet.dart';
import '../widgets/live_action_bar.dart';
import '../widgets/live_bottom_input_bar.dart';
import '../widgets/live_chat_list_view.dart';
import '../widgets/live_stream_top_bar.dart';
import '../widgets/star_up_bottom_sheet.dart';
import '../../../home/presentation/widgets/streamer_id_profile_sheet.dart';

/// Full-screen live viewer, vertically swipeable between [streams] the way
/// TikTok/Bigo Live feeds work — each page plays its own video only while
/// it's the active page (via [LiveVideoPlayer]'s existing visibility-based
/// lazy loading) and keeps independent comment/like/follow state.
class LiveStreamScreen extends StatefulWidget {
  final List<LiveStreamCardModel> streams;
  final int initialIndex;

  const LiveStreamScreen({
    super.key,
    required this.streams,
    required this.initialIndex,
  });

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: widget.streams.length,
        itemBuilder: (context, index) {
          return _LiveStreamPage(stream: widget.streams[index]);
        },
      ),
    );
  }
}

class _LiveStreamPage extends ConsumerStatefulWidget {
  final LiveStreamCardModel stream;

  const _LiveStreamPage({required this.stream});

  @override
  ConsumerState<_LiveStreamPage> createState() => _LiveStreamPageState();
}

class _LiveStreamPageState extends ConsumerState<_LiveStreamPage> {
  final GlobalKey<State<FloatingHeartsOverlay>> _heartsKey = GlobalKey();
  final GlobalKey<FloatingStarsOverlayState> _starsKey = GlobalKey();
  final GlobalKey<ActiveGiftAnimationOverlayState> _activeGiftKey = GlobalKey();
  final FocusNode _commentFocusNode = FocusNode();
  GiftItem? _recentGift;

  @override
  void dispose() {
    _commentFocusNode.dispose();
    super.dispose();
  }

  void _triggerHeartAnimation() {
    ref
        .read(liveStreamControllerProvider(widget.stream.id).notifier)
        .incrementLikesQuickTap();
    final heartsState = _heartsKey.currentState as dynamic;
    if (heartsState != null && heartsState.addHeart != null) {
      heartsState.addHeart();
    }
  }

  void _handleStarTap() {
    StarUpBottomSheet.show(
      context,
      streamerName: widget.stream.streamerName,
      onSendStars: (multiplier) {
        _starsKey.currentState?.addStars(multiplier.clamp(1, 10));
        ref
            .read(liveStreamControllerProvider(widget.stream.id).notifier)
            .addUserComment('sent $multiplier Stars! 🌟');
      },
    );
  }

  void _handleGiftTap(LiveStreamController controller) {
    GiftBottomSheet.show(context, (gift) {
      controller.sendGift(gift);
      _triggerHeartAnimation();
      _activeGiftKey.currentState?.playGift(gift, senderName: 'You');
      setState(() {
        _recentGift = gift;
      });
      Future.delayed(const Duration(milliseconds: 3200), () {
        if (mounted) {
          setState(() => _recentGift = null);
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You sent ${gift.name} ${gift.icon} to ${widget.stream.streamerName}!',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(
      liveStreamControllerProvider(widget.stream.id).notifier,
    );

    return ActiveGiftAnimationOverlay(
      key: _activeGiftKey,
      child: FloatingStarsOverlay(
        key: _starsKey,
        child: FloatingHeartsOverlay(
          key: _heartsKey,
          child: GestureDetector(
            onDoubleTap: _triggerHeartAnimation,
            behavior: HitTestBehavior.opaque,
          child: Stack(
            children: [
              // 1. Full Screen Video Player Background (Video or Image)
              Positioned.fill(child: _buildVideoBackground()),

              // 2. Vertical Gradient Shadows for contrast & readability
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x90000000),
                        Colors.transparent,
                        Colors.transparent,
                        Color(0xB5000000),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.20, 0.55, 1.0],
                    ),
                  ),
                ),
              ),

              // 2b. Ambient neon glow anchored behind the chat feed
              Positioned(
                left: -40,
                right: 0,
                bottom: 0,
                height: 340,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 1.1,
                        center: Alignment.bottomLeft,
                        colors: [
                          AppColors.glowPurple.withValues(alpha: 0.16),
                          AppColors.glowPurple.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 3. SVIP Animated Gift Banner Overlay ("Ray send 600 TIMES helicopter x8291")
              if (_recentGift != null)
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 65,
                  left: 14,
                  right: 14,
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 400),
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.elasticOut,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xE67B1FA2),
                                Color(0xE6E91E63),
                                Color(0xE6FFB300),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 1.5,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x99FF2D55),
                                blurRadius: 18,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white24,
                                ),
                                child: Center(
                                  child: Text(
                                    _recentGift!.icon,
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'You sent ${_recentGift!.name}!',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      '💎 ${_recentGift!.diamonds}  •  x8291 COMBO',
                                      style: const TextStyle(
                                        color: Color(0xFFFFDF00),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFDF00),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'SVIP GIFT',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // 4. Foreground Live Overlays & Controls
              SafeArea(
                child: Column(
                  children: [
                    // Top Bar (LIVE badge, viewers count, close ✕ button)
                    LiveStreamTopBar(
                      viewersCount: widget.stream.viewersCount,
                      onCloseTap: () => Navigator.of(context).pop(),
                    ),

                    const Spacer(),

                    // Middle / Bottom Interactive Live Area (capped width on tablets)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: context.isTablet ? 700 : double.infinity,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Left Side: Live Comments Feed (Auto-scrolling down side)
                              Expanded(
                                child: SizedBox(
                                  height: 230,
                                  child: Consumer(
                                    builder: (context, ref, _) {
                                      final comments = ref.watch(
                                        liveStreamControllerProvider(widget.stream.id)
                                            .select((s) => s.comments),
                                      );
                                      return LiveChatListView(
                                        comments: comments,
                                      );
                                    },
                                  ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              // Right Side: Floating Action Controls
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 12,
                                  bottom: 6,
                                ),
                                child: Consumer(
                                  builder: (context, ref, _) {
                                    final liveState = ref.watch(
                                      liveStreamControllerProvider(widget.stream.id),
                                    );
                                    return LiveActionBar(
                                      streamerAvatarAsset:
                                          widget.stream.streamerAssetPath ??
                                          (widget.stream.streamerAvatarUrl == null
                                              ? AppAssets.liveCard1
                                              : null),
                                      streamerAvatarUrl:
                                          widget.stream.streamerAvatarUrl,
                                      isFollowing: liveState.isFollowing,
                                      isLiked: liveState.isLiked,
                                      likesCount: liveState.formattedLikes,
                                      commentsCount: liveState.formattedComments,
                                      starsCount: 'Star',
                                      onFollowTap: () {
                                        controller.toggleFollow();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              liveState.isFollowing
                                                  ? 'Unfollowed ${widget.stream.streamerName}'
                                                  : 'Now following ${widget.stream.streamerName} ❤️',
                                            ),
                                            duration: const Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      onLikeTap: () {
                                        _triggerHeartAnimation();
                                      },
                                      onStarTap: _handleStarTap,
                                      onGiftTap: () => _handleGiftTap(controller),
                                      onCommentTap: () {
                                        _commentFocusNode.requestFocus();
                                      },
                                      onAvatarTap: () {
                                        StreamerIdProfileSheet.show(
                                          context,
                                          stream: widget.stream,
                                        );
                                      },
                                      onShareTap: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Live stream link copied to clipboard!',
                                            ),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Bottom Bar: Clean inline comment input (Star & Gift are in vertical action bar)
                    LiveBottomInputBar(
                      focusNode: _commentFocusNode,
                      onSendComment: (text) {
                        controller.addUserComment(text);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget _buildVideoBackground() {
    return RepaintBoundary(
      child: _buildVideoContent(),
    );
  }

  Widget _buildVideoContent() {
    if (widget.stream.videoAssetPath != null &&
        widget.stream.videoAssetPath!.isNotEmpty) {
      return LiveVideoPlayer(
        playerId: widget.stream.id,
        videoAssetPath: widget.stream.videoAssetPath!,
        placeholderAssetPath: widget.stream.coverAssetPath,
        placeholderImageUrl: widget.stream.coverImageUrl,
        autoPlay: true,
        isMuted: false,
        showSoundToggle: false,
        fit: BoxFit.cover,
      );
    }
    if (widget.stream.coverAssetPath != null &&
        widget.stream.coverAssetPath!.isNotEmpty) {
      return Image.asset(
        widget.stream.coverAssetPath!,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        cacheWidth: 800,
      );
    }
    if (widget.stream.coverImageUrl != null &&
        widget.stream.coverImageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: widget.stream.coverImageUrl!,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        memCacheWidth: 800,
        memCacheHeight: 1400,
        placeholder: (context, url) => Container(color: AppColors.background),
        errorWidget: (context, url, error) =>
            Image.asset(AppAssets.liveCard1, fit: BoxFit.cover, cacheWidth: 800),
      );
    }
    return Image.asset(AppAssets.liveCard1, fit: BoxFit.cover, cacheWidth: 800);
  }
}
