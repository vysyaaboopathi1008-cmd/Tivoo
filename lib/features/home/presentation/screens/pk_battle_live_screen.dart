import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/services/reel_video_manager.dart';
import '../../../../core/widgets/custom_avatar.dart';
import '../../../../core/widgets/live_video_player.dart';
import '../../../../core/widgets/luxury_atmosphere_background.dart';
import '../../../live_stream/domain/models/gift_item.dart';
import '../../../live_stream/domain/models/live_comment.dart';
import '../../../live_stream/presentation/widgets/active_gift_animation_overlay.dart';
import '../../../live_stream/presentation/widgets/floating_hearts_overlay.dart';
import '../../../live_stream/presentation/widgets/gift_bottom_sheet.dart';

/// Dark Luxury PK Battle Live Screen with Electric Cyber Yellow & Gold Theme
/// Integrating Full Tiki PK Reference Flows from Images 1, 2, and 3:
/// - Image 1 Screen 3: PK Setup Modal (Neha vs Arun, PK Rules, Settings, Invite, Send Invite)
/// - Image 1 Screen 4: PK Settings Modal (3 min, 5 min, 10 min pills, Countdown Display toggle, Show Timer to Audience toggle, Auto End PK toggle, Save button)
/// - Image 1 Screen 5: "Host accepted! Get ready for the PK!" with duration preview and "Start PK" button
/// - Image 1 Screens 6 & 7: Real-time countdown timer & clash score updates
/// - Image 1 Screen 8: "PK Ended" celebration screen with Winner crown, Neha congrats, Final Score, "Play Again" and "Back to Live"
/// - Image 2: Full Gift Store & Coin Top-up flow with quantity stepper [- 1 +]
/// - Image 3: Invite Host sheet & PK Request dialogs
/// - Clean upward comment flow ("malla vranu ulla poga kudathu")
class PkBattleLiveScreen extends StatefulWidget {
  final VoidCallback? onBack;

  const PkBattleLiveScreen({super.key, this.onBack});

  @override
  State<PkBattleLiveScreen> createState() => _PkBattleLiveScreenState();
}

