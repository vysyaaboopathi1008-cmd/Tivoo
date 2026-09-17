import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_avatar.dart';
import '../../../../core/widgets/luxury_atmosphere_background.dart';
import '../../../live_stream/data/mock_live_comments.dart';
import '../../../live_stream/domain/models/live_comment.dart';
import '../../../live_stream/presentation/widgets/active_gift_animation_overlay.dart';
import '../../../live_stream/presentation/widgets/floating_hearts_overlay.dart';
import '../../../live_stream/presentation/widgets/floating_stars_overlay.dart';
import '../../../live_stream/presentation/widgets/gift_bottom_sheet.dart';
import '../../../live_stream/presentation/widgets/live_chat_list_view.dart';
import '../../../live_stream/presentation/widgets/star_up_bottom_sheet.dart';

/// Chat Room Party Screen matching Image 3:
/// - Audio Mode: 9 Member seats (Host + NO.1 to NO.8)
/// - Video Mode: 6 Member video slots
/// - Tap empty seat to join, speak with audio waves, mute/unmute mic
/// - Downside chat, Tiki Live guidelines card, and virtual gifts
class ChatRoomPartyScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final bool isEmbeddedInHome;

  const ChatRoomPartyScreen({
    super.key,
    this.onBack,
    this.isEmbeddedInHome = false,
  });

  @override
  State<ChatRoomPartyScreen> createState() => _ChatRoomPartyScreenState();
}

