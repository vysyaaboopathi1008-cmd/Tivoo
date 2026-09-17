import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../domain/models/gift_item.dart';

/// 3D Animated Isolated Gift Effects Overlay with Cinematic Atmospheric Backdrop
/// Sequence Rule for every gift:
/// Appear ➔ Movement ➔ Main Action ➔ Special Effect / Particles ➔ Disappear
/// - Multi-stage dynamic animations (4.5 sec) at 60 FPS
/// - ZERO solid square card backgrounds (pure transparent isolated 3D graphics)
/// - ONLY the gift and its visual effects animate; all livestream video, chat, and controls remain visible.
/// - Atmospheric Environmental Backdrop immerses the live screen behind each gift.
/// - Centered at screenHeight * 0.23 so gifts stay strictly inside the video arena and never collide with PK score bar.
class ActiveGiftAnimationOverlay extends StatefulWidget {
  final Widget child;

  const ActiveGiftAnimationOverlay({
    super.key,
    required this.child,
  });

  static ActiveGiftAnimationOverlayState? of(BuildContext context) {
    return context.findAncestorStateOfType<ActiveGiftAnimationOverlayState>();
  }

  @override
  State<ActiveGiftAnimationOverlay> createState() =>
      ActiveGiftAnimationOverlayState();
}