class _PkBattleLiveScreenState extends State<PkBattleLiveScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ActiveGiftAnimationOverlayState> _activeGiftKey = GlobalKey();
  final GlobalKey<FloatingHeartsOverlayState> _heartsKey = GlobalKey();

  // Animation controllers
  late final AnimationController _giftPulseController;
  late final Animation<double> _giftPulseAnimation;
  late final AnimationController _heartBadgeController;
  late final Animation<double> _heartBadgeAnimation;

  // Streamers data - Correctly matched: Neha (female) & Arun (male)
  final String _leftStreamerName = 'Neha ✨';
  final String _leftStreamerAsset = AppAssets.status4; // Crystal clear girl portrait
  final String _leftVideoAsset = AppAssets.video2; // Female livestream video
  final String _leftLikes = '125.4K';

  String _rightStreamerName = 'Arun';
  String _rightStreamerAsset = AppAssets.status5; // Crystal clear smiling male portrait
  String _rightVideoAsset = AppAssets.video1; // Male livestream video
  final String _rightLikes = '98.2K';

  // Live Scores
  int _leftScore = 56800;
  int _rightScore = 48200;

  // PK Timer & Settings from Image 1 Screen 4
  int _battleDurationSeconds = 300; // 5 min default (300s), or 3 min (180s), or 10 min (600s)
  bool _countdownDisplay = true;
  bool _showTimerToAudience = true;
  bool _autoEndPk = true;

  final ValueNotifier<int> _secondsRemainingNotifier = ValueNotifier<int>(135);
  Timer? _countdownTimer;
  bool _isBattleEnded = false;

  // Live Comments Stream
  List<LiveComment> _comments = [];
  Timer? _commentTimer;
  Timer? _ambientHeartTimer;
  final TextEditingController _commentInputController = TextEditingController();
  final ScrollController _chatScrollController = ScrollController();
  bool _showCommentInput = false;

  // Incoming commenters pool
  final List<Map<String, String>> _incomingCommentPool = [
    {
      'name': 'Priya',
      'avatar': AppAssets.status3,
      'msg': 'Go Neha 💛',
    },
    {
      'name': 'Karthik',
      'avatar': AppAssets.status5,
      'msg': 'Super performance ❤️',
    },
    {
      'name': 'Manoj',
      'avatar': AppAssets.status2,
      'msg': 'sent Rose 🌹 x 1',
      'isGift': 'true',
    },
    {
      'name': 'Divya',
      'avatar': AppAssets.status4,
      'msg': 'sent Heart 💖 x 1',
      'isGift': 'true',
    },
    {
      'name': 'Rahul',
      'avatar': AppAssets.status5,
      'msg': 'sent Car 🏎️ x 1',
      'isGift': 'true',
    },
    {
      'name': 'Sneha',
      'avatar': AppAssets.status3,
      'msg': 'sent Crown 👑 x 1',
      'isGift': 'true',
    },
    {
      'name': 'Kavya',
      'avatar': AppAssets.status4,
      'msg': 'sent Golden Horse 🐎 x 1',
      'isGift': 'true',
    },
    {
      'name': 'Ananya',
      'avatar': AppAssets.status3,
      'msg': 'sent Ocean Whale 🐋 x 1',
      'isGift': 'true',
    },
    {
      'name': 'Sanjay',
      'avatar': AppAssets.status5,
      'msg': 'sent Angel Vehicle 🕊️ x 1',
      'isGift': 'true',
    },
    {
      'name': 'Vicky',
      'avatar': AppAssets.status2,
      'msg': 'Both are amazing 👏',
    },
    {
      'name': 'Diya',
      'avatar': AppAssets.status4,
      'msg': 'Amazing PK 🔥',
    },
  ];
  int _poolIndex = 0;

  @override
  void initState() {
    super.initState();

    // Free hardware decoders to prevent background video lag
    ReelVideoManager.instance.pauseAll();

    // 1. Gift Box Pulsing Animation
    _giftPulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _giftPulseAnimation = Tween<double>(begin: 0.95, end: 1.10).animate(
      CurvedAnimation(
        parent: _giftPulseController,
        curve: Curves.easeInOut,
      ),
    );

    // 2. Contributor Heart Badge Bouncing
    _heartBadgeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _heartBadgeAnimation = Tween<double>(begin: 0.90, end: 1.18).animate(
      CurvedAnimation(
        parent: _heartBadgeController,
        curve: Curves.elasticOut,
      ),
    );

    // Initial Comments matching reference screens: 5 newest stay bold at bottom, older ones float over video in lite mode
    _comments = [
      LiveComment(
        id: 'init_1',
        userName: 'Aarav',
        userAssetPath: AppAssets.status5,
        message: 'Neha you are rocking this! 🔥',
        timestamp: DateTime.now().subtract(const Duration(seconds: 90)),
      ),
      LiveComment(
        id: 'init_2',
        userName: 'Meera',
        userAssetPath: AppAssets.status4,
        message: "Let's win this PK battle! 👑",
        timestamp: DateTime.now().subtract(const Duration(seconds: 75)),
      ),
      LiveComment(
        id: 'init_3',
        userName: 'Suresh',
        userAssetPath: AppAssets.status2,
        message: 'Full support to Neha 💛',
        timestamp: DateTime.now().subtract(const Duration(seconds: 60)),
      ),
      LiveComment(
        id: 'init_4',
        userName: 'Priya',
        userAssetPath: AppAssets.status3,
        message: 'Go Neha 💛',
        timestamp: DateTime.now().subtract(const Duration(seconds: 45)),
      ),
      LiveComment(
        id: 'init_5',
        userName: 'Karthik',
        userAssetPath: AppAssets.status5,
        message: 'Super performance ❤️',
        timestamp: DateTime.now().subtract(const Duration(seconds: 35)),
      ),
      LiveComment(
        id: 'init_6',
        userName: 'Manoj',
        userAssetPath: AppAssets.status2,
        message: 'sent Rose 🌹 x 1',
        type: LiveCommentType.gift,
        timestamp: DateTime.now().subtract(const Duration(seconds: 25)),
      ),
      LiveComment(
        id: 'init_7',
        userName: 'Divya',
        userAssetPath: AppAssets.status4,
        message: 'sent Heart 💖 x 1',
        type: LiveCommentType.gift,
        timestamp: DateTime.now().subtract(const Duration(seconds: 15)),
      ),
      LiveComment(
        id: 'init_8',
        userName: 'Rahul',
        userAssetPath: AppAssets.status5,
        message: 'sent Car 🏎️ x 1',
        type: LiveCommentType.gift,
        timestamp: DateTime.now().subtract(const Duration(seconds: 5)),
      ),
      LiveComment(
        id: 'init_9',
        userName: 'Sneha',
        userAssetPath: AppAssets.status3,
        message: 'Keep going Neha! 🌟',
        timestamp: DateTime.now(),
      ),
    ];

    _startCountdown();

    // Ambient floating yellow stars & hearts strictly for the supported streamer (Neha ✨ on left)
    _ambientHeartTimer = Timer.periodic(const Duration(milliseconds: 900), (_) {
      if (!mounted) return;
      _heartsKey.currentState?.addHeart(toLeft: true);
    });

    // Auto-stream incoming comments
    _commentTimer = Timer.periodic(const Duration(seconds: 7), (_) {
      if (!mounted) return;
      final item = _incomingCommentPool[_poolIndex % _incomingCommentPool.length];
      _poolIndex++;

      final isGift = item['isGift'] == 'true';
      final newComment = LiveComment(
        id: 'comm_${DateTime.now().millisecondsSinceEpoch}',
        userName: item['name']!,
        userAssetPath: item['avatar']!,
        message: item['msg']!,
        type: isGift ? LiveCommentType.gift : LiveCommentType.chat,
        timestamp: DateTime.now(),
      );

      setState(() {
        _comments = List<LiveComment>.from(_comments)..add(newComment);
        _leftScore += isGift ? 120 : 35;
        _rightScore += isGift ? 90 : 25;
      });
      _scrollToLatestComment();

      if (isGift) {
        final rawMsg = item['msg']!;
        GiftItem? targetGift;
        if (rawMsg.contains('Car')) {
          targetGift = const GiftItem(
            id: 'super_car',
            name: 'Car',
            icon: '🏎️',
            diamonds: 500,
            imageAssetPath: AppAssets.giftSuperCar,
          );
        } else if (rawMsg.contains('Rose')) {
          targetGift = const GiftItem(
            id: 'rose',
            name: 'Rose',
            icon: '🌹',
            diamonds: 1,
            imageAssetPath: AppAssets.giftRose,
          );
        } else if (rawMsg.contains('Heart')) {
          targetGift = const GiftItem(
            id: 'love',
            name: 'Heart',
            icon: '💖',
            diamonds: 10,
            imageAssetPath: AppAssets.giftLove,
          );
        } else if (rawMsg.contains('Crown')) {
          targetGift = const GiftItem(
            id: 'crown',
            name: 'Crown',
            icon: '👑',
            diamonds: 1000,
            imageAssetPath: AppAssets.giftCrown,
          );
        } else if (rawMsg.contains('Golden Horse')) {
          targetGift = const GiftItem(
            id: 'golden_horse',
            name: 'Golden Horse',
            icon: '🐎',
            diamonds: 2500,
            imageAssetPath: AppAssets.giftGoldenHorse,
          );
        } else if (rawMsg.contains('Ocean Whale')) {
          targetGift = const GiftItem(
            id: 'ocean_whale',
            name: 'Ocean Whale',
            icon: '🐋',
            diamonds: 4000,
            imageAssetPath: AppAssets.giftOceanWhale,
          );
        } else if (rawMsg.contains('Angel Vehicle')) {
          targetGift = const GiftItem(
            id: 'angel_vehicle',
            name: 'Angel Vehicle',
            icon: '🕊️',
            diamonds: 3500,
            imageAssetPath: AppAssets.giftAngelVehicle,
          );
        }

        if (targetGift != null) {
          _activeGiftKey.currentState?.playGift(
            targetGift,
            senderName: item['name']!,
            toLeft: true,
            recipient: 'Neha ✨',
          );
        }
      }
    });
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_secondsRemainingNotifier.value > 0) {
        _secondsRemainingNotifier.value--;
      } else if (!_isBattleEnded) {
        if (_autoEndPk) {
          setState(() => _isBattleEnded = true);
        }
      }
    });
  }

  void _scrollToLatestComment() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_chatScrollController.hasClients) {
        _chatScrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSendComment(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final userComment = LiveComment(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      userName: 'You',
      userAssetPath: AppAssets.status5,
      message: trimmed,
      timestamp: DateTime.now(),
    );

    setState(() {
      _comments = List<LiveComment>.from(_comments)..add(userComment);
      _leftScore += 25;
      _showCommentInput = false;
    });
    _commentInputController.clear();
    _scrollToLatestComment();
    _heartsKey.currentState?.addHeart(toLeft: true);
    _heartsKey.currentState?.addHeart(toLeft: true);
  }

  /// Gift Tap with Recipient Selection (Neha vs Arun) and Quantity Stepper
  void _handleGiftTap() {
    GiftBottomSheet.show(
      context,
      (gift) => _processGift(gift, 1, recipient: 'Neha ✨'),
      recipients: const ['Neha ✨', 'Arun'],
      initialRecipient: 'Neha ✨',
      onGiftWithQuantitySelected: (gift, quantity) {
        _processGift(gift, quantity, recipient: 'Neha ✨');
      },
      onGiftWithRecipientSelected: (gift, quantity, recipient) {
        _processGift(gift, quantity, recipient: recipient);
      },
    );
  }

  void _processGift(GiftItem gift, int quantity, {String recipient = 'Neha ✨'}) {
    final bool toOpponent = recipient.toLowerCase().contains('arun') || recipient != 'Neha ✨';
    final points = gift.diamonds * 15 * quantity;

    setState(() {
      if (toOpponent) {
        _rightScore += points;
      } else {
        _leftScore += points;
      }
      _comments = List<LiveComment>.from(_comments)
        ..add(
          LiveComment(
            id: 'gift_${DateTime.now().millisecondsSinceEpoch}',
            userName: 'You',
            userAssetPath: AppAssets.status5,
            message: 'sent ${gift.name} ${gift.icon} x $quantity to $recipient',
            type: LiveCommentType.gift,
            timestamp: DateTime.now(),
          ),
        );
    });
    _scrollToLatestComment();
    _activeGiftKey.currentState?.playGift(
      gift,
      senderName: 'You',
      count: quantity,
      toLeft: !toOpponent,
      recipient: recipient,
    );

    // User requirement: When gifting the opposite streamer, stars go strictly to THEIR side (RIGHT side)
    // NEVER in the center! When gifting Neha, stars go strictly to the LEFT side.
    final bool flyToLeft = !toOpponent;
    _heartsKey.currentState?.addHeart(toLeft: flyToLeft);
  }

  // ===========================================================================
  // PK BATTLE FLOW: TWO WAYS TO FIND OPPONENT (Image 1 & Image 2)
  // Screen 2: Choose PK Mode (Random Matching vs Search & Select)
  // ===========================================================================
  void _showPkSetupModal() {
    _showChoosePkModeSheet();
  }

  /// Screen 2: Choose PK Mode Bottom Sheet
  void _showChoosePkModeSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Color(0xFF101018),
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            border: Border(top: BorderSide(color: Color(0x66FFD600), width: 1.5)),
            boxShadow: [
              BoxShadow(
                color: Color(0x33FFD600),
                blurRadius: 28,
                spreadRadius: -4,
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag Handle
                Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 18),

                // Crossed Swords ⚔️ Header
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Color(0xFFBA43F6), Color(0xFF00E5FF)],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x88BA43F6),
                        blurRadius: 18,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('⚔️', style: TextStyle(fontSize: 28)),
                  ),
                ),
                const SizedBox(height: 10),

                const Text(
                  'PK Battle',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),

                const Text(
                  'Choose a way to find your opponent',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 22),

                // OPTION 1: 🎲 Random Matching ("Find a random live creator")
                GestureDetector(
                  onTap: () {
                    Navigator.pop(ctx);
                    _showRandomMatchingSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2A1024), Color(0xFF1B101E)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFF2D78), width: 1.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33FF2D78),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF2D78).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Center(
                            child: Text('🎲', style: TextStyle(fontSize: 26)),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Random Matching',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Find a random live creator',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xFFFF2D78),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // OPTION 2: 🔍 Search & Select ("Find and invite a specific creator")
                GestureDetector(
                  onTap: () {
                    Navigator.pop(ctx);
                    _showSearchAndSelectSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0F1E2E), Color(0xFF0E1624)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF00E5FF), width: 1.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3300E5FF),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00E5FF).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Center(
                            child: Icon(Icons.search_rounded, color: Color(0xFF00E5FF), size: 28),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Search & Select',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Find and invite a specific creator',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xFF00E5FF),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Bottom Links: PK Rules & PK Settings
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(ctx);
                        _showPkRulesDialog();
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.shield_outlined, color: Color(0xFFFFD600), size: 16),
                          SizedBox(width: 6),
                          Text(
                            'PK Rules',
                            style: TextStyle(
                              color: Color(0xFFFFD600),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.chevron_right_rounded, color: Color(0xFFFFD600), size: 16),
                        ],
                      ),
                    ),
                    const SizedBox(width: 28),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(ctx);
                        _showPkSettingsModal();
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.settings_outlined, color: Colors.white70, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.chevron_right_rounded, color: Colors.white70, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // OPTION 1 FLOW: RANDOM MATCHING (Image 1 Screen 3 & Image 2 Step 1)
  // Cosmic Radar Animation with orbiting creator avatars
  // ===========================================================================
  void _showRandomMatchingSheet() {
    Timer? matchTimer;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      builder: (sheetCtx) {
        // Auto-match after 2.8 seconds
        matchTimer = Timer(const Duration(milliseconds: 2800), () {
          if (Navigator.canPop(sheetCtx)) {
            Navigator.pop(sheetCtx);
            _showMatchFoundDialog('Arjun', AppAssets.status5, '8.3K', AppAssets.video1);
          }
        });

        final nearbyAvatars = [
          AppAssets.status1,
          AppAssets.status2,
          AppAssets.status3,
          AppAssets.status4,
          AppAssets.status5,
          AppAssets.status1,
        ];

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF0F0E17),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            border: Border(top: BorderSide(color: Color(0x66FF2D78), width: 1.5)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),

                // Top Dice Icon & Title
                const Text('🎲', style: TextStyle(fontSize: 34)),
                const SizedBox(height: 6),
                const Text(
                  'Random Matching',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Finding a live creator for you...',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 28),

                // Cosmic Radar Scanning Circle
                SizedBox(
                  width: 240,
                  height: 240,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Radar Ring
                      Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x3300E5FF), width: 1.5),
                        ),
                      ),
                      // Middle Radar Ring
                      Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x55FF2D78), width: 1.5),
                        ),
                      ),
                      // Inner Pulsing Node: "Searching..."
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFF00E5FF), Color(0xFF1A237E)],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xAA00E5FF),
                              blurRadius: 24,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Searching...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),

                      // Orbiting Creator Avatars
                      ...List.generate(nearbyAvatars.length, (i) {
                        final angle = (i / nearbyAvatars.length) * 2 * pi;
                        final radius = 95.0;
                        final x = cos(angle) * radius;
                        final y = sin(angle) * radius;

                        return Transform.translate(
                          offset: Offset(x, y),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: i.isEven ? const Color(0xFFFF2D78) : const Color(0xFF00E5FF),
                                width: 1.8,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: (i.isEven ? const Color(0xFFFF2D78) : const Color(0xFF00E5FF))
                                      .withValues(alpha: 0.6),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: CustomAvatar(radius: 18, assetPath: nearbyAvatars[i]),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                const Text(
                  'Please wait, we\'ll find the best match for you.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 20),

                // Cancel Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    onPressed: () {
                      matchTimer?.cancel();
                      Navigator.pop(sheetCtx);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // SCREEN 4: Match Found! (Image 1 Screen 4 & Image 2 Step 2 & 4)
  // Neha ❤️ 12.5K VS Arjun 💙 8.3K with 15s countdown
  // ===========================================================================
  void _showMatchFoundDialog(String rivalName, String rivalAsset, String rivalLikes, String rivalVideo) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: false,
      builder: (dialogCtx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF12101C),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFFFF2D78), width: 1.8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x66FF2D78),
                  blurRadius: 28,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Icon & Title
                const Text('👥', style: TextStyle(fontSize: 32)),
                const SizedBox(height: 6),
                const Text(
                  'Match Found!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Waiting for the other creator to accept...',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 22),

                // Neha VS Arjun Avatars with Hearts & Views
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Host (Neha)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFFF2D78), width: 2.5),
                            boxShadow: const [
                              BoxShadow(color: Color(0x66FF2D78), blurRadius: 12),
                            ],
                          ),
                          child: CustomAvatar(radius: 36, assetPath: _leftStreamerAsset),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Neha 💕',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5),
                        ),
                        const Text(
                          '❤️ 12.5K',
                          style: TextStyle(color: Color(0xFFFF2D78), fontSize: 11, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),

                    const SizedBox(width: 14),

                    // Neon VS Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF2D78), Color(0xFF00E5FF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Color(0x88FF2D78), blurRadius: 10),
                        ],
                      ),
                      child: const Text(
                        'VS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // Opponent (Arjun)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF00E5FF), width: 2.5),
                            boxShadow: const [
                              BoxShadow(color: Color(0x6600E5FF), blurRadius: 12),
                            ],
                          ),
                          child: CustomAvatar(radius: 36, assetPath: rivalAsset),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          rivalName,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5),
                        ),
                        Text(
                          '💙 $rivalLikes',
                          style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 11, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                // 15s Countdown Ring Badge matching Screen 4
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFFF2D78), width: 2),
                    color: const Color(0x33FF2D78),
                  ),
                  child: const Center(
                    child: Text(
                      '15s',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),

                // Button 1: "Accept PK" (Glowing Pink Gradient)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF2D78),
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xCCFF2D78),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    onPressed: () {
                      Navigator.pop(dialogCtx);
                      _showOpponentAcceptedCountdown(rivalName, rivalAsset, rivalVideo);
                    },
                    child: const Text(
                      'Accept PK',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 0.5),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Button 2: "Decline"
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogCtx);
                    _showPkNotificationBanner(
                      title: 'PK Declined',
                      message: 'You declined the PK match.',
                      icon: Icons.cancel_outlined,
                      color: const Color(0xFFFF5252),
                    );
                  },
                  child: const Text(
                    'Decline',
                    style: TextStyle(color: Colors.white54, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // OPPONENT ACCEPTED COUNTDOWN (Image 2 Step 4: 3 -> 2 -> 1 -> PK Live Starts)
  // ===========================================================================
  void _showOpponentAcceptedCountdown(String rivalName, String rivalAsset, String rivalVideo) {
    int count = 3;

    showDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            Timer.periodic(const Duration(seconds: 1), (timer) {
              if (count > 1) {
                if (ctx.mounted) {
                  setDialogState(() => count--);
                }
              } else {
                timer.cancel();
                if (Navigator.canPop(ctx)) {
                  Navigator.pop(ctx);
                  setState(() {
                    _rightStreamerName = rivalName;
                    _rightStreamerAsset = rivalAsset;
                    _rightVideoAsset = rivalVideo;
                    _secondsRemainingNotifier.value = _battleDurationSeconds;
                    _leftScore = 12340;
                    _rightScore = 9870;
                    _isBattleEnded = false;
                  });
                  _startCountdown();
                  _showPkNotificationBanner(
                    title: '⚔️ PK Live Started!',
                    message: 'Compete, send gifts & enjoy the battle!',
                    icon: Icons.flash_on_rounded,
                    color: const Color(0xFFFFD600),
                  );
                }
              }
            });

            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                decoration: BoxDecoration(
                  color: const Color(0xFF141020),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: const Color(0xFFFFD600), width: 2),
                  boxShadow: const [
                    BoxShadow(color: Color(0x66FFD600), blurRadius: 28, spreadRadius: 2),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00E5FF), width: 2),
                      ),
                      child: CustomAvatar(radius: 36, assetPath: rivalAsset),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Opponent Accepted!',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Get ready! PK is starting...',
                      style: TextStyle(color: Colors.white60, fontSize: 13),
                    ),
                    const SizedBox(height: 20),

                    // Big Animated Countdown 3 - 2 - 1 Circle
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const RadialGradient(
                          colors: [Color(0xFFFFEA00), Color(0xFFFF2D78)],
                        ),
                        boxShadow: const [
                          BoxShadow(color: Color(0xCCFFD600), blurRadius: 24, spreadRadius: 3),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ===========================================================================
  // OPTION 2 FLOW: SEARCH & SELECT PK (Image 1 Option 2 & Image 2 Section 2)
  // Creator list with Live Now, Recommended, Following tabs & pink PK buttons
  // ===========================================================================
  void _showSearchAndSelectSheet() {
    String selectedTab = 'Live Now';

    final creators = [
      {'name': 'Riya', 'viewers': '28.4K', 'asset': AppAssets.status4, 'video': AppAssets.video2},
      {'name': 'Arjun', 'viewers': '22.1K', 'asset': AppAssets.status5, 'video': AppAssets.video1},
      {'name': 'Simran', 'viewers': '18.7K', 'asset': AppAssets.status1, 'video': AppAssets.video3},
      {'name': 'Karthik', 'viewers': '16.5K', 'asset': AppAssets.status2, 'video': AppAssets.video4},
      {'name': 'Pooja', 'viewers': '14.3K', 'asset': AppAssets.status3, 'video': AppAssets.video5},
      {'name': 'Vikram', 'viewers': '12.1K', 'asset': AppAssets.status5, 'video': AppAssets.video6},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetCtx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.82,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF101018),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                border: Border(top: BorderSide(color: Color(0x6600E5FF), width: 1.5)),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: 38,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Top Bar: < Search & Select
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(sheetCtx),
                          child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Search & Select',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Search creators (name or ID)
                    Container(
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF181822),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search_rounded, color: Colors.white54, size: 20),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Search creators (name or ID)',
                              style: TextStyle(color: Colors.white38, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Filter Tabs: Live Now | Recommended | Following
                    Row(
                      children: ['Live Now', 'Recommended', 'Following'].map((tab) {
                        final isSel = selectedTab == tab;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => setSheetState(() => selectedTab = tab),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSel ? const Color(0xFFFF2D78) : const Color(0xFF1A1A26),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isSel ? const Color(0xFFFF2D78) : Colors.white12,
                                ),
                              ),
                              child: Text(
                                tab,
                                style: TextStyle(
                                  color: isSel ? Colors.white : Colors.white70,
                                  fontSize: 12,
                                  fontWeight: isSel ? FontWeight.bold : FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 14),

                    // Creator List with pink PK button
                    Expanded(
                      child: ListView.builder(
                        itemCount: creators.length,
                        itemBuilder: (context, index) {
                          final c = creators[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF14141E),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color(0xFFFF2D78), width: 1.5),
                                      ),
                                      child: CustomAvatar(radius: 22, assetPath: c['asset'] as String),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFF2D78),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: const Text(
                                          'LIVE',
                                          style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        c['name'] as String,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '❤️ ${c['viewers']} viewers',
                                        style: const TextStyle(
                                          color: Color(0xFFFF2D78),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Pink PK Pill Button matching Image 1 Option 2 Screen 1
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF2D78),
                                    foregroundColor: Colors.white,
                                    elevation: 4,
                                    shadowColor: const Color(0x66FF2D78),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(sheetCtx);
                                    _showSendPkRequestDialog(
                                      c['name'] as String,
                                      c['asset'] as String,
                                      c['viewers'] as String,
                                      c['video'] as String,
                                    );
                                  },
                                  child: const Text(
                                    'PK',
                                    style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ===========================================================================
  // SEND PK REQUEST DIALOG (Image 1 Option 2 Screen 2 & Image 2 Step 2)
  // ===========================================================================
  void _showSendPkRequestDialog(String name, String asset, String viewers, String video) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogCtx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF14101E),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFFFF2D78), width: 1.8),
              boxShadow: const [
                BoxShadow(color: Color(0x66FF2D78), blurRadius: 24),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFFF2D78), width: 2.5),
                    boxShadow: const [
                      BoxShadow(color: Color(0x88FF2D78), blurRadius: 16),
                    ],
                  ),
                  child: CustomAvatar(radius: 44, assetPath: asset),
                ),
                const SizedBox(height: 12),
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '❤️ $viewers viewers',
                  style: const TextStyle(color: Color(0xFFFF2D78), fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Send PK Request?',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '$name will receive a request to join PK battle.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white60, fontSize: 12.5),
                ),
                const SizedBox(height: 22),

                // Button: Send Request (Pink Gradient)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF2D78),
                      foregroundColor: Colors.white,
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    onPressed: () {
                      Navigator.pop(dialogCtx);
                      _showWaitingForResponseDialog(name, asset, viewers, video);
                    },
                    child: const Text(
                      'Send Request',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // WAITING FOR RESPONSE / REQUEST SENT (Image 1 Option 2 Screen 3 & Image 2 Step 3)
  // ===========================================================================
  void _showWaitingForResponseDialog(String name, String asset, String viewers, String video) {
    Timer? waitingTimer;

    showDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: false,
      builder: (dialogCtx) {
        waitingTimer = Timer(const Duration(milliseconds: 2500), () {
          if (Navigator.canPop(dialogCtx)) {
            Navigator.pop(dialogCtx);
            _showOpponentAcceptedCountdown(name, asset, video);
          }
        });

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: const Color(0xFF141020),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFF00E5FF), width: 1.8),
              boxShadow: const [
                BoxShadow(color: Color(0x6600E5FF), blurRadius: 28),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Glowing Airplane / Hourglass icon
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Color(0xFF00E5FF), Color(0xFF0D47A1)],
                    ),
                    boxShadow: const [
                      BoxShadow(color: Color(0xAA00E5FF), blurRadius: 20, spreadRadius: 2),
                    ],
                  ),
                  child: const Center(
                    child: Text('✈️', style: TextStyle(fontSize: 34)),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'PK Request Sent!',
                  style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  '$name will be notified. Please wait...',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 20),

                // Countdown badge: 30s
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0x3300E5FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF00E5FF)),
                  ),
                  child: const Text(
                    '30s',
                    style: TextStyle(color: Color(0xFF00E5FF), fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 22),

                // Cancel Request Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white70,
                      side: const BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      waitingTimer?.cancel();
                      Navigator.pop(dialogCtx);
                    },
                    child: const Text('Cancel Request', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // PK NOTIFICATION TOAST BANNER (Image 2 Bottom Section: PK Notification Types)
  // ===========================================================================
  void _showPkNotificationBanner({
    required String title,
    required String message,
    required IconData icon,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * 0.78,
          left: 14,
          right: 14,
        ),
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF141220),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 16,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Text('Now', style: TextStyle(color: Colors.white38, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // IMAGE 1 SCREEN 4: PK Settings (Set Timer Duration & Toggles)
  // ===========================================================================
  void _showPkSettingsModal() {
    int tempDuration = _battleDurationSeconds;
    bool tempCountdown = _countdownDisplay;
    bool tempShowAudience = _showTimerToAudience;
    bool tempAutoEnd = _autoEndPk;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF101018),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                border: Border(top: BorderSide(color: Color(0x55FFD600), width: 1.5)),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 38,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Header: < PK Settings
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(ctx),
                          child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                        ),
                        const SizedBox(width: 14),
                        const Text(
                          'PK Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Section 1: ⏱️ Battle Duration
                    Row(
                      children: const [
                        Icon(Icons.timer_rounded, color: Color(0xFFFFD600), size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Battle Duration',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // 3 min | 5 min | 10 min pills matching Screen 4
                    Row(
                      children: [
                        _buildDurationPill(
                          title: '3 min',
                          seconds: 180,
                          selectedSeconds: tempDuration,
                          onTap: () => setModalState(() => tempDuration = 180),
                        ),
                        const SizedBox(width: 10),
                        _buildDurationPill(
                          title: '5 min',
                          seconds: 300,
                          selectedSeconds: tempDuration,
                          onTap: () => setModalState(() => tempDuration = 300),
                        ),
                        const SizedBox(width: 10),
                        _buildDurationPill(
                          title: '10 min',
                          seconds: 600,
                          selectedSeconds: tempDuration,
                          onTap: () => setModalState(() => tempDuration = 600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Section 2: Switch Toggles
                    _buildSwitchRow(
                      icon: Icons.alarm_on_rounded,
                      title: 'Countdown Display',
                      value: tempCountdown,
                      onChanged: (val) => setModalState(() => tempCountdown = val),
                    ),
                    const SizedBox(height: 12),

                    _buildSwitchRow(
                      icon: Icons.visibility_rounded,
                      title: 'Show Timer to Audience',
                      value: tempShowAudience,
                      onChanged: (val) => setModalState(() => tempShowAudience = val),
                    ),
                    const SizedBox(height: 12),

                    _buildSwitchRow(
                      icon: Icons.group_work_rounded,
                      title: 'Auto End PK',
                      value: tempAutoEnd,
                      onChanged: (val) => setModalState(() => tempAutoEnd = val),
                    ),
                    const SizedBox(height: 24),

                    // Gradient "Save" Button matching Screen 4
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF2D78),
                          foregroundColor: Colors.white,
                          elevation: 6,
                          shadowColor: const Color(0xAAFF2D78),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                        ),
                        onPressed: () {
                          Navigator.pop(ctx);
                          setState(() {
                            _battleDurationSeconds = tempDuration;
                            _countdownDisplay = tempCountdown;
                            _showTimerToAudience = tempShowAudience;
                            _autoEndPk = tempAutoEnd;
                            _secondsRemainingNotifier.value = tempDuration;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('⏱️ PK Duration set to ${tempDuration ~/ 60} min!'),
                              backgroundColor: const Color(0xFFFFD600),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDurationPill({
    required String title,
    required int seconds,
    required int selectedSeconds,
    required VoidCallback onTap,
  }) {
    final isSelected = seconds == selectedSeconds;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFF2D78) : const Color(0xFF1B1B26),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? const Color(0xFFFFD600) : Colors.white12,
              width: isSelected ? 1.8 : 1.0,
            ),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Color(0x66FF2D78),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: const Color(0xFFFFD600),
          activeTrackColor: const Color(0x66FFD600),
          inactiveThumbColor: Colors.white38,
          inactiveTrackColor: Colors.white12,
        ),
      ],
    );
  }

  void _showPkRulesDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: const Color(0xFF14141E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Color(0xFFFFD600), width: 1.5),
          ),
          title: const Text(
            '📜 Official PK Rules',
            style: TextStyle(color: Color(0xFFFFD600), fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('1. PK Battle duration is configurable (3, 5, or 10 min).', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text('2. Every gift sent boosts the host\'s clash score bar.', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text('3. When the timer reaches 00:00, the host with the higher score wins!', style: TextStyle(color: Colors.white70)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Got it', style: TextStyle(color: Color(0xFFFFD600), fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  String _formatDuration(int totalSecs) {
    final mins = (totalSecs ~/ 60).toString().padLeft(2, '0');
    final secs = (totalSecs % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  @override
  void dispose() {
    ReelVideoManager.instance.pauseAll();
    _giftPulseController.dispose();
    _heartBadgeController.dispose();
    _ambientHeartTimer?.cancel();
    _countdownTimer?.cancel();
    _commentTimer?.cancel();
    _commentInputController.dispose();
    _chatScrollController.dispose();
    _secondsRemainingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final arenaHeight = (screenHeight * 0.42).clamp(280.0, 360.0);

    final totalScore = (_leftScore + _rightScore).clamp(1, double.infinity).toDouble();
    final leftFlex = ((_leftScore / totalScore) * 100).toInt().clamp(18, 82);
    final rightFlex = 100 - leftFlex;

    return ActiveGiftAnimationOverlay(
      key: _activeGiftKey,
      child: FloatingHeartsOverlay(
        key: _heartsKey,
        alignLeft: true, // Stars and hearts fly to the supported streamer (Neha ✨ on left side)
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFF070709),
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTapDown: (details) {
              final screenWidth = MediaQuery.sizeOf(context).width;
              final isTapOnLeft = details.globalPosition.dx < (screenWidth * 0.5);
              if (isTapOnLeft) {
                setState(() => _leftScore += 20);
                _heartsKey.currentState?.addHeart(toLeft: true);
                _heartsKey.currentState?.addHeart(toLeft: true);
              } else {
                setState(() => _rightScore += 20);
                _heartsKey.currentState?.addHeart(toLeft: false);
                _heartsKey.currentState?.addHeart(toLeft: false);
              }
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Atmosphere Background
                const RepaintBoundary(
                  child: LuxuryAtmosphereBackground(),
                ),

                SafeArea(
                  child: Column(
                    children: [
                      // Video Arena + Streamer Headers + Center PK Timer
                      SizedBox(
                        height: arenaHeight,
                        child: Stack(
                          children: [
                            _buildSplitVideoArena(),

                            // Top Streamer Capsules
                            Positioned(
                              top: 6,
                              left: 8,
                              right: 8,
                              child: _buildTopStreamerHeaders(),
                            ),

                            // Center PK Timer Badge
                            if (_countdownDisplay)
                              Positioned(
                                top: 48,
                                left: 0,
                                right: 0,
                                child: Center(child: _buildCenterPkBadge()),
                              ),
                          ],
                        ),
                      ),

                      // Clash Score Bar
                      _buildClashScoreBar(leftFlex, rightFlex),

                      // Top Contributors Row
                      _buildContributorsRow(),

                      // Flexible space keeping action bar anchored at bottom
                      const Spacer(),

                      // Bottom Action Bar
                      _buildBottomActionBar(),
                    ],
                  ),
                ),

                // Continuous Live Chat Feed strictly kept in the area BELOW the video arena + contributors
                // NEVER overlaps onto the video area ("complusory video ku ulla poga kudathu")
                Positioned(
                  left: 12,
                  width: (MediaQuery.sizeOf(context).width * 0.70).clamp(240.0, 310.0),
                  top: arenaHeight + 82,
                  bottom: 64,
                  child: _buildGlassmorphicChatFeed(),
                ),

                // Highlighted Cyber Yellow Animated Gift Button (Floating above action bar)
                Positioned(
                  right: 12,
                  bottom: 64,
                  child: _buildPulsingGiftButton(),
                ),

                // Winner Celebration Screen (Screen 8 & 10)
                if (_isBattleEnded) _buildWinnerCelebrationScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 1. Side-by-Side Video Arena
  Widget _buildSplitVideoArena() {
    return RepaintBoundary(
      child: Row(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                LiveVideoPlayer(
                  key: const ValueKey('pk_left_stream_video'),
                  playerId: 'pk_left_stream',
                  videoAssetPath: _leftVideoAsset,
                  placeholderAssetPath: _leftStreamerAsset,
                  fit: BoxFit.cover,
                  autoPlay: true,
                  isMuted: true,
                  showSoundToggle: false,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [Color(0x99000000), Colors.transparent],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.5,
            color: const Color(0x44FFD600),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                LiveVideoPlayer(
                  key: ValueKey('pk_right_stream_video_$_rightVideoAsset'),
                  playerId: 'pk_right_stream',
                  videoAssetPath: _rightVideoAsset,
                  placeholderAssetPath: _rightStreamerAsset,
                  fit: BoxFit.cover,
                  autoPlay: true,
                  isMuted: true,
                  showSoundToggle: false,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [Color(0x99000000), Colors.transparent],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 2. Top Streamer Headers - Symmetrical, balanced capsules with Settings & Close buttons on far right
  Widget _buildTopStreamerHeaders() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Streamer Capsule (Neha ✨) - Symmetrical & Clean
            Flexible(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3.5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0x66FFD600), width: 1.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFFD600), width: 1.5),
                      ),
                      child: CustomAvatar(radius: 13, assetPath: _leftStreamerAsset),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _leftStreamerName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('💖 ', style: TextStyle(fontSize: 9.0)),
                              Text(
                                _leftLikes,
                                style: const TextStyle(
                                  color: Color(0xFFFFD600),
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 3),
            _buildOverlappingGifters([AppAssets.status3, AppAssets.status4]),

            const Spacer(),

            _buildOverlappingGifters([AppAssets.status5, AppAssets.status2]),
            const SizedBox(width: 3),

            // Right Streamer Capsule (Arun) - Exactly Symmetrical with Left Streamer
            Flexible(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3.5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0x6600E5FF), width: 1.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00E5FF), width: 1.5),
                      ),
                      child: CustomAvatar(radius: 13, assetPath: _rightStreamerAsset),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _rightStreamerName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('💖 ', style: TextStyle(fontSize: 9.0)),
                              Text(
                                _rightLikes,
                                style: const TextStyle(
                                  color: Color(0xFF00E5FF),
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 4),

            // Quick Settings (⚙️)
            GestureDetector(
              onTap: _showPkSettingsModal,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1.0),
                ),
                child: const Icon(Icons.settings_rounded, color: Color(0xFFFFD600), size: 14),
              ),
            ),

            const SizedBox(width: 4),

            // Close (✖️) Button
            GestureDetector(
              onTap: () {
                if (widget.onBack != null) {
                  widget.onBack!();
                } else {
                  Navigator.of(context).maybePop();
                }
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1.0),
                ),
                child: const Icon(Icons.close_rounded, color: Colors.white, size: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Consistent overlapping viewer avatars matching LiveStreamTopBar
  Widget _buildOverlappingGifters(List<String> assets) {
    return SizedBox(
      width: 24.0 + (assets.length - 1) * 14.0,
      height: 26,
      child: Stack(
        children: [
          for (int i = 0; i < assets.length; i++)
            Positioned(
              left: i * 14.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black45, blurRadius: 4),
                  ],
                ),
                child: CustomAvatar(radius: 11, assetPath: assets[i]),
              ),
            ),
        ],
      ),
    );
  }

  /// 3. Center Glowing PK Timer Badge: Tapping opens PK Setup & Settings (Image 1 Screen 3 & 4)
  Widget _buildCenterPkBadge() {
    return GestureDetector(
      onTap: _showPkSetupModal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4.5),
        decoration: BoxDecoration(
          color: const Color(0xEE121008),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFFD600), width: 1.6),
          boxShadow: const [
            BoxShadow(
              color: Color(0xAAFFD600),
              blurRadius: 14,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFFEA00), Color(0xFFFF9100)],
              ).createShader(bounds),
              child: const Text(
                'PK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Text('⏰', style: TextStyle(fontSize: 12)),
            const SizedBox(width: 4),
            ValueListenableBuilder<int>(
              valueListenable: _secondsRemainingNotifier,
              builder: (context, remaining, child) {
                return Text(
                  _formatDuration(remaining),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 4. Clash Score Bar
  Widget _buildClashScoreBar(int leftFlex, int rightFlex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      height: 22,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Row(
              children: [
                Expanded(
                  flex: leftFlex,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFEA00), Color(0xFFFF8F00)],
                      ),
                    ),
                    child: Text(
                      _leftScore.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: rightFlex,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00B0FF), Color(0xFF2979FF)],
                      ),
                    ),
                    child: Text(
                      _rightScore.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.95),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 5. Top Contributors Row - Fitted to guarantee ZERO overflow on all screens (fixing 28px overflow)
  Widget _buildContributorsRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x7A0D0B18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33FFD600), width: 1),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width - 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Streamer (Neha ✨) Top 3 Contributors (Gold, Silver, Bronze)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRankAvatar(AppAssets.status4, '1', const Color(0xFFFFD600)),
                  const SizedBox(width: 5),
                  _buildRankAvatar(AppAssets.status3, '2', const Color(0xFFE0E0E0)),
                  const SizedBox(width: 5),
                  _buildRankAvatar(AppAssets.status2, '3', const Color(0xFFCD7F32)),
                  const SizedBox(width: 8),

                  ScaleTransition(
                    scale: _heartBadgeAnimation,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _leftScore += 50);
                        _heartsKey.currentState?.addHeart(toLeft: true);
                        _heartsKey.currentState?.addHeart(toLeft: true);
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Color(0xFFFFEA00), Color(0xFFFF1744)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xAAFFD600),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text('💖', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Right Streamer (Arun) Top 3 Contributors (Gold, Silver, Bronze)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _heartBadgeAnimation,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _rightScore += 50);
                        _heartsKey.currentState?.addHeart(toLeft: false);
                        _heartsKey.currentState?.addHeart(toLeft: false);
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Color(0xFF00E5FF), Color(0xFFFFD600)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xAA00E5FF),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text('⭐', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildRankAvatar(AppAssets.status5, '1', const Color(0xFFFFD600)),
                  const SizedBox(width: 5),
                  _buildRankAvatar(AppAssets.status2, '2', const Color(0xFFE0E0E0)),
                  const SizedBox(width: 5),
                  _buildRankAvatar(AppAssets.status3, '3', const Color(0xFFCD7F32)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRankAvatar(String asset, String rank, Color borderColor) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 2.0),
            boxShadow: [
              BoxShadow(
                color: borderColor.withValues(alpha: 0.55),
                blurRadius: 7,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: CustomAvatar(radius: 14.5, assetPath: asset),
        ),
        Positioned(
          bottom: -2,
          right: -2,
          child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              color: borderColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Center(
              child: Text(
                rank,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 7.5,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 6. Bottom PK Chat Box: Continuous live comments stream filling the area below Contributors
  Widget _buildGlassmorphicChatFeed() {
    return RepaintBoundary(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.white, Colors.white],
            stops: [0.0, 0.15, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: ListView.builder(
          controller: _chatScrollController,
          reverse: true, // Bottom-anchored: newer comments at bottom, floats upwards smoothly
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 2, top: 8),
          itemCount: _comments.length,
          itemBuilder: (context, index) {
            final commentIndex = _comments.length - 1 - index;
            if (commentIndex < 0 || commentIndex >= _comments.length) {
              return const SizedBox.shrink();
            }
            final comment = _comments[commentIndex];
            final isGift = comment.type == LiveCommentType.gift;

            // Exactly 4 newest comments at bottom: 100% bold & clear ("4 message nalla thericha pothu")
            // Older comments floating further up become progressively lighter ("apporam yella lite thericha pothu")
            final double fadeOpacity = index < 4
                ? 1.0
                : (0.55 - ((index - 3) * 0.15)).clamp(0.14, 0.55);

            return TweenAnimationBuilder<double>(
              key: ValueKey(comment.id),
              duration: const Duration(milliseconds: 250),
              tween: Tween(begin: 0.0, end: 1.0),
              curve: Curves.easeOutCubic,
              builder: (context, val, child) {
                return Transform.translate(
                  offset: Offset(0, (1.0 - val) * 12.0),
                  child: Opacity(
                    opacity: (val * fadeOpacity).clamp(0.0, 1.0),
                    child: child,
                  ),
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: isGift
                    ? _buildGiftCommentCapsule(comment, fadeOpacity: fadeOpacity)
                    : _buildRegularCommentCapsule(comment, fadeOpacity: fadeOpacity),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGiftCommentCapsule(LiveComment comment, {double fadeOpacity = 1.0}) {
    final bool isFaded = fadeOpacity < 0.9;
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.5),
      decoration: BoxDecoration(
        color: isFaded
            ? Color.fromRGBO(20, 16, 5, (0.85 * fadeOpacity).clamp(0.2, 0.85))
            : const Color(0xEE141005),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFD600).withValues(alpha: isFaded ? (0.7 * fadeOpacity).clamp(0.2, 0.7) : 1.0),
          width: isFaded ? 1.0 : 1.5,
        ),
        boxShadow: isFaded
            ? null
            : const [
                BoxShadow(
                  color: Color(0x66FFD600),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAvatar(
            radius: 15.5,
            assetPath: comment.userAssetPath ?? AppAssets.status5,
          ),
          const SizedBox(width: 8),
          Text(
            '${comment.userName} ',
            style: TextStyle(
              color: Colors.white.withValues(alpha: isFaded ? (fadeOpacity).clamp(0.6, 1.0) : 1.0),
              fontSize: 14.0,
              fontWeight: FontWeight.w900,
              shadows: const [
                Shadow(color: Colors.black, blurRadius: 4, offset: Offset(0, 1)),
              ],
            ),
          ),
          Text(
            comment.message.contains('sent')
                ? comment.message
                : 'sent ${comment.message}',
            style: TextStyle(
              color: const Color(0xFFFFD600).withValues(alpha: isFaded ? (fadeOpacity).clamp(0.7, 1.0) : 1.0),
              fontSize: 14.0,
              fontWeight: FontWeight.w900,
              shadows: const [
                Shadow(color: Colors.black, blurRadius: 4, offset: Offset(0, 1)),
              ],
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _buildRegularCommentCapsule(LiveComment comment, {double fadeOpacity = 1.0}) {
    final isMe = comment.userName == 'You';
    final bool isFaded = fadeOpacity < 0.9;
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6.0),
      decoration: BoxDecoration(
        color: isFaded
            ? Color.fromRGBO(8, 8, 14, (0.75 * fadeOpacity).clamp(0.2, 0.75))
            : (isMe ? const Color(0xEE1A1303) : const Color(0xCC08080E)),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isMe
              ? const Color(0xFFFFD600).withValues(alpha: isFaded ? (0.7 * fadeOpacity).clamp(0.2, 0.7) : 1.0)
              : Colors.white.withValues(alpha: isFaded ? (0.2 * fadeOpacity).clamp(0.08, 0.2) : 0.24),
          width: isFaded ? 0.8 : (isMe ? 1.5 : 0.9),
        ),
        boxShadow: isFaded
            ? null
            : [
                BoxShadow(
                  color: isMe ? const Color(0x66FFD600) : Colors.black54,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAvatar(
            radius: 15.5,
            assetPath: comment.userAssetPath ?? AppAssets.status1,
          ),
          const SizedBox(width: 9),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                comment.userName,
                style: TextStyle(
                  color: (isMe ? const Color(0xFFFFEA00) : const Color(0xFFFFD600))
                      .withValues(alpha: isFaded ? (fadeOpacity).clamp(0.65, 1.0) : 1.0),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900,
                  shadows: const [
                    Shadow(color: Colors.black, blurRadius: 4, offset: Offset(0, 1)),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Text(
                comment.message,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: isFaded ? (fadeOpacity).clamp(0.6, 1.0) : 1.0),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(color: Colors.black, blurRadius: 4, offset: Offset(0, 1)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  /// 7. Pulsing Yellow Gift Button
  Widget _buildPulsingGiftButton() {
    return ScaleTransition(
      scale: _giftPulseAnimation,
      child: GestureDetector(
        onTap: _handleGiftTap,
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0x992B2005),
            border: Border.all(color: const Color(0xFFFFD600), width: 2.2),
            boxShadow: const [
              BoxShadow(
                color: Color(0xCCFFD600),
                blurRadius: 18,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0xFFFFEA00), Color(0xFFFF8F00)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x66FFD600),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Center(
                child: Text('🎁', style: TextStyle(fontSize: 24)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 9. Bottom Action Bar
  Widget _buildBottomActionBar() {
    if (_showCommentInput) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0E).withValues(alpha: 0.98),
          border: const Border(top: BorderSide(color: Color(0x44FFD600))),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(color: const Color(0x99FFD600), width: 1.4),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 14),
                      Expanded(
                        child: TextField(
                          controller: _commentInputController,
                          autofocus: true,
                          style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
                          onSubmitted: _handleSendComment,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle: TextStyle(color: Colors.white60, fontSize: 15.0),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send_rounded, color: Color(0xFFFFD600), size: 24),
                        onPressed: () => _handleSendComment(_commentInputController.text),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => setState(() => _showCommentInput = false),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                  child: const Icon(Icons.close, color: Colors.white70, size: 22),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF08080C).withValues(alpha: 0.96),
        border: const Border(top: BorderSide(color: Colors.white10)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Prominent, Large, Spacious "Type a message..." Capsule (No more squeezed text!)
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _showCommentInput = true),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0x66FFD600), width: 1.2),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22FFD600),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Type a message...',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text('😊', style: TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // PK Setup / Invite Button (Screen 3)
            _buildActionCircleButton(
              icon: Icons.flash_on_rounded,
              iconColor: const Color(0xFFFFD600),
              onTap: _showPkSetupModal,
            ),

            const SizedBox(width: 8),

            // More Options: PK Settings, Rules, & Winner Celebration preview (Screen 4, 8)
            _buildActionCircleButton(
              icon: Icons.more_horiz_rounded,
              iconColor: Colors.white,
              onTap: _showMoreOptionsModal,
            ),

            const SizedBox(width: 8),

            // Share Button
            _buildActionCircleButton(
              icon: Icons.reply_rounded,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('PK Live Stream Link copied! ↗'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreOptionsModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF101018),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(top: BorderSide(color: Color(0xFFFFD600), width: 1.2)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0x33FFD600),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.settings_rounded, color: Color(0xFFFFD600)),
                ),
                title: const Text('PK Battle Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('Timer, auto-end & host acceptance', style: TextStyle(color: Colors.white54, fontSize: 12)),
                onTap: () {
                  Navigator.pop(ctx);
                  _showPkSettingsModal();
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0x33FFD600),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD600)),
                ),
                title: const Text('Winner Celebration Screen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('Preview celebration ribbon & trophies', style: TextStyle(color: Colors.white54, fontSize: 12)),
                onTap: () {
                  Navigator.pop(ctx);
                  setState(() => _isBattleEnded = true);
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0x3300E5FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.rule_rounded, color: Color(0xFF00E5FF)),
                ),
                title: const Text('PK Battle Rules', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('Send gifts and tap to support your host', style: TextStyle(color: Colors.white54, fontSize: 12)),
                onTap: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PK Rules: Send gifts & tap to support your host!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCircleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.12),
          border: Border.all(color: Colors.white24, width: 0.9),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }

  /// IMAGE 1 SCREEN 8: PK Ended & Winner Celebration Screen
  /// With Golden Crown, Angel Wings, WINNER Ribbon, Final Score, "Play Again" and "Back to Live"
  Widget _buildWinnerCelebrationScreen() {
    return Container(
      color: Colors.black.withValues(alpha: 0.94),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "PK Ended" Heading
            const Text(
              'PK Ended',
              style: TextStyle(
                color: Color(0xFFFF2D78),
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10),

            // Floating Golden Crown above avatar
            const Text('👑', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 6),

            // Winner Avatar with Glowing Golden Wings & Aura
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFFFFD600).withValues(alpha: 0.6),
                        const Color(0xFFFF8F00).withValues(alpha: 0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                const Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('🪽', style: TextStyle(fontSize: 60)),
                      SizedBox(width: 90),
                      Text('🪽', style: TextStyle(fontSize: 60)),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFFFD600), width: 3),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFFFD600),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: CustomAvatar(radius: 54, assetPath: _leftStreamerAsset),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Big 3D Golden "WINNER" Ribbon Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFEA00), Color(0xFFFF9100), Color(0xFFFF6D00)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xCCFFD600),
                    blurRadius: 18,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                'WINNER',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Winner Name & Congratulations
            const Text(
              'Neha ✨',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Congrats! 🎉',
              style: TextStyle(
                color: Color(0xFFFFD600),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Final Score: 125,600 vs 98,300',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 24),

            // Button 1: "Play Again" (Electric Cyber Yellow)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD600),
                  foregroundColor: Colors.black,
                  elevation: 8,
                  shadowColor: const Color(0xCCFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
                onPressed: () {
                  setState(() {
                    _isBattleEnded = false;
                    _secondsRemainingNotifier.value = _battleDurationSeconds;
                    _leftScore = 12340;
                    _rightScore = 9870;
                  });
                  _startCountdown();
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Button 2: "Back to Live" matching Screen 8
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white38, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
                onPressed: () {
                  setState(() {
                    _isBattleEnded = false;
                  });
                },
                child: const Text(
                  'Back to Live',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Subtitle matching reference: "Same Vibes • Bigger Community"
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Same Vibes • Bigger Community ',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text('💛', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
