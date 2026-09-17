import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_avatar.dart';
import '../../domain/models/live_comment.dart';

/// Glassmorphic Live Chat Stream:
/// - Comments flow UPWARDS towards the video ("malla poga")
/// - Bottom-anchored with reverse: true so newest comments enter at bottom
/// - Upward slide & fade micro-animation
/// - Displays circular profile picture avatar on EVERY comment
/// - Top-fade gradient ShaderMask so comments dissolve smoothly as they rise
class LiveChatListView extends StatefulWidget {
  final List<LiveComment> comments;

  const LiveChatListView({
    super.key,
    required this.comments,
  });

  @override
  State<LiveChatListView> createState() => _LiveChatListViewState();
}

class _LiveChatListViewState extends State<LiveChatListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant LiveChatListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.comments.length != oldWidget.comments.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _getAvatarForComment(LiveComment comment) {
    if (comment.userAssetPath != null && comment.userAssetPath!.isNotEmpty) {
      return comment.userAssetPath!;
    }
    final avatars = [
      AppAssets.status1,
      AppAssets.status2,
      AppAssets.status3,
      AppAssets.status4,
      AppAssets.status5,
    ];
    final hash = comment.userName.hashCode.abs();
    return avatars[hash % avatars.length];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.comments.isEmpty) {
      return const SizedBox.shrink();
    }

    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.white,
          Colors.white,
        ],
        stops: [0.0, 0.22, 1.0],
      ).createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: ListView.builder(
        controller: _scrollController,
        reverse: true, // Anchor to bottom, new comments push upwards!
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        itemCount: widget.comments.length,
        itemBuilder: (context, index) {
          // Bottom-anchored: index 0 is the newest comment at the bottom
          final itemIndex = widget.comments.length - 1 - index;
          if (itemIndex < 0 || itemIndex >= widget.comments.length) {
            return const SizedBox.shrink();
          }
          final comment = widget.comments[itemIndex];

          // Exactly 4 newest comments are 100% bold & clear ("4 message nalla thericha pothu")
          // Older comments floating further up become progressively lighter ("apporam yella lite thericha pothu")
          double fadeOpacity = 1.0;
          if (index >= 4) {
            final int step = index - 4;
            fadeOpacity = (0.55 - (step * 0.15)).clamp(0.14, 0.55);
          }

          return _buildFloatingCommentItem(comment, fadeOpacity: fadeOpacity);
        },
      ),
    );
  }

  /// Upward-floating comment bubble item with profile avatar & glow
  Widget _buildFloatingCommentItem(LiveComment comment, {double fadeOpacity = 1.0}) {
    final isStar = comment.type == LiveCommentType.star;
    final isLike = comment.type == LiveCommentType.like;
    final isGift = comment.type == LiveCommentType.gift;
    final isUser = comment.userName == 'You';
    final avatarAsset = _getAvatarForComment(comment);

    return TweenAnimationBuilder<double>(
      key: ValueKey(comment.id),
      duration: const Duration(milliseconds: 280),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, val, child) {
        return Transform.translate(
          offset: Offset(0, (1.0 - val) * 14.0), // Moves upward ("malla poga")
          child: Opacity(
            opacity: (val * fadeOpacity).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 290),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: isGift
                  ? const Color(0xEE121008)
                  : isUser
                      ? const Color(0xB31A237E)
                      : isStar
                          ? const Color(0x99181404)
                          : isLike
                              ? const Color(0x991A0810)
                              : Colors.black.withValues(alpha: 0.62),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isGift || isStar
                    ? const Color(0xAAFFD600)
                    : isUser
                        ? const Color(0x995C6BC0)
                        : isLike
                            ? const Color(0x88FF2D55)
                            : Colors.white.withValues(alpha: 0.12),
                width: 0.9,
              ),
              boxShadow: [
                BoxShadow(
                  color: isGift || isStar
                      ? const Color(0x33FFD600)
                      : Colors.black.withValues(alpha: 0.35),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAvatar(
                  radius: 12,
                  imageUrl: comment.userAvatarUrl,
                  assetPath: avatarAsset,
                ),
                const SizedBox(width: 7),
                if (isGift) ...[
                  const Text('🎁 ', style: TextStyle(fontSize: 12)),
                ] else if (isStar) ...[
                  const Icon(Icons.star_rounded, color: Color(0xFFFFD600), size: 14),
                  const SizedBox(width: 4),
                ] else if (isLike) ...[
                  const Icon(Icons.favorite_rounded, color: Color(0xFFFF2D55), size: 13),
                  const SizedBox(width: 4),
                ],
                Flexible(
                  child: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${comment.userName}  ',
                          style: TextStyle(
                            color: isUser
                                ? const Color(0xFF82B1FF)
                                : isGift || isStar
                                    ? const Color(0xFFFFD600)
                                    : isLike
                                        ? const Color(0xFFFF6482)
                                        : const Color(0xFFFFD600), // Cyber yellow
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: comment.message,
                          style: TextStyle(
                            color: isGift ? const Color(0xFFFFD600) : Colors.white,
                            fontSize: 12,
                            fontWeight: isGift ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