class ActiveGiftAnimationOverlayState extends State<ActiveGiftAnimationOverlay>
    with TickerProviderStateMixin {
  // 15 Dedicated Controllers for the user-specified gifts
  late final AnimationController _carController;
  late final AnimationController _yachtController;
  late final AnimationController _rocketController;
  late final AnimationController _wingsController;
  late final AnimationController _roseController;
  late final AnimationController _crownController;
  late final AnimationController _diamondController;
  late final AnimationController _cakeController;
  late final AnimationController _teddyController;
  late final AnimationController _kittyController;
  late final AnimationController _tikiLoveController;
  late final AnimationController _loveController;
  late final AnimationController _flowersController;
  late final AnimationController _worldTourController;
  late final AnimationController _castleController;

  // Bonus extra controllers
  late final AnimationController _horseController;
  late final AnimationController _whaleController;
  late final AnimationController _angelVehicleController;
  late final AnimationController _shakeController;

  GiftItem? _activeGift;

  @override
  void initState() {
    super.initState();

    void onComplete(AnimationController controller) {
      if (mounted) {
        setState(() => _activeGift = null);
        controller.reset();
      }
    }

    _carController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_carController);
      });

    _yachtController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_yachtController);
      });

    _rocketController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_rocketController);
      });

    _wingsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_wingsController);
      });

    _roseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_roseController);
      });

    _crownController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_crownController);
      });

    _diamondController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_diamondController);
      });

    _cakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_cakeController);
      });

    _teddyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_teddyController);
      });

    _kittyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_kittyController);
      });

    _tikiLoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_tikiLoveController);
      });

    _loveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_loveController);
      });

    _flowersController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_flowersController);
      });

    _worldTourController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_worldTourController);
      });

    _castleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_castleController);
      });

    _horseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_horseController);
      });

    _whaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_whaleController);
      });

    _angelVehicleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_angelVehicleController);
      });

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_shakeController);
      });
  }

  @override
  void dispose() {
    _carController.dispose();
    _yachtController.dispose();
    _rocketController.dispose();
    _wingsController.dispose();
    _roseController.dispose();
    _crownController.dispose();
    _diamondController.dispose();
    _cakeController.dispose();
    _teddyController.dispose();
    _kittyController.dispose();
    _tikiLoveController.dispose();
    _loveController.dispose();
    _flowersController.dispose();
    _worldTourController.dispose();
    _castleController.dispose();
    _horseController.dispose();
    _whaleController.dispose();
    _angelVehicleController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  bool _isActive(AnimationController c) => c.isAnimating || (c.value > 0.0 && !c.isCompleted);

  void _stopAllControllers() {
    _carController.reset();
    _yachtController.reset();
    _rocketController.reset();
    _wingsController.reset();
    _roseController.reset();
    _crownController.reset();
    _diamondController.reset();
    _cakeController.reset();
    _teddyController.reset();
    _kittyController.reset();
    _tikiLoveController.reset();
    _loveController.reset();
    _flowersController.reset();
    _worldTourController.reset();
    _castleController.reset();
    _horseController.reset();
    _whaleController.reset();
    _angelVehicleController.reset();
    _shakeController.reset();
  }

  /// Triggers the active moving 3D animation for the given gift
  void playGift(
    GiftItem gift, {
    String senderName = 'You',
    int count = 1,
    bool toLeft = true,
    String recipient = 'Neha ✨',
  }) {
    _stopAllControllers();

    setState(() {
      _activeGift = gift;
    });

    final nameLower = gift.name.toLowerCase();
    final idLower = gift.id.toLowerCase();

    if (idLower.contains('car') || nameLower.contains('car')) {
      _carController.forward(from: 0.0);
    } else if (idLower.contains('yacht') || nameLower.contains('yacht')) {
      _yachtController.forward(from: 0.0);
    } else if (idLower.contains('rocket') || nameLower.contains('rocket')) {
      _rocketController.forward(from: 0.0);
    } else if (idLower.contains('wing') || nameLower.contains('wing')) {
      _wingsController.forward(from: 0.0);
    } else if (idLower.contains('rose') || nameLower.contains('rose')) {
      _roseController.forward(from: 0.0);
    } else if (idLower.contains('crown') || nameLower.contains('crown')) {
      _crownController.forward(from: 0.0);
    } else if (idLower.contains('diamond') || nameLower.contains('diamond')) {
      _diamondController.forward(from: 0.0);
    } else if (idLower.contains('cake') || nameLower.contains('cake')) {
      _cakeController.forward(from: 0.0);
    } else if (idLower.contains('teddy') ||
        nameLower.contains('teddy') ||
        idLower.contains('panda') ||
        nameLower.contains('panda')) {
      _teddyController.forward(from: 0.0);
    } else if (idLower.contains('kitty') ||
        nameLower.contains('kitty') ||
        idLower.contains('cat') ||
        nameLower.contains('cat')) {
      _kittyController.forward(from: 0.0);
    } else if (idLower.contains('tiki') || nameLower.contains('tiki')) {
      _tikiLoveController.forward(from: 0.0);
    } else if (idLower.contains('love') ||
        nameLower.contains('love') ||
        idLower.contains('heart') ||
        nameLower.contains('heart')) {
      _loveController.forward(from: 0.0);
    } else if (idLower.contains('flower') ||
        nameLower.contains('flower') ||
        idLower.contains('bouquet') ||
        nameLower.contains('bouquet') ||
        idLower.contains('chariot') ||
        nameLower.contains('chariot')) {
      _flowersController.forward(from: 0.0);
    } else if (idLower.contains('world') ||
        nameLower.contains('world') ||
        idLower.contains('tour') ||
        nameLower.contains('tour') ||
        idLower.contains('earth') ||
        nameLower.contains('earth')) {
      _worldTourController.forward(from: 0.0);
    } else if (idLower.contains('castle') || nameLower.contains('castle')) {
      _castleController.forward(from: 0.0);
    } else if (idLower.contains('horse') || nameLower.contains('horse')) {
      _horseController.forward(from: 0.0);
    } else if (idLower.contains('whale') || nameLower.contains('whale')) {
      _whaleController.forward(from: 0.0);
    } else if (idLower.contains('angel_vehicle') ||
        (nameLower.contains('angel') && nameLower.contains('vehicle'))) {
      _angelVehicleController.forward(from: 0.0);
    } else {
      _shakeController.forward(from: 0.0);
    }
  }

  AnimationController? _getActiveController() {
    if (_isActive(_carController)) return _carController;
    if (_isActive(_yachtController)) return _yachtController;
    if (_isActive(_rocketController)) return _rocketController;
    if (_isActive(_wingsController)) return _wingsController;
    if (_isActive(_roseController)) return _roseController;
    if (_isActive(_crownController)) return _crownController;
    if (_isActive(_diamondController)) return _diamondController;
    if (_isActive(_cakeController)) return _cakeController;
    if (_isActive(_teddyController)) return _teddyController;
    if (_isActive(_kittyController)) return _kittyController;
    if (_isActive(_tikiLoveController)) return _tikiLoveController;
    if (_isActive(_loveController)) return _loveController;
    if (_isActive(_flowersController)) return _flowersController;
    if (_isActive(_worldTourController)) return _worldTourController;
    if (_isActive(_castleController)) return _castleController;
    if (_isActive(_horseController)) return _horseController;
    if (_isActive(_whaleController)) return _whaleController;
    if (_isActive(_angelVehicleController)) return _angelVehicleController;
    if (_isActive(_shakeController)) return _shakeController;
    return null;
  }

  String _getActiveGiftCategory() {
    if (_activeGift == null) return '';
    final nameLower = _activeGift!.name.toLowerCase();
    final idLower = _activeGift!.id.toLowerCase();
    if (idLower.contains('rocket') || nameLower.contains('rocket')) return 'rocket';
    if (idLower.contains('car') || nameLower.contains('car')) return 'car';
    if (idLower.contains('yacht') || nameLower.contains('yacht')) return 'yacht';
    if (idLower.contains('whale') || nameLower.contains('whale')) return 'yacht';
    if (idLower.contains('wing') || nameLower.contains('wing')) return 'wings';
    if (idLower.contains('angel') || nameLower.contains('angel')) return 'wings';
    if (idLower.contains('rose') || nameLower.contains('rose')) return 'rose';
    if (idLower.contains('flower') ||
        nameLower.contains('flower') ||
        idLower.contains('bouquet') ||
        idLower.contains('chariot')) {
      return 'flowers';
    }
    if (idLower.contains('crown') || nameLower.contains('crown')) return 'crown';
    if (idLower.contains('diamond') || nameLower.contains('diamond')) return 'diamond';
    if (idLower.contains('cake') || nameLower.contains('cake')) return 'cake';
    if (idLower.contains('teddy') || nameLower.contains('teddy') || idLower.contains('panda')) return 'teddy';
    if (idLower.contains('kitty') || nameLower.contains('kitty') || idLower.contains('cat')) return 'kitty';
    if (idLower.contains('tiki') || nameLower.contains('tiki')) return 'love';
    if (idLower.contains('love') || nameLower.contains('love') || idLower.contains('heart')) return 'love';
    if (idLower.contains('castle') || nameLower.contains('castle')) return 'castle';
    if (idLower.contains('horse') || nameLower.contains('horse')) return 'horse';
    if (idLower.contains('world') || nameLower.contains('world') || idLower.contains('tour')) return 'world_tour';
    return 'generic';
  }

  @override
  Widget build(BuildContext context) {
    final activeController = _getActiveController();
    final giftCategory = _getActiveGiftCategory();

    return Stack(
      children: [
        widget.child,

        // Cinematic Atmospheric Environmental Backdrop Layer
        if (activeController != null && giftCategory.isNotEmpty)
          _buildAtmosphericBackdrop(activeController, giftCategory),

        // 15 User-Specified Gift Animations (Transparent Isolated Overlays)
        if (_isActive(_carController)) _buildSuperCarAnimation(),
        if (_isActive(_yachtController)) _buildYachtAnimation(),
        if (_isActive(_rocketController)) _buildRocketAnimation(),
        if (_isActive(_wingsController)) _buildAngelWingsAnimation(),
        if (_isActive(_roseController)) _buildRoseAnimation(),
        if (_isActive(_crownController)) _buildCrownAnimation(),
        if (_isActive(_diamondController)) _buildDiamondAnimation(),
        if (_isActive(_cakeController)) _buildCakeAnimation(),
        if (_isActive(_teddyController)) _buildTeddyAnimation(),
        if (_isActive(_kittyController)) _buildKittyAnimation(),
        if (_isActive(_tikiLoveController)) _buildTikiLoveAnimation(),
        if (_isActive(_loveController)) _buildLoveHeartAnimation(),
        if (_isActive(_flowersController)) _buildFlowersAnimation(),
        if (_isActive(_worldTourController)) _buildWorldTourAnimation(),
        if (_isActive(_castleController)) _buildCastleAnimation(),

        // Extra Luxury Gifts
        if (_isActive(_horseController)) _buildGoldenHorseAnimation(),
        if (_isActive(_whaleController)) _buildOceanWhaleAnimation(),
        if (_isActive(_angelVehicleController)) _buildAngelVehicleAnimation(),
        if (_isActive(_shakeController)) _buildStandardGiftAnimation(),
      ],
    );
  }

  // ===========================================================================
  // ATMOSPHERIC ENVIRONMENTAL BACKDROP SYSTEM
  // Smoothly immerses the live screen behind the active gift
  // ===========================================================================
  Widget _buildAtmosphericBackdrop(AnimationController controller, String category) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final val = controller.value;
        final fade = (val < 0.12 ? (val / 0.12) : (val > 0.88 ? (1.0 - val) / 0.12 : 1.0)).clamp(0.0, 1.0);
        if (fade <= 0.0) return const SizedBox.shrink();

        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        return Positioned.fill(
          child: IgnorePointer(
            child: Opacity(
              opacity: fade,
              child: Stack(
                children: [
                  // Base Ambient Vignette / Dimmer: Dims live video gently for contrast without hiding host
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0.0, -0.52),
                        radius: 1.1,
                        colors: [
                          category == 'rocket'
                              ? const Color(0xEE030612)
                              : category == 'car'
                                  ? const Color(0x99000000)
                                  : const Color(0x66000000),
                          const Color(0xBB000000),
                        ],
                      ),
                    ),
                  ),

                  // 1. Cosmic Deep Space Starfield & Nebula (Matches user's reference Photo 2!)
                  if (category == 'rocket')
                    CustomPaint(
                      size: Size(screenWidth, screenHeight),
                      painter: _SpaceStarfieldPainter(progress: val),
                    ),

                  // 2. High-speed Highway Track & Speed Streaks for Super Car
                  if (category == 'car')
                    _buildHighwayBackdrop(screenWidth, screenHeight, val),

                  // 3. Deep Ocean Caustics & Sea Surface Mist for Yacht
                  if (category == 'yacht')
                    _buildOceanBackdrop(screenWidth, screenHeight, val),

                  // 4. Heavenly Golden God-Rays for Angel Wings
                  if (category == 'wings')
                    _buildHeavenlyBackdrop(screenWidth, screenHeight, val),

                  // 5. Royal Twilight Aurora & Starry Sky for Castle
                  if (category == 'castle')
                    _buildCastleBackdrop(screenWidth, screenHeight, val),

                  // 6. Romantic Blossom Aura & Petal Breeze for Flowers/Rose
                  if (category == 'flowers' || category == 'rose')
                    _buildFloralGardenBackdrop(screenWidth, screenHeight, val),

                  // 7. VIP Luxury Spotlights & Prismatic Flares for Diamond/Crown
                  if (category == 'diamond' || category == 'crown')
                    _buildLuxurySpotlightBackdrop(screenWidth, screenHeight, val),

                  // 8. Celebration Festive Bokeh & Confetti for Cake
                  if (category == 'cake')
                    _buildCelebrationBackdrop(screenWidth, screenHeight, val),

                  // 9. Dreamy Romantic Heart Glow for Love/Kitty/Teddy
                  if (category == 'love' || category == 'teddy' || category == 'kitty')
                    _buildRomanticLoveBackdrop(screenWidth, screenHeight, val),

                  // 10. Orbital Flight Paths & Earth Glow for World Tour
                  if (category == 'world_tour')
                    _buildWorldTourBackdrop(screenWidth, screenHeight, val),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHighwayBackdrop(double width, double height, double progress) {
    return Stack(
      children: [
        // Road surface horizon warm glow
        Positioned(
          top: height * 0.12,
          left: 0,
          right: 0,
          height: height * 0.22,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000),
                  Color(0x33FF6D00),
                  Color(0x55000000),
                  Color(0x00000000),
                ],
                stops: [0.0, 0.35, 0.70, 1.0],
              ),
            ),
          ),
        ),
        // Dynamic horizontal speed streaks racing past
        CustomPaint(
          size: Size(width, height),
          painter: _HighwaySpeedStreaksPainter(progress: progress),
        ),
      ],
    );
  }

  Widget _buildOceanBackdrop(double width, double height, double progress) {
    return Positioned(
      top: height * 0.08,
      left: 0,
      right: 0,
      height: height * 0.30,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0x0000E5FF),
              const Color(0x4400B0FF).withOpacity(0.35),
              const Color(0x55002171),
              Colors.transparent,
            ],
            stops: const [0.0, 0.40, 0.80, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildHeavenlyBackdrop(double width, double height, double progress) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.55),
            radius: 0.95,
            colors: [
              Color(0x44FFD54F),
              Color(0x22FFA000),
              Colors.transparent,
            ],
            stops: [0.0, 0.45, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildCastleBackdrop(double width, double height, double progress) {
    return Positioned(
      top: height * 0.06,
      left: 0,
      right: 0,
      height: height * 0.34,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.40),
            radius: 0.90,
            colors: [
              Color(0x447C4DFF),
              Color(0x22304FFE),
              Colors.transparent,
            ],
            stops: [0.0, 0.50, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildFloralGardenBackdrop(double width, double height, double progress) {
    return Positioned(
      top: height * 0.08,
      left: 0,
      right: 0,
      height: height * 0.30,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.45),
            radius: 0.85,
            colors: [
              Color(0x44FF80AB),
              Color(0x22F48FB1),
              Colors.transparent,
            ],
            stops: [0.0, 0.50, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildLuxurySpotlightBackdrop(double width, double height, double progress) {
    final sweep = sin(progress * 4 * pi) * 0.35;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: height * 0.45,
      child: Transform.rotate(
        angle: sweep,
        alignment: const Alignment(0.0, -1.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x55FFF9C4),
                Color(0x22FFD54F),
                Colors.transparent,
              ],
              stops: [0.0, 0.50, 1.0],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCelebrationBackdrop(double width, double height, double progress) {
    return Positioned(
      top: height * 0.08,
      left: 0,
      right: 0,
      height: height * 0.32,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.45),
            radius: 0.90,
            colors: [
              Color(0x44FFE082),
              Color(0x22FFB74D),
              Colors.transparent,
            ],
            stops: [0.0, 0.50, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildRomanticLoveBackdrop(double width, double height, double progress) {
    return Positioned(
      top: height * 0.08,
      left: 0,
      right: 0,
      height: height * 0.32,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.45),
            radius: 0.90,
            colors: [
              Color(0x44F06292),
              Color(0x22BA68C8),
              Colors.transparent,
            ],
            stops: [0.0, 0.50, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildWorldTourBackdrop(double width, double height, double progress) {
    return Positioned(
      top: height * 0.06,
      left: 0,
      right: 0,
      height: height * 0.34,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.40),
            radius: 0.90,
            colors: [
              Color(0x4400E5FF),
              Color(0x221565C0),
              Colors.transparent,
            ],
            stops: [0.0, 0.50, 1.0],
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // 1. 🏎️ SUPER CAR
  // "Create an ultra-realistic cinematic animation of the super car...
  // Photorealistic car physics, realistic road interaction, cinematic camera movement,
  // no cartoon effects, no fantasy effects."
  // ===========================================================================
  Widget _buildSuperCarAnimation() {
    return AnimatedBuilder(
      animation: _carController,
      builder: (context, child) {
        final val = _carController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double targetCenterX = (screenWidth - 230) / 2;
        // Positioned comfortably inside video arena (never covers PK clash score bar)
        final double targetCenterY = screenHeight * 0.23;

        final double offscreenLeft = -260.0;
        final double offscreenRight = screenWidth + 260.0;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double suspensionDip = 0.0;
        double opacity = 1.0;
        bool isDrifting = false;

        // Flow: Start -> Headlights -> Drive in -> Accelerate -> Drift -> Pass -> Exit
        if (val < 0.22) {
          final p = Curves.easeOutQuad.transform(val / 0.22);
          posX = offscreenLeft + (p * (targetCenterX - 40 - offscreenLeft));
          posY = targetCenterY;
          scale = 0.92 + (p * 0.08);
          tiltAngle = 0.0;
          suspensionDip = sin(p * 4 * pi) * 2.0;
        } else if (val < 0.48) {
          final p = (val - 0.22) / 0.26;
          posX = (targetCenterX - 40) + (p * 40);
          posY = targetCenterY - sin(p * pi) * 8;
          scale = 1.00 + (p * 0.16);
          tiltAngle = sin(p * 2 * pi) * 0.02;
          suspensionDip = sin(p * 6 * pi) * 1.5;
        } else if (val < 0.70) {
          final p = (val - 0.48) / 0.22;
          posX = targetCenterX + (p * 35);
          posY = targetCenterY - 8 + (p * 14);
          scale = 1.16;
          tiltAngle = -0.13 * sin(p * pi);
          suspensionDip = sin(p * 8 * pi) * 2.0;
          isDrifting = true;
        } else {
          final p = Curves.easeInCubic.transform((val - 0.70) / 0.30);
          posX = (targetCenterX + 35) + (p * (offscreenRight - (targetCenterX + 35)));
          posY = targetCenterY + 6 - (p * 12);
          scale = 1.16 + (p * 0.04);
          tiltAngle = 0.03 * (1.0 - p);
          suspensionDip = sin(p * 10 * pi) * 1.5;
        }

        return Stack(
          children: [
            // Realistic Asphalt Ground Contact Shadow Beneath Tires
            _buildRealisticGroundShadow(
              centerX: posX + 115,
              groundY: posY + 88,
              scale: scale,
              elevation: suspensionDip,
              width: 220,
            ),

            // Drift tire smoke & road sparks near rear wheels
            if (isDrifting)
              _buildSubtleTireDriftVfx(
                left: posX + 20,
                top: posY + 76,
                opacity: (sin((val - 0.48) / 0.22 * pi)).clamp(0.0, 1.0),
              ),

            // Soft Radial Headlight Glow (NO rectangular boxes!)
            if (val >= 0.06)
              _buildRealisticHeadlightGlow(
                left: posX + 160,
                top: posY + 16,
                opacity: ((val - 0.06) / 0.15).clamp(0.0, 1.0) * opacity * 0.80,
              ),

            // Photorealistic Super Car with Natural Body Reflection Sweep
            Positioned(
              left: posX,
              top: posY + suspensionDip,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 230,
                        height: 125,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFD54F),
                          child: Image.asset(
                            AppAssets.giftSuperCar,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 5. 🛥️ YACHT
  // ===========================================================================
  Widget _buildYachtAnimation() {
    return AnimatedBuilder(
      animation: _yachtController,
      builder: (context, child) {
        final val = _yachtController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double targetCenterX = (screenWidth - 230) / 2;
        final double targetCenterY = screenHeight * 0.23;

        final double offscreenLeft = -280.0;
        final double offscreenRight = screenWidth + 280.0;

        double posX;
        double scale;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posX = offscreenLeft + (p * (targetCenterX - 45 - offscreenLeft));
          scale = 0.90 + (p * 0.10);
        } else if (val < 0.72) {
          final p = (val - 0.28) / 0.44;
          posX = (targetCenterX - 45) + (p * 60);
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.72) / 0.28);
          posX = (targetCenterX + 15) + (p * (offscreenRight - (targetCenterX + 15)));
          scale = 1.18 - (p * 0.12);
        }

        final double waveHeave = sin(val * 8 * pi) * 4.5;
        final double waveRoll = sin(val * 4 * pi) * 0.035;
        final double posY = targetCenterY + waveHeave;

        return Stack(
          children: [
            _buildRealisticWaterRipples(
              left: posX - 15,
              top: posY + 88,
              width: 260 * scale,
              progress: val,
              opacity: 0.75,
            ),
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Transform.scale(
                  scale: scale,
                  child: Transform.rotate(
                    angle: waveRoll,
                    child: SizedBox(
                      width: 230,
                      height: 125,
                      child: _buildRealisticSpecularSheen(
                        progress: val,
                        lightColor: const Color(0xFF00E5FF),
                        child: Image.asset(
                          AppAssets.giftYacht,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 11. 🚀 ROCKET (Matches User Reference Photo 2!)
  // Cosmic Space Environment, Dual Thruster Flames, Billowy Smoke Clouds & Embers
  // ===========================================================================
  Widget _buildRocketAnimation() {
    return AnimatedBuilder(
      animation: _rocketController,
      builder: (context, child) {
        final val = _rocketController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double startX = screenWidth * 0.08;
        final double startY = screenHeight * 0.38;
        final double exitX = screenWidth + 180.0;
        final double exitY = -180.0;

        double posX;
        double posY;
        double scale;
        double vibration = 0.0;

        if (val < 0.20) {
          // Engine ignition & liftoff vibration at bottom-left
          final p = val / 0.20;
          vibration = sin(p * 48 * pi) * 2.2;
          posX = startX;
          posY = startY - (p * 18);
          scale = 0.94 + (p * 0.06);
        } else {
          // Accelerate diagonally across live video toward upper-right into deep space
          final p = Curves.easeInCubic.transform((val - 0.20) / 0.80);
          posX = startX + (p * (exitX - startX));
          posY = (startY - 18) + (p * (exitY - (startY - 18)));
          scale = 1.00 + (sin(p * pi) * 0.22);
          vibration = sin(p * 20 * pi) * (1.5 * (1.0 - p));
        }

        posX += vibration;
        // Diagonal flight angle matching Photo 2 (~ -34 degrees)
        const double rocketAngle = -0.58;

        return Stack(
          children: [
            // Billowing Volumetric Smoke Plume & Glowing Embers Trailing Down-Left
            if (val >= 0.08)
              _buildRocketSmokePlume(
                tailX: posX + 38,
                tailY: posY + 115,
                progress: val,
              ),

            // Dual Thruster Fire Jets (Intense White Core + Cyan/Magenta Outer Cone)
            if (val >= 0.05)
              Positioned(
                left: posX + 26,
                top: posY + 106,
                child: IgnorePointer(
                  child: Transform.rotate(
                    angle: rocketAngle,
                    child: _buildDualRocketThrusterFlames(progress: val),
                  ),
                ),
              ),

            // Anamorphic Horizontal Cyan Lens Flare Across Thrusters
            if (val >= 0.10)
              Positioned(
                left: posX - 10,
                top: posY + 104,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 24 * pi).abs() * 0.35 + 0.65).clamp(0.0, 1.0),
                    child: Container(
                      width: 120,
                      height: 4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0x8800E5FF),
                            Colors.white,
                            Color(0x8800E5FF),
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.25, 0.50, 0.75, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Photorealistic Rocket with Fuselage Metallic Sheen Sweep
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Transform.scale(
                  scale: scale,
                  child: Transform.rotate(
                    angle: rocketAngle,
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: _buildRealisticSpecularSheen(
                        progress: val,
                        lightColor: const Color(0xFFCFD8DC),
                        child: Image.asset(
                          AppAssets.giftRocket,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Dual realistic rocket thruster plumes matching Photo 2
  Widget _buildDualRocketThrusterFlames({required double progress}) {
    final flicker = (sin(progress * 38 * pi).abs() * 0.25 + 0.75);

    Widget singleThruster() {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          // Outer Magenta / Pink Flare Envelope
          Container(
            width: 32,
            height: 95 * flicker,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFF4081),
                  Color(0xFFE040FB),
                  Color(0x887C4DFF),
                  Colors.transparent,
                ],
                stops: [0.0, 0.30, 0.65, 1.0],
              ),
            ),
          ),
          // Inner Electric Cyan / Blue Cone
          Container(
            width: 20,
            height: 70 * flicker,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xFF00E5FF),
                  Color(0xFF00B0FF),
                  Colors.transparent,
                ],
                stops: [0.0, 0.35, 0.70, 1.0],
              ),
            ),
          ),
          // Intense Blazing White Core Jet
          Container(
            width: 10,
            height: 40 * flicker,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF00E5FF),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        singleThruster(),
        const SizedBox(width: 8),
        singleThruster(),
      ],
    );
  }

  /// Volumetric billowy smoke clouds & hot glowing embers trailing the rocket
  Widget _buildRocketSmokePlume({
    required double tailX,
    required double tailY,
    required double progress,
  }) {
    return Stack(
      children: [
        // Billowing soft circular clouds expanding backwards
        ...List.generate(7, (i) {
          final cloudAge = ((progress * 2.2) + (i * 0.14)) % 1.0;
          final puffX = tailX - (cloudAge * 95) + (sin(cloudAge * 4 * pi) * 12);
          final puffY = tailY + (cloudAge * 115);
          final puffSize = 28.0 + (cloudAge * 48.0);
          final puffOpacity = (1.0 - cloudAge).clamp(0.0, 0.75);

          return Positioned(
            left: puffX - (puffSize / 2),
            top: puffY - (puffSize / 2),
            child: IgnorePointer(
              child: Opacity(
                opacity: puffOpacity,
                child: Container(
                  width: puffSize,
                  height: puffSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF90CAF9).withOpacity(0.65), // soft cyan-lavender smoke
                        const Color(0xFF5C6BC0).withOpacity(0.35),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.50, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),

        // Glowing Fiery Sparks / Embers Inside the Smoke
        ...List.generate(6, (i) {
          final emberP = ((progress * 3.0) + (i * 0.18)) % 1.0;
          final emberX = tailX - (emberP * 80) + (sin(emberP * 6 * pi) * 16);
          final emberY = tailY + (emberP * 95);
          final emberColor = i % 2 == 0 ? const Color(0xFFFF80AB) : const Color(0xFF00E5FF);

          return Positioned(
            left: emberX,
            top: emberY,
            child: IgnorePointer(
              child: Opacity(
                opacity: (sin(emberP * pi)).clamp(0.0, 1.0),
                child: Container(
                  width: 4.5,
                  height: 4.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: emberColor,
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ===========================================================================
  // 14. 🪽 ANGEL WINGS
  // ===========================================================================
  Widget _buildAngelWingsAnimation() {
    return AnimatedBuilder(
      animation: _wingsController,
      builder: (context, child) {
        final val = _wingsController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 240) / 2;
        final double centerY = screenHeight * 0.23;

        double scale;
        double flapFactor;
        double opacity = 1.0;

        if (val < 0.25) {
          final p = Curves.easeOutCubic.transform(val / 0.25);
          scale = 0.70 + (p * 0.30);
          flapFactor = 0.20 + (p * 0.80);
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          final p = (val - 0.25) / 0.50;
          scale = 1.00 + (sin(p * pi) * 0.18);
          flapFactor = 0.88 + (sin(p * 4 * pi).abs() * 0.12);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          scale = 1.00 - (p * 0.35);
          flapFactor = 1.00 - (p * 0.80);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double airflowSway = sin(val * 2 * pi) * 0.025;
        final double naturalElevation = sin(val * 2 * pi) * 6;
        final double posY = centerY + naturalElevation;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 120,
              groundY: posY + 160,
              scale: scale,
              elevation: naturalElevation,
              width: 220,
            ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0012)
                        ..rotateZ(airflowSway)
                        ..scale(flapFactor, 1.0, 1.0),
                      child: SizedBox(
                        width: 240,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFF9C4),
                          child: Image.asset(
                            AppAssets.giftAngelWings,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 4. 🌹 ROSE
  // ===========================================================================
  Widget _buildRoseAnimation() {
    return AnimatedBuilder(
      animation: _roseController,
      builder: (context, child) {
        final val = _roseController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY + (sin(p * 2 * pi) * 4);
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double breezeSway = sin(val * 4 * pi) * 0.03;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: posY + 160,
              scale: scale,
              width: 170,
            ),
            if (val >= 0.35 && val <= 0.85)
              _buildFallingPetals(
                centerX: centerX + 95,
                centerY: posY + 85,
                progress: val,
                opacity: opacity,
              ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: breezeSway,
                      child: SizedBox(
                        width: 190,
                        height: 190,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFF80AB),
                          child: Image.asset(
                            AppAssets.giftRose,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 8. 👑 CROWN
  // ===========================================================================
  Widget _buildCrownAnimation() {
    return AnimatedBuilder(
      animation: _crownController,
      builder: (context, child) {
        final val = _crownController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 210) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY + (sin(p * 2 * pi) * 3);
          scale = 1.00 + (sin(p * pi) * 0.20);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double rotY = sin(val * 2 * pi) * 0.22;
        final double rotX = -0.05 + sin(val * 2 * pi) * 0.02;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 105,
              groundY: posY + 165,
              scale: scale,
              elevation: (targetY - posY).abs(),
              width: 190,
            ),
            _buildRealisticStudioAura(
              centerX: centerX + 105,
              centerY: posY + 90,
              scale: scale,
              color: const Color(0xFFFFD54F),
              radius: 200,
              opacity: 0.25 * opacity,
            ),
            if (val >= 0.15 && val <= 0.85) ...[
              _buildSparkleGlint(
                x: centerX + 55,
                y: posY + 70,
                progress: (val * 4.0) % 1.0,
                color: const Color(0xFFFFD54F),
              ),
              _buildSparkleGlint(
                x: centerX + 145,
                y: posY + 65,
                progress: ((val * 4.0) + 0.5) % 1.0,
                color: const Color(0xFF00E5FF),
              ),
            ],
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0014)
                        ..rotateY(rotY)
                        ..rotateX(rotX),
                      child: SizedBox(
                        width: 210,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFD54F),
                          child: Image.asset(
                            AppAssets.giftCrown,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 7. 💎 DIAMOND
  // ===========================================================================
  Widget _buildDiamondAnimation() {
    return AnimatedBuilder(
      animation: _diamondController,
      builder: (context, child) {
        final val = _diamondController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY + (sin(p * 2 * pi) * 4);
          scale = 1.00 + (sin(p * pi) * 0.22);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double rotY = sin(val * 2 * pi) * 0.35;
        final double rotZ = sin(val * 4 * pi) * 0.04;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: posY + 160,
              scale: scale,
              elevation: (targetY - posY).abs(),
              width: 170,
            ),
            _buildRealisticStudioAura(
              centerX: centerX + 100,
              centerY: posY + 90,
              scale: scale,
              color: const Color(0xFF00E5FF),
              radius: 220,
              opacity: 0.30 * opacity,
            ),
            if (val >= 0.18 && val <= 0.85) ...[
              _buildSparkleGlint(
                x: centerX + 70,
                y: posY + 60,
                progress: (val * 5.0) % 1.0,
                color: Colors.white,
              ),
              _buildSparkleGlint(
                x: centerX + 120,
                y: posY + 95,
                progress: ((val * 5.0) + 0.4) % 1.0,
                color: const Color(0xFF80D8FF),
              ),
            ],
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0014)
                        ..rotateY(rotY)
                        ..rotateZ(rotZ),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFE0F7FA),
                          child: Image.asset(
                            AppAssets.giftDiamond,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 9. 🎂 BIRTHDAY CAKE
  // ===========================================================================
  Widget _buildCakeAnimation() {
    return AnimatedBuilder(
      animation: _cakeController,
      builder: (context, child) {
        final val = _cakeController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY + (sin(p * 2 * pi) * 3);
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double tiltAngle = sin(val * 2 * pi) * 0.025;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: posY + 160,
              scale: scale,
              width: 190,
            ),
            if (val >= 0.30 && val <= 0.85)
              _buildCelebrationConfetti(
                centerX: centerX + 100,
                centerY: posY + 75,
                progress: val,
                opacity: opacity,
              ),
            if (val >= 0.10 && val <= 0.88)
              ...List.generate(3, (i) {
                final flameX = centerX + 62 + (i * 38.0);
                final flameFlicker = (sin((val * 26 * pi) + (i * 1.8)).abs() * 0.35 + 0.65);
                return Positioned(
                  left: flameX,
                  top: posY + 26,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: (flameFlicker * opacity).clamp(0.0, 1.0),
                      child: Container(
                        width: 12,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFFFFF9C4), Color(0xFFFF9100), Colors.transparent],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFD54F).withOpacity(0.70),
                              blurRadius: 14,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFF9C4),
                          child: Image.asset(
                            AppAssets.giftCake,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 10. 🧸 TEDDY
  // ===========================================================================
  Widget _buildTeddyAnimation() {
    return AnimatedBuilder(
      animation: _teddyController,
      builder: (context, child) {
        final val = _teddyController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY;
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double tiltAngle = sin(val * 4 * pi) * 0.035;
        final double breathScaleY = 1.0 + (sin(val * 4 * pi) * 0.018);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: posY + 155,
              scale: scale,
              width: 170,
            ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..rotateZ(tiltAngle)
                        ..scale(1.0, breathScaleY, 1.0),
                      child: SizedBox(
                        width: 190,
                        height: 190,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFE0B2),
                          child: Image.asset(
                            AppAssets.giftPanda,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 2. 🐱 KITTY — CUTE CAT
  // ===========================================================================
  Widget _buildKittyAnimation() {
    return AnimatedBuilder(
      animation: _kittyController,
      builder: (context, child) {
        final val = _kittyController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY;
          scale = 1.00 + (sin(p * pi) * 0.16);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double headTilt = sin(val * 4 * pi) * 0.04;
        final double breathScale = 1.0 + (sin(val * 3 * pi) * 0.015);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: posY + 155,
              scale: scale,
              width: 170,
            ),
            if (val >= 0.25 && val <= 0.85)
              _buildKittyFloatingHearts(
                centerX: centerX + 95,
                centerY: posY + 80,
                progress: val,
                opacity: opacity,
              ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateZ(headTilt)
                        ..scale(breathScale, breathScale, 1.0),
                      child: SizedBox(
                        width: 190,
                        height: 190,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFCDD2),
                          child: Image.asset(
                            AppAssets.giftKitty,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 3. 💖 TIKI LOVE
  // ===========================================================================
  Widget _buildTikiLoveAnimation() {
    return AnimatedBuilder(
      animation: _tikiLoveController,
      builder: (context, child) {
        final val = _tikiLoveController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY + (sin(p * 2 * pi) * 4);
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double heartbeat = 1.0 + (sin(val * 8 * pi).abs() * 0.04);
        final double floatRot = sin(val * 3 * pi) * 0.03;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: posY + 160,
              scale: scale,
              elevation: (targetY - posY).abs(),
              width: 180,
            ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateZ(floatRot)
                        ..scale(heartbeat, heartbeat, 1.0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFF4081),
                          child: Image.asset(
                            AppAssets.giftTikiLove,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 15. ❤️ LOVE / HEART
  // ===========================================================================
  Widget _buildLoveHeartAnimation() {
    return AnimatedBuilder(
      animation: _loveController,
      builder: (context, child) {
        final val = _loveController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.23;

        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutBack.transform(val / 0.28);
          scale = 0.50 + (p * 0.50);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          scale = 1.00 + (p * 0.25);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double pulse = 1.0 + (sin(val * 8 * pi).abs() * 0.06);
        final double floatElevation = sin(val * 2 * pi) * 6;
        final double posY = centerY + floatElevation;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: posY + 160,
              scale: scale,
              elevation: floatElevation,
              width: 180,
            ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.scale(
                      scale: pulse,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFF80AB),
                          child: Image.asset(
                            AppAssets.giftLove,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 1. 🌹 FLOWERS / BOUQUET
  // ===========================================================================
  Widget _buildFlowersAnimation() {
    return AnimatedBuilder(
      animation: _flowersController,
      builder: (context, child) {
        final val = _flowersController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 210) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.44;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.28) / 0.47;
          posY = targetY + (sin(p * 2 * pi) * 3);
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.15);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final double swayAngle = sin(val * 3 * pi) * 0.025;

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 105,
              groundY: posY + 165,
              scale: scale,
              width: 180,
            ),
            if (val >= 0.25 && val <= 0.85)
              _buildFallingPetals(
                centerX: centerX + 105,
                centerY: posY + 85,
                progress: val,
                opacity: opacity,
              ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: swayAngle,
                      child: SizedBox(
                        width: 210,
                        height: 210,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFF80AB),
                          child: Image.asset(
                            AppAssets.giftFlowers,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 13. 🌍 WORLD TOUR
  // ===========================================================================
  Widget _buildWorldTourAnimation() {
    return AnimatedBuilder(
      animation: _worldTourController,
      builder: (context, child) {
        final val = _worldTourController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 210) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = -180.0;

        double posY;
        double scale;
        double rotY;

        if (val < 0.28) {
          final p = Curves.easeOutCubic.transform(val / 0.28);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
          rotY = val * 2.5 * pi;
        } else if (val < 0.72) {
          final p = (val - 0.28) / 0.44;
          posY = targetY + (sin(p * 2 * pi) * 3);
          scale = 1.00 + (sin(p * pi) * 0.20);
          rotY = (0.28 * 2.5 * pi) + (p * 2.0 * pi);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.72) / 0.28);
          posY = targetY - (p * (targetY - exitY));
          scale = 1.00 + (p * 0.05);
          rotY = (0.28 * 2.5 * pi) + (2.0 * pi) + (p * 0.8 * pi);
        }

        return Stack(
          children: [
            _buildRealisticStudioAura(
              centerX: centerX + 105,
              centerY: posY + 105,
              scale: scale,
              color: const Color(0xFF00E5FF),
              radius: 220,
              opacity: 0.25,
            ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Transform.scale(
                  scale: scale,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0014)
                      ..rotateY(rotY),
                    child: SizedBox(
                      width: 210,
                      height: 210,
                      child: _buildRealisticSpecularSheen(
                        progress: val,
                        lightColor: const Color(0xFFB3E5FC),
                        child: Image.asset(
                          AppAssets.giftWorldTour,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (val >= 0.15 && val <= 0.85)
              _buildAirplaneOrbit(
                centerX: centerX + 105,
                centerY: posY + 105,
                progress: val,
                scale: scale,
                opacity: 0.95,
              ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 12. 🏰 CASTLE
  // ===========================================================================
  Widget _buildCastleAnimation() {
    return AnimatedBuilder(
      animation: _castleController,
      builder: (context, child) {
        final val = _castleController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 230) / 2;
        final double startY = screenHeight * 0.42;
        final double targetY = screenHeight * 0.23;
        final double exitY = screenHeight * 0.38;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.30) {
          final p = Curves.easeOutCubic.transform(val / 0.30);
          posY = startY - (p * (startY - targetY));
          scale = 0.88 + (p * 0.12);
        } else if (val < 0.75) {
          final p = (val - 0.30) / 0.45;
          posY = targetY;
          scale = 1.00 + (sin(p * pi) * 0.18);
        } else {
          final p = Curves.easeInCubic.transform((val - 0.75) / 0.25);
          posY = targetY + (p * (exitY - targetY));
          scale = 1.00 - (p * 0.25);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            Positioned(
              left: centerX - 25,
              top: posY + 160,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.50 * opacity).clamp(0.0, 0.50),
                  child: Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: RadialGradient(
                        colors: [
                          Colors.white.withOpacity(0.65),
                          const Color(0xFFB0BEC5).withOpacity(0.35),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.50, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (val >= 0.20)
              _buildRealisticStudioAura(
                centerX: centerX + 115,
                centerY: posY + 115,
                scale: scale,
                color: const Color(0xFFFFD54F),
                radius: 200,
                opacity: (0.22 * opacity).clamp(0.0, 0.22),
              ),
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: SizedBox(
                      width: 230,
                      height: 230,
                      child: _buildRealisticSpecularSheen(
                        progress: val,
                        lightColor: const Color(0xFFFFF9C4),
                        child: Image.asset(
                          AppAssets.giftCastle,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // BONUS: GOLDEN HORSE
  // ===========================================================================
  Widget _buildGoldenHorseAnimation() {
    return AnimatedBuilder(
      animation: _horseController,
      builder: (context, child) {
        final val = _horseController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 230) / 2;
        final double centerY = screenHeight * 0.23;

        final double scale = 0.94 + (sin(val * pi) * 0.14);
        final double tiltAngle = sin(val * 2 * pi) * 0.03;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 115,
              groundY: centerY + 175,
              scale: scale,
              width: 200,
            ),
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 230,
                        height: 210,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFD54F),
                          child: Image.asset(
                            AppAssets.giftGoldenHorse,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // BONUS: OCEAN WHALE
  // ===========================================================================
  Widget _buildOceanWhaleAnimation() {
    return AnimatedBuilder(
      animation: _whaleController,
      builder: (context, child) {
        final val = _whaleController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 240) / 2;
        final double centerY = screenHeight * 0.23;

        final double scale = 0.95 + (sin(val * pi) * 0.12);
        final double waveBob = sin(val * 4 * pi) * 5;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticWaterRipples(
              left: centerX,
              top: centerY + 175,
              width: 240,
              progress: val,
              opacity: 0.60 * opacity,
            ),
            Positioned(
              left: centerX,
              top: centerY + waveBob,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: SizedBox(
                      width: 240,
                      height: 210,
                      child: _buildRealisticSpecularSheen(
                        progress: val,
                        lightColor: const Color(0xFF80D8FF),
                        child: Image.asset(
                          AppAssets.giftOceanWhale,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // BONUS: ANGEL VEHICLE
  // ===========================================================================
  Widget _buildAngelVehicleAnimation() {
    return AnimatedBuilder(
      animation: _angelVehicleController,
      builder: (context, child) {
        final val = _angelVehicleController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 240) / 2;
        final double centerY = screenHeight * 0.23;

        final double scale = 0.94 + (sin(val * pi) * 0.14);
        final double sway = sin(val * 2 * pi) * 0.03;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 120,
              groundY: centerY + 175,
              scale: scale,
              width: 220,
            ),
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: sway,
                      child: SizedBox(
                        width: 240,
                        height: 210,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFF9C4),
                          child: Image.asset(
                            AppAssets.giftAngelVehicle,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // STANDARD / GENERIC GIFT FALLBACK
  // ===========================================================================
  Widget _buildStandardGiftAnimation() {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        final val = _shakeController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double centerY = screenHeight * 0.23;

        final double scale = 0.92 + (sin(val * pi) * 0.16);
        final double rot = sin(val * 4 * pi) * 0.04;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.15).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: centerY + 165,
              scale: scale,
              width: 170,
            ),
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rot,
                      child: SizedBox(
                        width: 190,
                        height: 190,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: Colors.white,
                          child: Image.asset(
                            _activeGift?.imageAssetPath ?? AppAssets.giftRose,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // PROCEDURAL VFX & REALISTIC SHADING HELPERS
  // ===========================================================================

  /// Soft Natural Headlight Glow with Radial Falloff (ZERO rectangular edges!)
  Widget _buildRealisticHeadlightGlow({
    required double left,
    required double top,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.85),
          child: Container(
            width: 220,
            height: 80,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.85, 0.0),
                radius: 0.95,
                colors: [
                  Colors.white.withOpacity(0.90),
                  const Color(0xFFFFF9C4).withOpacity(0.55),
                  const Color(0xFFFFD54F).withOpacity(0.20),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.25, 0.60, 1.0],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Photorealistic gemstone light glint
  Widget _buildSparkleGlint({
    required double x,
    required double y,
    required double progress,
    required Color color,
  }) {
    final glintScale = sin(progress * pi).clamp(0.0, 1.0);
    if (glintScale <= 0.01) return const SizedBox.shrink();

    return Positioned(
      left: x - 12,
      top: y - 12,
      child: IgnorePointer(
        child: Opacity(
          opacity: glintScale,
          child: Transform.rotate(
            angle: progress * pi * 0.5,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 20 * glintScale,
                    height: 2.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(color: color, blurRadius: 6, spreadRadius: 1),
                      ],
                    ),
                  ),
                  Container(
                    width: 2.2,
                    height: 20 * glintScale,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(color: color, blurRadius: 6, spreadRadius: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Sweeps a realistic studio specular highlight reflection across any surface
  /// Uses BlendMode.srcATop so gradient NEVER bleeds over transparent bounds!
  Widget _buildRealisticSpecularSheen({
    required Widget child,
    required double progress,
    Color lightColor = Colors.white,
  }) {
    final offset = (progress * 2.8) - 1.4;
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment(-1.6 + offset, -1.0),
          end: Alignment(0.4 + offset, 1.0),
          colors: [
            Colors.white.withOpacity(0.0),
            lightColor.withOpacity(0.35),
            Colors.white.withOpacity(0.85),
            lightColor.withOpacity(0.35),
            Colors.white.withOpacity(0.0),
          ],
          stops: const [0.0, 0.38, 0.50, 0.62, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: child,
    );
  }

  /// Soft ambient occlusion / contact shadow on the ground beneath the object
  Widget _buildRealisticGroundShadow({
    required double centerX,
    required double groundY,
    required double scale,
    double elevation = 0.0,
    double width = 180,
  }) {
    final shadowScale = (scale * (1.0 - (elevation * 0.0025))).clamp(0.4, 1.5);
    final shadowOpacity = (0.50 - (elevation * 0.0035)).clamp(0.10, 0.50);

    return Positioned(
      left: centerX - (width * shadowScale / 2),
      top: groundY + (elevation * 0.15),
      child: IgnorePointer(
        child: Opacity(
          opacity: shadowOpacity,
          child: Container(
            width: width * shadowScale,
            height: 22 * shadowScale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: RadialGradient(
                colors: [
                  Colors.black.withOpacity(0.80),
                  Colors.black.withOpacity(0.40),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Subtle studio backlight / depth-of-field volumetric aura
  Widget _buildRealisticStudioAura({
    required double centerX,
    required double centerY,
    required double scale,
    required Color color,
    double radius = 240,
    double opacity = 0.45,
  }) {
    return Positioned(
      left: centerX - (radius * scale / 2),
      top: centerY - (radius * scale / 2),
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Container(
            width: radius * scale,
            height: radius * scale,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  color.withOpacity(0.45),
                  color.withOpacity(0.18),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.50, 1.0],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Realistic water ripples beneath maritime objects (Yacht, Whale)
  Widget _buildRealisticWaterRipples({
    required double left,
    required double top,
    required double width,
    required double progress,
    required double opacity,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.85),
          child: Container(
            width: width,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF00E5FF).withOpacity(0.55),
                  const Color(0xFF0044AA).withOpacity(0.35),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Subtle realistic tire smoke & road sparks for vehicle drift
  Widget _buildSubtleTireDriftVfx({
    required double left,
    required double top,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.70),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.55),
                      const Color(0xFFCFD8DC).withOpacity(0.35),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFD54F),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFF9100),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Gentle falling flower petals drifting around bouquet
  Widget _buildFallingPetals({
    required double centerX,
    required double centerY,
    required double progress,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    return Positioned.fill(
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.85),
          child: Stack(
            children: List.generate(5, (i) {
              final driftP = ((progress * 1.5) + (i * 0.18)) % 1.0;
              final petalX = centerX - 60 + (i * 32.0) + (sin(driftP * 4 * pi) * 16);
              final petalY = centerY - 30 + (driftP * 180);
              final rot = driftP * 4 * pi;

              return Positioned(
                left: petalX,
                top: petalY,
                child: Transform.rotate(
                  angle: rot,
                  child: Container(
                    width: 10,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.elliptical(5, 7)),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF80AB), Color(0xFFFF4081)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF4081).withOpacity(0.35),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  /// Subtle celebration confetti flakes drifting around Birthday Cake
  Widget _buildCelebrationConfetti({
    required double centerX,
    required double centerY,
    required double progress,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    final colors = [
      const Color(0xFFFFD700),
      const Color(0xFFFF4081),
      const Color(0xFF00E5FF),
      const Color(0xFF76FF03),
      const Color(0xFFE040FB),
    ];

    return Positioned.fill(
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.80),
          child: Stack(
            children: List.generate(7, (i) {
              final driftP = ((progress * 1.6) + (i * 0.14)) % 1.0;
              final confX = centerX - 70 + (i * 26.0) + (sin(driftP * 3 * pi) * 12);
              final confY = centerY - 40 + (driftP * 190);
              final rot = driftP * 5 * pi;

              return Positioned(
                left: confX,
                top: confY,
                child: Transform.rotate(
                  angle: rot,
                  child: Container(
                    width: 6,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: colors[i % colors.length],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  /// Small natural luminous heart elements around Kitty
  Widget _buildKittyFloatingHearts({
    required double centerX,
    required double centerY,
    required double progress,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    return Positioned.fill(
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.75),
          child: Stack(
            children: List.generate(3, (i) {
              final p = ((progress * 1.3) + (i * 0.30)) % 1.0;
              final heartX = centerX + (i == 0 ? -45.0 : (i == 1 ? 50.0 : 0.0)) + (sin(p * 2 * pi) * 8);
              final heartY = centerY + 10 - (p * 70);

              return Positioned(
                left: heartX,
                top: heartY,
                child: Opacity(
                  opacity: (sin(p * pi)).clamp(0.0, 1.0),
                  child: const Icon(
                    Icons.favorite,
                    size: 15,
                    color: Color(0xFFFF80AB),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  /// Realistic airplane traveling around curved orbit of World Tour globe
  Widget _buildAirplaneOrbit({
    required double centerX,
    required double centerY,
    required double progress,
    required double scale,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    final angle = progress * 2.5 * pi;
    final radiusX = 118.0 * scale;
    final radiusY = 48.0 * scale;
    final planeX = centerX + (cos(angle) * radiusX);
    final planeY = centerY + (sin(angle) * radiusY);
    final headingAngle = angle + (pi / 2);

    return Positioned(
      left: planeX - 12,
      top: planeY - 12,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 0.95),
          child: Transform.rotate(
            angle: headingAngle,
            child: const Icon(
              Icons.airplanemode_active,
              size: 20,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Color(0xFF00E5FF),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// CUSTOM PAINTERS FOR PHOTOREALISTIC ATMOSPHERIC BACKDROPS
// =============================================================================

/// Realistic Space Starfield & Nebulae Painter (Directly reproduces Photo 2 reference!)
class _SpaceStarfieldPainter extends CustomPainter {
  final double progress;

  _SpaceStarfieldPainter({required this.progress});

  // 95 Deterministic Stars
  static final List<_StarData> _stars = List.generate(95, (i) {
    final rand = Random(i * 997 + 13);
    return _StarData(
      x: rand.nextDouble(),
      y: rand.nextDouble(),
      size: 0.8 + (rand.nextDouble() * 2.8),
      baseAlpha: 0.35 + (rand.nextDouble() * 0.65),
      speed: 1.5 + (rand.nextDouble() * 4.5),
      phase: rand.nextDouble() * 2 * pi,
      hasCrossFlare: i < 14, // Bright hero stars have 4-point anamorphic diffraction spike
      isColorTinted: rand.nextDouble() < 0.25,
      tintColor: rand.nextBool() ? const Color(0xFF80D8FF) : const Color(0xFFFF80AB),
    );
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Cosmic Deep Nebulae (Cyan & Deep Purple clouds)
    final nebulaPaint1 = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0x444A148C),
          Color(0x18311B92),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.75, size.height * 0.25),
        radius: size.width * 0.55,
      ));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), nebulaPaint1);

    final nebulaPaint2 = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0x3500B0FF),
          Color(0x100D47A1),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.25, size.height * 0.45),
        radius: size.width * 0.48,
      ));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), nebulaPaint2);

    // 2. Stars with Twinkling & Parallax Drift
    for (final star in _stars) {
      final shimmer = 0.65 + 0.35 * sin((progress * star.speed * 2 * pi) + star.phase);
      final alpha = (star.baseAlpha * shimmer).clamp(0.0, 1.0);
      final color = (star.isColorTinted ? star.tintColor : Colors.white).withOpacity(alpha);

      final sx = (star.x * size.width - (progress * 18.0)) % size.width;
      final sy = (star.y * size.height + (progress * 28.0)) % size.height;

      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      // Draw Star Core
      canvas.drawCircle(Offset(sx, sy), star.size / 2, paint);

      // Draw 4-point cross diffraction spike on hero stars
      if (star.hasCrossFlare && alpha > 0.6) {
        final spikePaint = Paint()
          ..color = color.withOpacity(alpha * 0.75)
          ..strokeWidth = 0.8
          ..style = PaintingStyle.stroke;

        final spikeLen = star.size * 3.5;
        canvas.drawLine(Offset(sx - spikeLen, sy), Offset(sx + spikeLen, sy), spikePaint);
        canvas.drawLine(Offset(sx, sy - spikeLen), Offset(sx, sy + spikeLen), spikePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SpaceStarfieldPainter oldDelegate) => true;
}

class _StarData {
  final double x;
  final double y;
  final double size;
  final double baseAlpha;
  final double speed;
  final double phase;
  final bool hasCrossFlare;
  final bool isColorTinted;
  final Color tintColor;

  const _StarData({
    required this.x,
    required this.y,
    required this.size,
    required this.baseAlpha,
    required this.speed,
    required this.phase,
    required this.hasCrossFlare,
    required this.isColorTinted,
    required this.tintColor,
  });
}

/// High-speed Highway Motion Streaks for Super Car
class _HighwaySpeedStreaksPainter extends CustomPainter {
  final double progress;

  _HighwaySpeedStreaksPainter({required this.progress});

  static final List<_StreakData> _streaks = List.generate(10, (i) {
    final rand = Random(i * 333 + 7);
    return _StreakData(
      yNorm: 0.14 + (rand.nextDouble() * 0.20),
      length: 80.0 + (rand.nextDouble() * 140.0),
      speed: 2.2 + (rand.nextDouble() * 3.0),
      color: i % 3 == 0
          ? const Color(0xFFFF9100)
          : (i % 3 == 1 ? const Color(0xFF00E5FF) : Colors.white),
      thickness: 1.2 + (rand.nextDouble() * 1.8),
    );
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final s in _streaks) {
      final curX = (size.width - ((progress * s.speed * size.width) % (size.width + s.length * 2))) + s.length;
      final curY = s.yNorm * size.height;

      final paint = Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.transparent,
            s.color.withOpacity(0.85),
            s.color,
            Colors.transparent,
          ],
          stops: const [0.0, 0.2, 0.8, 1.0],
        ).createShader(Rect.fromLTWH(curX - s.length, curY, s.length, s.thickness))
        ..strokeWidth = s.thickness
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(Offset(curX - s.length, curY), Offset(curX, curY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _HighwaySpeedStreaksPainter oldDelegate) => true;
}

class _StreakData {
  final double yNorm;
  final double length;
  final double speed;
  final Color color;
  final double thickness;

  const _StreakData({
    required this.yNorm,
    required this.length,
    required this.speed,
    required this.color,
    required this.thickness,
  });
}