class _ChatRoomPartyScreenState extends State<ChatRoomPartyScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ActiveGiftAnimationOverlayState> _activeGiftKey = GlobalKey();
  final GlobalKey<FloatingHeartsOverlayState> _heartsKey = GlobalKey();
  final GlobalKey<FloatingStarsOverlayState> _starsKey = GlobalKey();

  // Mode: 0 = Audio Party (9 seats), 1 = Video Party (6 slots)
  int _partyMode = 1;

  bool _isUserSeated = false;
  int? _userSeatIndex;
  bool _isMicMuted = false;

  late final AnimationController _rippleAnimController;
  late final Animation<double> _rippleAnimation;

  late final List<LiveComment> _comments;
  Timer? _commentTimer;
  int _hostDiamonds = 6850;

  final TextEditingController _chatController = TextEditingController();

  // 8 Guest Seats for Audio Mode (Host is seat 0)
  late List<Map<String, dynamic>?> _audioSeats;

  // 6 Video Member Slots
  late List<Map<String, dynamic>?> _videoMembers;

  // Dynamic Room Viewers and Last 4 Members who joined ("142 remove panitu yatha peru irukagalo athu varanu, yaru last vargalo avuga picture varanu")
  int _viewerCount = 142;
  int _simulatedIndex = 0;
  final List<String> _recentMemberAssets = [
    AppAssets.status4,
    AppAssets.status3,
    AppAssets.status2,
    AppAssets.status1,
  ];

  @override
  void initState() {
    super.initState();
    _comments = List<LiveComment>.from(MockLiveComments.initialComments);

    _rippleAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _rippleAnimation = Tween<double>(begin: 0.8, end: 1.25).animate(
      CurvedAnimation(
        parent: _rippleAnimController,
        curve: Curves.easeInOut,
      ),
    );

    // Initial Audio Seats (Index 0 is NO.1, up to Index 7 for NO.8)
    _audioSeats = [
      {
        'name': 'Daisy',
        'asset': AppAssets.status1,
        'id': 'ID: 412091',
        'isSpeaking': true,
        'diamonds': '1.2K',
      },
      {
        'name': 'Aarya',
        'asset': AppAssets.status2,
        'id': 'ID: 558291',
        'isSpeaking': false,
        'diamonds': '850',
      },
      null, // NO.3 empty
      null, // NO.4 empty
      {
        'name': 'Mishri',
        'asset': AppAssets.status3,
        'id': 'ID: 772109',
        'isSpeaking': true,
        'diamonds': '2.4K',
      },
      null, // NO.6 empty
      null, // NO.7 empty
      null, // NO.8 empty
    ];

    // Initial 6 Video Members strictly matching reference design
    _videoMembers = [
      {
        'name': 'Rohit (Host)',
        'asset': AppAssets.status1,
        'isSpeaking': true,
        'diamonds': '6.8K',
      },
      {
        'name': 'Daisy',
        'asset': AppAssets.status2,
        'isSpeaking': true,
        'diamonds': '2.1K',
      },
      {
        'name': 'Aarya',
        'asset': AppAssets.status3,
        'isSpeaking': false,
        'diamonds': '1.5K',
      },
      {
        'name': 'Mishri',
        'asset': AppAssets.status4,
        'isSpeaking': false,
        'diamonds': '980',
      },
      {
        'name': 'Janlewa',
        'asset': AppAssets.status5,
        'isSpeaking': true,
        'diamonds': '1.1K',
      },
      {
        'name': 'Priya',
        'asset': AppAssets.status1,
        'isSpeaking': false,
        'diamonds': '740',
      },
    ];

    // Simulated chat comments & member joins
    _commentTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final simulated = [
        'Kavya: Hello everyone in the party room! ✨',
        'Praveen: Rohit bro looking sharp today 🔥',
        'Suresh: Can I take seat NO.3 please?',
        'Divya: Sent love and stars to all seats! 💖',
        'Anand: Best audio chat room on Tivoo 🎧',
      ];
      final newMemberAssets = [
        AppAssets.status5,
        AppAssets.status1,
        AppAssets.status2,
        AppAssets.status3,
        AppAssets.status4,
      ];
      final text = simulated[_simulatedIndex % simulated.length];
      final newAsset = newMemberAssets[_simulatedIndex % newMemberAssets.length];
      _simulatedIndex++;
      final parts = text.split(': ');
      setState(() {
        _viewerCount++;
        // Last member who joined / commented has picture shown at front
        _recentMemberAssets.remove(newAsset);
        _recentMemberAssets.insert(0, newAsset);
        _comments.add(
          LiveComment(
            id: 'party_${DateTime.now().millisecondsSinceEpoch}',
            userName: parts[0],
            message: parts[1],
            timestamp: DateTime.now(),
          ),
        );
      });
      _heartsKey.currentState?.addHeart();
    });
  }

  @override
  void dispose() {
    _rippleAnimController.dispose();
    _commentTimer?.cancel();
    _chatController.dispose();
    super.dispose();
  }

  void _handleJoinSeat(int seatIndex) {
    if (_isUserSeated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You are already in a seat! Tap your seat to leave.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _isUserSeated = true;
      _userSeatIndex = seatIndex;
      _audioSeats[seatIndex] = {
        'name': 'You',
        'asset': AppAssets.status5,
        'id': 'ID: 994012',
        'isSpeaking': !_isMicMuted,
        'diamonds': '0',
        'isUser': true,
      };
      _comments.add(
        LiveComment(
          id: 'join_${DateTime.now().millisecondsSinceEpoch}',
          userName: 'System',
          message: 'You joined seat NO.${seatIndex + 1}! Speak freely 🎙️',
          timestamp: DateTime.now(),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Joined seat NO.${seatIndex + 1}! You can now speak.'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF00E676),
      ),
    );
  }

  void _handleLeaveSeat() {
    if (!_isUserSeated || _userSeatIndex == null) return;
    setState(() {
      _audioSeats[_userSeatIndex!] = null;
      _isUserSeated = false;
      _userSeatIndex = null;
    });
    Navigator.of(context, rootNavigator: true).pop(); // close modal
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You left the seat.')),
    );
  }

  void _showSeatProfileSheet(Map<String, dynamic> seatData, int seatNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isMe = seatData['isUser'] == true;
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xF2161426),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(top: BorderSide(color: Color(0x33FFFFFF))),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                CustomAvatar(
                  radius: 36,
                  assetPath: seatData['asset'] as String? ?? AppAssets.status1,
                ),
                const SizedBox(height: 10),
                Text(
                  seatData['name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Seat NO.$seatNumber  •  ${seatData['id'] ?? 'ID: 882910'}',
                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x33FFB300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('🪙', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 4),
                      Text(
                        '${seatData['diamonds'] ?? '0'} Diamonds Received',
                        style: const TextStyle(
                          color: Color(0xFFFFD54F),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (isMe)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF1744),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      minimumSize: const Size(double.infinity, 44),
                    ),
                    onPressed: _handleLeaveSeat,
                    icon: const Icon(Icons.logout, color: Colors.white, size: 18),
                    label: const Text(
                      'Leave Seat',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            minimumSize: const Size(0, 44),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _handleGiftTap();
                          },
                          icon: const Icon(Icons.card_giftcard, color: Color(0xFFFF4081)),
                          label: const Text('Send Gift'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00E676),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            minimumSize: const Size(0, 44),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Followed ${seatData['name']}!'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add, color: Colors.black, size: 18),
                          label: const Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleGiftTap() {
    GiftBottomSheet.show(context, (gift) {
      setState(() {
        _hostDiamonds += gift.diamonds;
        _comments.add(
          LiveComment(
            id: 'gift_${DateTime.now().millisecondsSinceEpoch}',
            userName: 'You',
            message: 'sent ${gift.name} ${gift.icon} to the party room! 🎁',
            type: LiveCommentType.gift,
            timestamp: DateTime.now(),
          ),
        );
      });
      _activeGiftKey.currentState?.playGift(gift);
      _heartsKey.currentState?.addHeart();
      _heartsKey.currentState?.addHeart();
    });
  }

  void _handleSendComment(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _comments.add(
        LiveComment(
          id: 'user_${DateTime.now().millisecondsSinceEpoch}',
          userName: 'You',
          message: text.trim(),
          timestamp: DateTime.now(),
        ),
      );
    });
    _chatController.clear();
    _heartsKey.currentState?.addHeart();
  }

  void _handleStarTap() {
    StarUpBottomSheet.show(
      context,
      streamerName: 'rohit_rajdhanis6 (Host)',
      onSendStars: (multiplier) {
        final starPoints = multiplier * 50;
        setState(() {
          _hostDiamonds += starPoints;
          _comments.add(
            LiveComment(
              id: 'star_${DateTime.now().millisecondsSinceEpoch}',
              userName: 'You',
              message: 'boosted party room with $multiplier Stars! ⭐✨',
              type: LiveCommentType.star,
              starsCount: multiplier,
              timestamp: DateTime.now(),
            ),
          );
        });
        _starsKey.currentState?.addStars(multiplier.clamp(1, 10));
        _heartsKey.currentState?.addHeart();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = widget.isEmbeddedInHome
        ? (MediaQuery.paddingOf(context).top + 102)
        : MediaQuery.paddingOf(context).top;
    final bottomPadding = widget.isEmbeddedInHome
        ? 78.0
        : MediaQuery.paddingOf(context).bottom;

    return ActiveGiftAnimationOverlay(
      key: _activeGiftKey,
      child: FloatingStarsOverlay(
        key: _starsKey,
        child: FloatingHeartsOverlay(
          key: _heartsKey,
          child: Scaffold(
            backgroundColor: const Color(0xFF0C0A1A),
            body: Stack(
              children: [
                // 1. Party Room Aesthetic Background (Ultra-attractive Luxury Atmosphere)
                const Positioned.fill(
                  child: RepaintBoundary(
                    child: LuxuryAtmosphereBackground(),
                  ),
                ),

                // 2. Party Screen Content
                Padding(
                  padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
                  child: Column(
                    children: [
                      // Top Host Header Bar right below Home tabs (Image 2)
                      _buildTopHostHeader(),

                      const SizedBox(height: 4),

                      // Mode Switcher: 🎙️ Audio (9 Seats) vs 📹 Video (6 Slots)
                      _buildModeSwitcher(),

                      const SizedBox(height: 4),

                      // Mode: Audio 9 Seats vs Video 6 Members (Tall Cards matching Live tab)
                      if (_partyMode == 0) ...[
                        _buildAudio9SeatsArena(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: LiveChatListView(comments: _comments),
                            ),
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: Stack(
                            children: [
                              // 2-Column Scrollable Grid of 6 Tall Video Cards (childAspectRatio: 0.72)
                              Positioned.fill(
                                child: _buildVideo6SlotsArena(),
                              ),

                              // Floating Live Comments Feed (Instagram/Live style)
                              Positioned(
                                bottom: 6,
                                left: 12,
                                right: 80,
                                height: 160,
                                child: LiveChatListView(comments: _comments),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 4),

                      // Bottom Action Bar: Chat input, Share, Mic toggle, Gift button
                      _buildBottomActionBar(),
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

  /// Top Host Header Bar strictly matching Image 3:
  /// `rohit_raj...`, host badge, diamonds `🪙 6850`, viewers, close
  Widget _buildTopHostHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Row(
        children: [
          // Host Capsule
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white24, width: 0.8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomAvatar(radius: 15, assetPath: AppAssets.status1),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'rohit_rajdhanis6',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.verified, color: Color(0xFF00E676), size: 12),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🪙', style: TextStyle(fontSize: 10)),
                        const SizedBox(width: 2),
                        Text(
                          '$_hostDiamonds',
                          style: const TextStyle(
                            color: Color(0xFFFFD54F),
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0x44FF9100),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Monthly Host',
                            style: TextStyle(
                              color: Color(0xFFFFB300),
                              fontSize: 8.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // Last 4 members who joined with photos ("yaru last vargalo avuga picture varanu, last 4 member yella varanu theriyanu")
          _buildRecentMembersStack(),

          const SizedBox(width: 6),

          // Total Viewers Count ("142 remove panitu yatha peru irukagalo athu varanu")
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12, width: 0.8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person, color: Color(0xFF00E676), size: 12),
                const SizedBox(width: 3),
                Text(
                  '$_viewerCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Exit / Back Button
          GestureDetector(
            onTap: () {
              if (widget.onBack != null) {
                widget.onBack!();
              } else {
                Navigator.of(context).maybePop();
              }
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 17),
            ),
          ),
        ],
      ),
    );
  }

  /// Recent 4 Members Overlapping Avatars Stack with Glowing Latest Joiner
  Widget _buildRecentMembersStack() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$_viewerCount active members in this party room! 👥'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: SizedBox(
        width: 68,
        height: 26,
        child: Stack(
          children: List.generate(
            _recentMemberAssets.take(4).length,
            (i) => Positioned(
              left: i * 14.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: i == 0 ? const Color(0xFF00E676) : Colors.white,
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.black45, blurRadius: 4),
                  ],
                ),
                child: CustomAvatar(
                  radius: 11,
                  assetPath: _recentMemberAssets[i],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Toggle between Audio Party (9 Seats) and Video Party (6 Slots)
  Widget _buildModeSwitcher() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 34,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _partyMode = 0),
              child: Container(
                decoration: BoxDecoration(
                  color: _partyMode == 0
                      ? const Color(0xFF00E676).withValues(alpha: 0.25)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  border: _partyMode == 0
                      ? Border.all(color: const Color(0xFF00E676), width: 1.2)
                      : null,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.mic_rounded,
                      size: 14,
                      color: _partyMode == 0
                          ? const Color(0xFF00E676)
                          : Colors.white54,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Audio Party (9 Seats)',
                      style: TextStyle(
                        color: _partyMode == 0 ? Colors.white : Colors.white54,
                        fontSize: 11.5,
                        fontWeight: _partyMode == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _partyMode = 1),
              child: Container(
                decoration: BoxDecoration(
                  color: _partyMode == 1
                      ? const Color(0xFFFF2D55).withValues(alpha: 0.25)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  border: _partyMode == 1
                      ? Border.all(color: const Color(0xFFFF2D55), width: 1.2)
                      : null,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam_rounded,
                      size: 14,
                      color: _partyMode == 1
                          ? const Color(0xFFFF2D55)
                          : Colors.white54,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Video Party (6 Members)',
                      style: TextStyle(
                        color: _partyMode == 1 ? Colors.white : Colors.white54,
                        fontSize: 11.5,
                        fontWeight: _partyMode == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Audio Party Mode (9 Member Seats) strictly matching Image 5:
  /// 3x3 Grid of 9 Seats:
  /// - Row 1: Host Seat, Seat NO.1, Seat NO.2
  /// - Row 2: Seat NO.3, Seat NO.4, Seat NO.5
  /// - Row 3: Seat NO.6, Seat NO.7, Seat NO.8
  Widget _buildAudio9SeatsArena() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1: Host Seat, NO.1, NO.2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHostSeat(),
              _buildGuestSeat(0, 'NO.1'),
              _buildGuestSeat(1, 'NO.2'),
            ],
          ),

          const SizedBox(height: 10),

          // Row 2: NO.3, NO.4, NO.5
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGuestSeat(2, 'NO.3'),
              _buildGuestSeat(3, 'NO.4'),
              _buildGuestSeat(4, 'NO.5'),
            ],
          ),

          const SizedBox(height: 10),

          // Row 3: NO.6, NO.7, NO.8
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGuestSeat(5, 'NO.6'),
              _buildGuestSeat(6, 'NO.7'),
              _buildGuestSeat(7, 'NO.8'),
            ],
          ),
        ],
      ),
    );
  }

  /// Host Seat at Top-Left of 3x3 Grid (Image 5)
  Widget _buildHostSeat() {
    return GestureDetector(
      onTap: () {
        _showSeatProfileSheet({
          'name': 'rohit_rajdhanis6',
          'asset': AppAssets.status1,
          'id': 'ID: 685021',
          'diamonds': '6850',
          'isHost': true,
        }, 0);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (context, child) {
              return Container(
                width: 54,
                height: 54,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFFB300)
                        .withValues(alpha: _rippleAnimation.value.clamp(0.4, 1.0)),
                    width: 2.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFB300).withValues(alpha: 0.35),
                      blurRadius: 10 * _rippleAnimation.value,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    CustomAvatar(radius: 22, assetPath: AppAssets.status1),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Color(0xFF00E676),
                        child: Icon(Icons.mic, size: 9, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 4),
          const Text(
            'rohit_rajdhanis6',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('🪙', style: TextStyle(fontSize: 9)),
              SizedBox(width: 2),
              Text(
                '1',
                style: TextStyle(
                  color: Color(0xFFFFD54F),
                  fontSize: 9.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Guest Seat Capsule (`NO.1` to `NO.8`)
  Widget _buildGuestSeat(int index, String seatLabel) {
    final seatData = _audioSeats[index];
    final isOccupied = seatData != null;

    return GestureDetector(
      onTap: () {
        if (isOccupied) {
          _showSeatProfileSheet(seatData, index + 1);
        } else {
          _handleJoinSeat(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Seat Circle (Empty shows + icon; Occupied shows Avatar)
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOccupied
                  ? Colors.transparent
                  : Colors.white.withValues(alpha: 0.08),
              border: Border.all(
                color: isOccupied
                    ? (seatData['isSpeaking'] == true
                        ? const Color(0xFF00E676)
                        : Colors.white38)
                    : Colors.white.withValues(alpha: 0.18),
                width: isOccupied && seatData['isSpeaking'] == true ? 2.0 : 1.2,
              ),
              boxShadow: isOccupied && seatData['isSpeaking'] == true
                  ? [
                      BoxShadow(
                        color: const Color(0xFF00E676).withValues(alpha: 0.4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: isOccupied
                ? ClipOval(
                    child: Image.asset(
                      seatData['asset'] as String? ?? AppAssets.status1,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white60,
                      size: 22,
                    ),
                  ),
          ),

          const SizedBox(height: 5),

          // Seat Number / Name Label
          Text(
            isOccupied ? (seatData['name'] as String) : seatLabel,
            style: TextStyle(
              color: isOccupied ? Colors.white : Colors.white60,
              fontSize: 11,
              fontWeight: isOccupied ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Video Party Mode (6 Member Video Slots in 2-Column Grid matching Live Tab Cards)
  Widget _buildVideo6SlotsArena() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 90),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72, // Tall portrait aspect ratio matching Live tab cards!
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final member = _videoMembers[index];
        final isOccupied = member != null;

        return GestureDetector(
          onTap: () {
            if (!isOccupied) {
              setState(() {
                _videoMembers[index] = {
                  'name': 'You (Camera On)',
                  'asset': AppAssets.status5,
                  'isSpeaking': true,
                  'diamonds': '0',
                };
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Joined video slot ${index + 1}! Camera active.'),
                  backgroundColor: const Color(0xFF00E676),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF1B162C),
              border: Border.all(
                color: isOccupied
                    ? (member['isSpeaking'] == true
                        ? const Color(0xFF00E676)
                        : Colors.white12)
                    : Colors.white12,
                width: isOccupied && member['isSpeaking'] == true ? 2.0 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: isOccupied && member['isSpeaking'] == true
                      ? const Color(0xFF00E676).withValues(alpha: 0.35)
                      : Colors.black.withValues(alpha: 0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // 1. Full Cover Image / Video Feed
                  if (isOccupied)
                    Image.asset(
                      member['asset'] as String? ?? AppAssets.status1,
                      fit: BoxFit.cover,
                    )
                  else
                    Container(
                      color: const Color(0xFF161426),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white10,
                            ),
                            child: const Icon(
                              Icons.videocam_outlined,
                              color: Colors.white60,
                              size: 26,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Video Slot ${index + 1}\nTap to join',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // 2. Vertical Contrast Gradient Overlay (Live tab style)
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x66000000),
                            Colors.transparent,
                            Colors.transparent,
                            Color(0xCC000000),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.25, 0.60, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // 3. Top Badges (Red LIVE on left, Diamonds/Mic on right)
                  if (isOccupied)
                    Positioned(
                      top: 8,
                      left: 8,
                      right: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Red LIVE Badge (exact match with Live tab)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF1744),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              'LIVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),

                          // Diamonds & Mic Status
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.55),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  member['isSpeaking'] == true ? Icons.mic : Icons.mic_off,
                                  color: member['isSpeaking'] == true
                                      ? const Color(0xFF00E676)
                                      : Colors.white54,
                                  size: 10,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  member['diamonds'] as String? ?? '0',
                                  style: const TextStyle(
                                    color: Color(0xFFFFD54F),
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  // 4. Bottom Info: Streamer Avatar, Name, Flame Heat & Equalizer (Live tab style)
                  if (isOccupied)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Row(
                        children: [
                          CustomAvatar(
                            radius: 13,
                            assetPath: member['asset'] as String? ?? AppAssets.status1,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  member['name'] as String? ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(color: Colors.black, blurRadius: 4),
                                    ],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('🔥', style: TextStyle(fontSize: 10)),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${member['diamonds'] ?? '120'}',
                                      style: const TextStyle(
                                        color: Color(0xFFFF9100),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Equalizer audio indicator
                          if (member['isSpeaking'] == true)
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withValues(alpha: 0.4),
                              ),
                              child: const Icon(
                                Icons.graphic_eq_rounded,
                                color: Color(0xFF00E676),
                                size: 14,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Bottom Action Bar: Chat input, Share, Mic toggle, Star button, Gift button
  Widget _buildBottomActionBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 4, 14, 8),
      child: Row(
        children: [
          // Direct Inline Chat Input Box
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                color: const Color(0x991E1C2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                  width: 0.8,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _chatController,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      onSubmitted: (text) {
                        final trimmed = text.trim();
                        if (trimmed.isNotEmpty) {
                          _handleSendComment(trimmed);
                          _chatController.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Say hi to party room...',
                        hintStyle: TextStyle(color: Colors.white54, fontSize: 12.5),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Color(0xFF00E676),
                      size: 18,
                    ),
                    onPressed: () {
                      final trimmed = _chatController.text.trim();
                      if (trimmed.isNotEmpty) {
                        _handleSendComment(trimmed);
                        _chatController.clear();
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Mic Toggle (when user is in a seat)
          if (_isUserSeated) ...[
            GestureDetector(
              onTap: () {
                setState(() {
                  _isMicMuted = !_isMicMuted;
                  if (_userSeatIndex != null &&
                      _audioSeats[_userSeatIndex!] != null) {
                    _audioSeats[_userSeatIndex!]!['isSpeaking'] = !_isMicMuted;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isMicMuted ? 'Mic Muted' : 'Mic Live 🎙️'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isMicMuted
                       ? const Color(0xFFFF1744).withValues(alpha: 0.3)
                      : const Color(0xFF00E676).withValues(alpha: 0.3),
                  border: Border.all(
                    color: _isMicMuted
                        ? const Color(0xFFFF1744)
                        : const Color(0xFF00E676),
                  ),
                ),
                child: Icon(
                  _isMicMuted ? Icons.mic_off : Icons.mic,
                  color: _isMicMuted
                      ? const Color(0xFFFF1744)
                      : const Color(0xFF00E676),
                  size: 19,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],

          // Share Button
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Party room link copied to clipboard! 🔗'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
              child: const Icon(Icons.share_rounded, color: Colors.white70, size: 18),
            ),
          ),

          const SizedBox(width: 8),

          // Star Button (⭐)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: _handleStarTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA000)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFD700).withValues(alpha: 0.45),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Virtual Gift Button (🎁)
          GestureDetector(
            onTap: _handleGiftTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF2D55), Color(0xFFAA00FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF2D55).withValues(alpha: 0.4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Center(
                child: Text('🎁', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
