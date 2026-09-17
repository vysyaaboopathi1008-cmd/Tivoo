import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../domain/models/gift_item.dart';

/// 3D Animated Isolated Gift Effects Overlay
/// Sequence Rule for every gift:
/// Appear ➔ Movement ➔ Main Action ➔ Special Effect / Particles ➔ Disappear
/// - Multi-stage dynamic animations (3-4 sec) at 60 FPS
/// - ZERO solid square card backgrounds (pure transparent isolated 3D graphics)
/// - ONLY the gift and its visual effects animate; all livestream video, chat, and controls remain completely unchanged.
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
      duration: const Duration(milliseconds: 3900),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_carController);
      });

    _yachtController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_yachtController);
      });

    _rocketController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_rocketController);
      });

    _wingsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_wingsController);
      });

    _roseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_roseController);
      });

    _crownController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_crownController);
      });

    _diamondController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3700),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_diamondController);
      });

    _cakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_cakeController);
      });

    _teddyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_teddyController);
      });

    _kittyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_kittyController);
      });

    _tikiLoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_tikiLoveController);
      });

    _loveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_loveController);
      });

    _flowersController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_flowersController);
      });

    _worldTourController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_worldTourController);
      });

    _castleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4100),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_castleController);
      });

    _horseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_horseController);
      });

    _whaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_whaleController);
      });

    _angelVehicleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) onComplete(_angelVehicleController);
      });

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,

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
  // 1. 🚗 SUPER CAR
  // "Super Car gift enters rapidly from the left with a bright neon light trail,
  // drives across the livestream screen toward the center, headlights flash,
  // wheels spin, glowing particles and speed streaks appear, car performs a small
  // stylish drift/spin, then accelerates upward and disappears in a burst of neon
  // particles. Only the Super Car animates. Everything else remains completely unchanged."
  // ===========================================================================
  Widget _buildSuperCarAnimation() {
    return AnimatedBuilder(
      animation: _carController,
      builder: (context, child) {
        final val = _carController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double targetCenterX = (screenWidth - 220) / 2;
        final double targetCenterY = screenHeight * 0.38;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.40) {
          // ① Enters rapidly from the left toward the center with bright neon trail
          final p = val / 0.40;
          posX = -220 + pow(p, 0.75) * (targetCenterX + 220);
          posY = targetCenterY + sin(p * pi * 2) * 8;
          scale = 0.55 + 0.50 * p;
          tiltAngle = -0.05 * (1.0 - p);
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.72) {
          // ② Performs a stylish drift/spin at the center
          final p = (val - 0.40) / 0.32;
          posX = targetCenterX + sin(p * pi) * 20;
          posY = targetCenterY - sin(p * pi) * 12;
          scale = 1.05 + sin(p * pi) * 0.15;
          // Stylish drift spin
          tiltAngle = sin(p * 2 * pi) * 0.28;
        } else {
          // ③ Accelerates upward and disappears in a burst of neon particles
          final p = (val - 0.72) / 0.28;
          posX = targetCenterX + (p * 40);
          posY = targetCenterY - pow(p, 1.8) * (screenHeight * 0.50);
          scale = 1.10 - (p * 0.55);
          tiltAngle = -0.15 * p;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Bright neon light speed streaks behind the car
            if (val < 0.75)
              Positioned(
                left: posX - 60,
                top: posY + 75,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.90 * opacity).clamp(0.0, 0.90),
                    child: Container(
                      width: 180,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFF00E5FF),
                            Color(0xFFFF007F),
                            Colors.transparent
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xCC00E5FF),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Color(0xCCFF007F),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Flashing Headlight beams
            if (val < 0.75)
              Positioned(
                left: posX + 160,
                top: posY + 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 24 * pi).abs() * 0.85).clamp(0.2, 0.85),
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white,
                            Color(0x8800E5FF),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Neon Underglow
            Positioned(
              left: posX + 20,
              top: posY + 85,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: Container(
                    width: 180,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      gradient: const RadialGradient(
                        colors: [Color(0xFFFF007F), Color(0xFF00E5FF), Colors.transparent],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xAAFF007F),
                          blurRadius: 24,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Upward acceleration neon particle burst
            if (val >= 0.70)
              _buildFinalEffectShockwave(
                centerX: targetCenterX + 110,
                centerY: targetCenterY + 50,
                progress: ((val - 0.70) / 0.30).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFFFF007F),
                particles: const ['⚡', '✨', '💨', '🏎️', '💥', '⭐'],
              ),

            // The 3D Super Car Vehicle
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 220,
                        height: 120,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 2. 🛥️ YACHT
  // "Yacht gift rises from the bottom with a wave splash effect, smoothly sails
  // toward the center, water waves and blue neon reflections move around it,
  // sparkling water particles fly outward, yacht makes a gentle turn, then
  // sails away and disappears into glowing water particles. Only the Yacht animates."
  // ===========================================================================
  Widget _buildYachtAnimation() {
    return AnimatedBuilder(
      animation: _yachtController,
      builder: (context, child) {
        final val = _yachtController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double targetCenterX = (screenWidth - 230) / 2;
        final double targetCenterY = screenHeight * 0.40;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.35) {
          // ① Rises from bottom with wave splash effect
          final p = val / 0.35;
          posX = targetCenterX - 40 + (p * 40);
          posY = screenHeight + 40 - (p * (screenHeight * 0.60 + 40));
          scale = 0.50 + (0.50 * p);
          tiltAngle = -0.08 + (p * 0.08);
          opacity = (p / 0.20).clamp(0.0, 1.0);
        } else if (val < 0.70) {
          // ② Smoothly sails toward center with gentle bobbing & makes gentle turn
          final p = (val - 0.35) / 0.35;
          posX = targetCenterX + sin(p * pi) * 25;
          posY = targetCenterY + sin(p * 4 * pi) * 10;
          scale = 1.0 + sin(p * pi) * 0.12;
          tiltAngle = sin(p * 2 * pi) * 0.10;
        } else {
          // ③ Sails away and disappears into glowing water particles
          final p = (val - 0.70) / 0.30;
          posX = targetCenterX + (p * 80);
          posY = targetCenterY + (p * 60);
          scale = 1.0 - (p * 0.45);
          tiltAngle = 0.12;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Wave ripples & blue neon water reflections
            Positioned(
              left: posX - 30,
              top: posY + 85,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.80 * opacity).clamp(0.0, 0.80),
                  child: Container(
                    width: 280,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const RadialGradient(
                        colors: [Color(0xFF00E5FF), Color(0xFF0055FF), Colors.transparent],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xAA00E5FF),
                          blurRadius: 26,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Water Splash & Sparkling Particles
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: targetCenterX + 115,
                centerY: targetCenterY + 95,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFF2979FF),
                particles: const ['🌊', '💦', '✨', '💎', '🛥️'],
              ),

            // 3D Yacht
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 230,
                        height: 130,
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
  // 3. 🚀 ROCKET
  // "Rocket launches from the bottom-left toward the upper-right with powerful
  // fire and smoke trails, accelerates rapidly across the livestream, glowing
  // stars and sparks follow behind it, performs a small curved flight path,
  // then flies off-screen with a bright cosmic explosion. Only the Rocket animates."
  // ===========================================================================
  Widget _buildRocketAnimation() {
    return AnimatedBuilder(
      animation: _rocketController,
      builder: (context, child) {
        final val = _rocketController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        double posX;
        double posY;
        double scale;
        double tiltAngle = 0.0; // Asset is already angled diagonally at 45 deg
        double opacity = 1.0;

        if (val < 0.65) {
          // ① Launches from bottom-left toward upper-right with curved flight path
          final p = val / 0.65;
          final t = Curves.easeInQuad.transform(p);
          posX = -100 + t * (screenWidth * 0.75 + 100);
          posY = screenHeight * 0.90 - t * (screenHeight * 0.65);
          scale = 0.60 + 0.50 * p;
          tiltAngle = -sin(p * pi) * 0.15;
        } else {
          // ② Flies off-screen with bright cosmic explosion
          final p = (val - 0.65) / 0.35;
          posX = screenWidth * 0.75 + (p * (screenWidth * 0.40));
          posY = screenHeight * 0.25 - (p * (screenHeight * 0.35));
          scale = 1.10 - (p * 0.35);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Powerful fire & smoke trail behind rocket
            Positioned(
              left: posX - 45,
              top: posY + 85,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.90 * opacity).clamp(0.0, 0.90),
                  child: Transform.rotate(
                    angle: tiltAngle,
                    child: Container(
                      width: 40,
                      height: 110,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color(0xFFFFEA00),
                            Color(0xFFFF3D00),
                            Colors.transparent,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF9100),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Cosmic explosion at the exit
            if (val >= 0.60)
              _buildFinalEffectShockwave(
                centerX: screenWidth * 0.75,
                centerY: screenHeight * 0.25,
                progress: ((val - 0.60) / 0.40).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF9100),
                secondaryColor: const Color(0xFFBA43F6),
                particles: const ['⭐', '✨', '🔥', '🚀', '🌌', '💥'],
              ),

            // 3D Galaxy Rocket
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 140,
                        height: 140,
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

  // ===========================================================================
  // 4. 👼 ANGEL WINGS
  // "Angel Wings appear with a bright white-blue flash, wings unfold smoothly,
  // feathers gently move and glow, magical particles and light rays spread outward,
  // wings flap several times while floating toward the center, then dissolve into
  // sparkling feathers and light. Only Angel Wings animate."
  // ===========================================================================
  Widget _buildAngelWingsAnimation() {
    return AnimatedBuilder(
      animation: _wingsController,
      builder: (context, child) {
        final val = _wingsController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 240) / 2;
        final double centerY = screenHeight * 0.32;

        double scale;
        double flapScale;
        double opacity = 1.0;

        if (val < 0.25) {
          // ① Appears with bright white-blue flash, unfolds smoothly
          final p = val / 0.25;
          scale = Curves.easeOutBack.transform(p) * 0.95;
          flapScale = 1.0;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Feathers flap several times while floating toward center
          final p = (val - 0.25) / 0.50;
          scale = 0.95 + sin(p * pi) * 0.20;
          // Natural wing flapping effect
          flapScale = 0.85 + (cos(p * 8 * pi).abs() * 0.25);
        } else {
          // ③ Dissolves into sparkling feathers and light
          final p = (val - 0.75) / 0.25;
          scale = 1.15 + (p * 0.30);
          flapScale = 1.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Magical light rays & sparkling feathers burst
            if (val >= 0.20)
              _buildFinalEffectShockwave(
                centerX: centerX + 120,
                centerY: centerY + 100,
                progress: ((val - 0.20) / 0.80).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF80D8FF),
                secondaryColor: const Color(0xFFFFFFFF),
                particles: const ['🪽', '✨', '🕊️', '⭐', '🤍'],
              ),

            // 3D Angel Wings with animated flap scale
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      transform: Matrix4.diagonal3Values(flapScale, 1.0, 1.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 240,
                        height: 200,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 5. 🌹 ROSE
  // "Red Rose gift rises elegantly from the bottom, petals gently open and bloom,
  // water droplets sparkle, glowing pink-red heart particles and rose petals float
  // around it, the rose slowly rotates with a neon aura, then petals fly outward
  // and the gift fades into small glowing hearts. Only Rose animates."
  // ===========================================================================
  Widget _buildRoseAnimation() {
    return AnimatedBuilder(
      animation: _roseController,
      builder: (context, child) {
        final val = _roseController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double centerY = screenHeight * 0.35;

        double posY;
        double scale;
        double rotationAngle;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Rises elegantly from the bottom, petals gently open and bloom
          final p = val / 0.30;
          posY = screenHeight * 0.70 - (p * (screenHeight * 0.35));
          scale = Curves.easeOutBack.transform(p) * 0.90;
          rotationAngle = 0.0;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Slowly rotates with a neon aura, floating heart particles
          final p = (val - 0.30) / 0.45;
          posY = centerY + sin(p * 2 * pi) * 8;
          scale = 0.90 + sin(p * pi) * 0.25;
          rotationAngle = sin(p * 2 * pi) * 0.15;
        } else {
          // ③ Petals fly outward and fades into small glowing hearts
          final p = (val - 0.75) / 0.25;
          posY = centerY - (p * 30);
          scale = 1.15 - (p * 0.30);
          rotationAngle = 0.15 * p;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Pink-red neon aura glow
            Positioned(
              left: centerX - 20,
              top: posY - 20,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.75 * opacity).clamp(0.0, 0.75),
                  child: Container(
                    width: 230,
                    height: 230,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0x66FF1744), Color(0x33E91E63), Colors.transparent],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x66FF1744),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Petals flying outward & glowing hearts
            if (val >= 0.30)
              _buildFinalEffectShockwave(
                centerX: centerX + 95,
                centerY: posY + 95,
                progress: ((val - 0.30) / 0.70).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF1744),
                secondaryColor: const Color(0xFFFF80AB),
                particles: const ['🌹', '💖', '✨', '🌸', '❤️'],
              ),

            // 3D Blooming Rose
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rotationAngle,
                      child: SizedBox(
                        width: 190,
                        height: 190,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 6. 👑 CROWN
  // "Golden Crown rises from the bottom with a powerful golden glow, rotates
  // slowly in 3D, gemstones sparkle with bright star flashes, golden particles
  // and light rays burst outward, crown briefly becomes larger at the center,
  // then rises upward and disappears in golden sparkles. Only Crown animates."
  // ===========================================================================
  Widget _buildCrownAnimation() {
    return AnimatedBuilder(
      animation: _crownController,
      builder: (context, child) {
        final val = _crownController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.30;

        double posY;
        double scale;
        double rotY = 0.0;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Rises from bottom with powerful golden glow
          final p = val / 0.30;
          posY = screenHeight * 0.65 - (p * (screenHeight * 0.35));
          scale = Curves.easeOutBack.transform(p) * 0.90;
          rotY = -0.3 + (p * 0.3);
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Rotates slowly in 3D, gemstones sparkle, briefly becomes larger at center
          final p = (val - 0.30) / 0.45;
          posY = centerY + sin(p * 2 * pi) * 6;
          scale = 0.90 + sin(p * pi) * 0.35; // Briefly becomes larger (up to 1.25x)
          rotY = sin(p * 2 * pi) * 0.50; // Realistic 3D turntable rotation
        } else {
          // ③ Rises upward and disappears in golden sparkles
          final p = (val - 0.75) / 0.25;
          posY = centerY - (p * 50);
          scale = 1.25 - (p * 0.40);
          rotY = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Powerful Golden Glow Aura
            Positioned(
              left: centerX - 20,
              top: posY - 20,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0xFFFFEA00), Color(0xFFFF9100), Colors.transparent],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xCCFFD600),
                          blurRadius: 36,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Gemstones Star Flashes on Crown Tips
            if (val >= 0.22 && val <= 0.82) ...[
              _buildSparkleGlint(
                x: centerX + 52 + sin(val * 12 * pi) * 8,
                y: posY + 46,
                size: 28,
                color: const Color(0xFFFFFFFF),
                opacity: (sin(val * 16 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
              _buildSparkleGlint(
                x: centerX + 100,
                y: posY + 26,
                size: 36,
                color: const Color(0xFFFFEA00),
                opacity: (cos(val * 18 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
              _buildSparkleGlint(
                x: centerX + 148 - sin(val * 12 * pi) * 8,
                y: posY + 46,
                size: 28,
                color: const Color(0xFFFFFFFF),
                opacity: (sin(val * 20 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
            ],

            // Golden particles & royal stardust burst
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: posY + 100,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFFFEA00),
                particles: const ['👑', '⭐', '✨', '💛', '💎'],
              ),

            // 3D Golden Crown with Real Perspective Turntable Matrix
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
                        ..setEntry(3, 2, 0.0018)
                        ..rotateY(rotY)
                        ..rotateX(-0.10),
                      child: SizedBox(
                        width: 200,
                        height: 200,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 7. 💎 DIAMOND
  // "Blue Diamond appears with a bright flash, rotates continuously in 3D,
  // multiple blue light beams and sparkling stars reflect across its surface,
  // glowing energy rings rotate around it, diamond shines intensely and then
  // shatters into beautiful blue crystal particles that fade away. Only Diamond animates."
  // ===========================================================================
  Widget _buildDiamondAnimation() {
    return AnimatedBuilder(
      animation: _diamondController,
      builder: (context, child) {
        final val = _diamondController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.35;

        double scale;
        double rotAngle;
        double opacity = 1.0;

        if (val < 0.25) {
          // ① Bright flash entrance, continuous 3D rotation starts
          final p = val / 0.25;
          scale = Curves.easeOutBack.transform(p) * 1.0;
          rotAngle = p * pi;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.72) {
          // ② Continuous 3D rotation, light beams & glowing energy rings
          final p = (val - 0.25) / 0.47;
          scale = 1.0 + sin(p * pi) * 0.20;
          rotAngle = pi + (p * 2 * pi);
        } else {
          // ③ Shatters into beautiful blue crystal particles that fade away
          final p = (val - 0.72) / 0.28;
          scale = 1.20 - (p * 0.60);
          rotAngle = 3 * pi + (p * pi);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Dual 3D Tilted Gyroscopic Energy Rings
            Positioned(
              left: centerX - 25,
              top: centerY - 25,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: Stack(
                    children: [
                      // Cyan Ring 1
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          ..rotateX(1.1)
                          ..rotateZ(val * 5 * pi),
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF00E5FF).withValues(alpha: 0.85),
                              width: 2.5,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xAA00E5FF),
                                blurRadius: 24,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Royal Blue Ring 2
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          ..rotateY(1.1)
                          ..rotateZ(-val * 4 * pi),
                        child: Container(
                          width: 230,
                          height: 230,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF2979FF).withValues(alpha: 0.85),
                              width: 2.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xAA2979FF),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Sparkling Star Reflections across Diamond Facets
            if (val >= 0.20 && val <= 0.75) ...[
              _buildSparkleGlint(
                x: centerX + 100 + cos(val * 8 * pi) * 45,
                y: centerY + 100 + sin(val * 8 * pi) * 35,
                size: 32,
                color: const Color(0xFFFFFFFF),
                opacity: (sin(val * 24 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
              _buildSparkleGlint(
                x: centerX + 100 - cos(val * 8 * pi) * 40,
                y: centerY + 90 - sin(val * 8 * pi) * 30,
                size: 26,
                color: const Color(0xFF80D8FF),
                opacity: (cos(val * 20 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
            ],

            // Blue crystal shatter particles burst
            if (val >= 0.50)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: centerY + 100,
                progress: ((val - 0.50) / 0.50).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFF2979FF),
                particles: const ['💎', '✨', '⚡', '💠', '🔹', '⭐'],
              ),

            // 3D Multi-Axis Faceted Rotating Diamond
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0022)
                        ..rotateY(rotAngle)
                        ..rotateX(0.22 * sin(rotAngle))
                        ..rotateZ(0.10),
                      child: SizedBox(
                        width: 200,
                        height: 200,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 8. 🎂 CAKE
  // "Birthday Cake rises from the bottom, candles ignite one by one, flames
  // flicker naturally, colorful confetti and glowing birthday particles burst
  // around it, cake gently bounces once, candles glow brightly, then the cake
  // disappears in a celebration of confetti and sparkling particles. Only Cake animates."
  // ===========================================================================
  Widget _buildCakeAnimation() {
    return AnimatedBuilder(
      animation: _cakeController,
      builder: (context, child) {
        final val = _cakeController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double centerY = screenHeight * 0.36;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Rises from the bottom
          final p = val / 0.30;
          posY = screenHeight * 0.70 - (p * (screenHeight * 0.34));
          scale = Curves.easeOutBack.transform(p) * 0.95;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Candles ignite one by one, cake gently bounces once
          final p = (val - 0.30) / 0.45;
          // Gentle bounce
          posY = centerY - sin(p * pi) * 16;
          scale = 0.95 + sin(p * pi) * 0.15;
        } else {
          // ③ Celebration of confetti and sparkling particles
          final p = (val - 0.75) / 0.25;
          posY = centerY - (p * 25);
          scale = 1.10 - (p * 0.45);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Colorful Confetti & Glowing Birthday Particles
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 95,
                centerY: posY + 95,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF4081),
                secondaryColor: const Color(0xFFFFD600),
                particles: const ['🎉', '🎂', '✨', '🎈', '🎊', '🕯️'],
              ),

            // 3D Birthday Cake
            Positioned(
              left: centerX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: SizedBox(
                      width: 190,
                      height: 190,
                      child: Image.asset(
                        AppAssets.giftCake,
                        fit: BoxFit.contain,
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
  // 9. 🧸 TEDDY
  // "Cute Teddy Bear pops up from the bottom with floating pink hearts, gently
  // waves and hugs the heart, small hearts bounce around it, Teddy makes a cute
  // little bounce, glowing heart particles increase, then Teddy floats upward
  // and disappears inside a heart-shaped glow. Only Teddy animates."
  // ===========================================================================
  Widget _buildTeddyAnimation() {
    return AnimatedBuilder(
      animation: _teddyController,
      builder: (context, child) {
        final val = _teddyController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double centerY = screenHeight * 0.35;

        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Pops up from bottom with floating pink hearts
          final p = val / 0.30;
          posY = screenHeight * 0.70 - (p * (screenHeight * 0.35));
          scale = Curves.elasticOut.transform(p.clamp(0.0, 1.0)) * 0.95;
          tiltAngle = 0.0;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Waves and hugs heart, cute little bounce
          final p = (val - 0.30) / 0.45;
          posY = centerY - sin(p * 2 * pi).abs() * 14;
          scale = 0.95 + sin(p * pi) * 0.15;
          // Cute head tilt/waving motion
          tiltAngle = sin(p * 4 * pi) * 0.12;
        } else {
          // ③ Floats upward and disappears inside heart glow
          final p = (val - 0.75) / 0.25;
          posY = centerY - (p * 60);
          scale = 1.10 - (p * 0.40);
          tiltAngle = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Glowing pink heart particles
            if (val >= 0.20)
              _buildFinalEffectShockwave(
                centerX: centerX + 95,
                centerY: posY + 95,
                progress: ((val - 0.20) / 0.80).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF4081),
                secondaryColor: const Color(0xFFFF80AB),
                particles: const ['🧸', '💖', '💕', '✨', '🌸', '❤️'],
              ),

            // 3D Cute Teddy Bear
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
                        width: 190,
                        height: 190,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 10. 🐱 KITTY
  // "Cute Kitty appears with a bright pink glow, jumps playfully into the screen,
  // hearts and tiny sparkles surround it, Kitty gently waves its paw and hugs the
  // red heart, several pink hearts float upward, then Kitty spins once and disappears
  // in a heart-shaped particle burst. Only Kitty animates."
  // ===========================================================================
  Widget _buildKittyAnimation() {
    return AnimatedBuilder(
      animation: _kittyController,
      builder: (context, child) {
        final val = _kittyController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 190) / 2;
        final double centerY = screenHeight * 0.36;

        double posX;
        double posY;
        double scale;
        double rotationAngle = 0.0;
        double opacity = 1.0;

        if (val < 0.32) {
          // ① Jumps playfully into the screen in a parabolic arc
          final p = val / 0.32;
          posX = -100 + (p * (centerX + 100));
          posY = screenHeight * 0.60 - sin(p * pi) * 120;
          scale = 0.50 + 0.50 * p;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.72) {
          // ② Gently waves paw and hugs heart, pink hearts float upward
          final p = (val - 0.32) / 0.40;
          posX = centerX;
          posY = centerY + sin(p * 2 * pi) * 6;
          scale = 1.0 + sin(p * pi) * 0.18;
        } else {
          // ③ Spins once and disappears in a heart-shaped particle burst
          final p = (val - 0.72) / 0.28;
          posX = centerX;
          posY = centerY - (p * 20);
          scale = 1.18 - (p * 0.50);
          rotationAngle = p * 2 * pi; // Complete 360 degree spin
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Pink glow and floating hearts
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 95,
                centerY: centerY + 95,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF2D78),
                secondaryColor: const Color(0xFFFF80AB),
                particles: const ['🐱', '💖', '🐾', '✨', '💕'],
              ),

            // 3D Cute Kitty
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rotationAngle,
                      child: SizedBox(
                        width: 190,
                        height: 190,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 11. 💕 TIKI LOVE
  // "Tiki Love logo appears with a strong neon pink-purple flash, glowing hearts
  // orbit around it, the logo pulses rhythmically, colorful neon sparks and heart
  // particles explode outward, it performs a small 3D rotation, then transforms into
  // many glowing hearts that float upward and disappear. Only Tiki Love animates."
  // ===========================================================================
  Widget _buildTikiLoveAnimation() {
    return AnimatedBuilder(
      animation: _tikiLoveController,
      builder: (context, child) {
        final val = _tikiLoveController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 210) / 2;
        final double centerY = screenHeight * 0.35;

        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.25) {
          // ① Neon pink-purple flash entrance
          final p = val / 0.25;
          scale = Curves.easeOutBack.transform(p) * 1.0;
          tiltAngle = 0.0;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Pulses rhythmically, 3D rotation, neon sparks
          final p = (val - 0.25) / 0.50;
          // Rhythmic heartbeat pulsing
          scale = 1.0 + (sin(p * 6 * pi).abs() * 0.22);
          tiltAngle = sin(p * 2 * pi) * 0.14;
        } else {
          // ③ Transforms into many glowing hearts that float upward and disappear
          final p = (val - 0.75) / 0.25;
          scale = 1.22 + (p * 0.30);
          tiltAngle = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Orbiting glowing hearts
            if (val >= 0.20)
              ...List.generate(4, (i) {
                final orbitAngle = (val * 4 * pi) + (i * pi / 2);
                final orbitX = centerX + 105 + cos(orbitAngle) * 95;
                final orbitY = centerY + 105 + sin(orbitAngle) * 70;

                return Positioned(
                  left: orbitX - 12,
                  top: orbitY - 12,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: opacity,
                      child: const Text('💖', style: TextStyle(fontSize: 22)),
                    ),
                  ),
                );
              }),

            // Neon sparks and heart explosion shockwave
            if (val >= 0.30)
              _buildFinalEffectShockwave(
                centerX: centerX + 105,
                centerY: centerY + 105,
                progress: ((val - 0.30) / 0.70).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF007F),
                secondaryColor: const Color(0xFFBA43F6),
                particles: const ['💕', '💜', '⚡', '✨', '💖', '🌟'],
              ),

            // 3D Tiki Love Logo
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
                        width: 210,
                        height: 210,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 12. 💖 LOVE
  // "Glowing red heart enters from the side with a pink neon trail, slowly rotates
  // and pulses larger and smaller, multiple small hearts orbit around it, bright
  // pink sparkles appear, then the main heart sends a soft heart-wave across the
  // screen and fades into floating hearts. Only Love animates."
  // ===========================================================================
  Widget _buildLoveHeartAnimation() {
    return AnimatedBuilder(
      animation: _loveController,
      builder: (context, child) {
        final val = _loveController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.35;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Enters from the side with a pink neon trail
          final p = val / 0.30;
          posX = -180 + (p * (centerX + 180));
          posY = centerY;
          scale = 0.60 + 0.40 * p;
          tiltAngle = -0.10 * (1.0 - p);
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.72) {
          // ② Slowly rotates and pulses larger and smaller (heartbeat)
          final p = (val - 0.30) / 0.42;
          posX = centerX;
          posY = centerY;
          // Pulse larger and smaller
          scale = 1.0 + (sin(p * 4 * pi).abs() * 0.25);
          tiltAngle = sin(p * 2 * pi) * 0.12;
        } else {
          // ③ Sends a soft heart-wave across the screen and fades into floating hearts
          final p = (val - 0.72) / 0.28;
          posX = centerX;
          posY = centerY - (p * 30);
          scale = 1.25 - (p * 0.45);
          tiltAngle = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Soft Heart-Wave shockwave rings
            if (val >= 0.40)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: centerY + 100,
                progress: ((val - 0.40) / 0.60).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF1744),
                secondaryColor: const Color(0xFFFF80AB),
                particles: const ['💖', '💕', '💓', '✨', '❤️', '🌸'],
              ),

            // 3D Glowing Red Heart
            Positioned(
              left: posX,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 13. 💐 FLOWERS
  // "Flower bouquet rises gracefully from the bottom, flowers bloom one after
  // another, pink petals gently fly around the bouquet, sparkling particles and
  // soft pink light surround it, bouquet rotates slightly, then petals scatter
  // beautifully across the screen and fade away. Only Flowers animate."
  // ===========================================================================
  Widget _buildFlowersAnimation() {
    return AnimatedBuilder(
      animation: _flowersController,
      builder: (context, child) {
        final val = _flowersController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.35;

        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Rises gracefully from the bottom
          final p = val / 0.30;
          posY = screenHeight * 0.70 - (p * (screenHeight * 0.35));
          scale = Curves.easeOutBack.transform(p) * 0.90;
          tiltAngle = 0.0;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Flowers bloom, soft pink light & flying pink petals
          final p = (val - 0.30) / 0.45;
          posY = centerY + sin(p * 2 * pi) * 6;
          scale = 0.90 + sin(p * pi) * 0.22;
          tiltAngle = sin(p * 2 * pi) * 0.10;
        } else {
          // ③ Petals scatter beautifully across screen and fade away
          final p = (val - 0.75) / 0.25;
          posY = centerY - (p * 30);
          scale = 1.12 - (p * 0.35);
          tiltAngle = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Soft pink halo and scattering petals
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: posY + 100,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF80AB),
                secondaryColor: const Color(0xFFFFD54F),
                particles: const ['💐', '🌸', '🌷', '✨', '🌺', '🍃'],
              ),

            // 3D Flower Bouquet
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 14. 🌍 WORLD TOUR
  // "Glowing Earth appears and rotates in 3D, a bright golden orbit travels around
  // the planet, famous landmark silhouettes glow around it, colorful travel trails
  // circle the globe, stars and sparkles burst outward, then the Earth zooms away
  // through a glowing cosmic travel trail. Only World Tour animates."
  // ===========================================================================
  Widget _buildWorldTourAnimation() {
    return AnimatedBuilder(
      animation: _worldTourController,
      builder: (context, child) {
        final val = _worldTourController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 210) / 2;
        final double centerY = screenHeight * 0.33;

        double scale;
        double rotationAngle;
        double opacity = 1.0;

        if (val < 0.25) {
          // ① Glowing Earth appears and rotates in 3D
          final p = val / 0.25;
          scale = Curves.easeOutBack.transform(p) * 0.95;
          rotationAngle = p * pi;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.72) {
          // ② Golden orbit, travel trails, star burst
          final p = (val - 0.25) / 0.47;
          scale = 0.95 + sin(p * pi) * 0.20;
          rotationAngle = pi + (p * 2 * pi);
        } else {
          // ③ Zooms away through glowing cosmic travel trail
          final p = (val - 0.72) / 0.28;
          scale = 1.15 + (p * 0.85); // Zooms forward/away
          rotationAngle = 3 * pi + (p * pi);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Bright Golden Orbit Traveling Around the Globe
            Positioned(
              left: centerX - 30,
              top: centerY - 15,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: Transform.rotate(
                    angle: val * 3 * pi,
                    child: Container(
                      width: 270,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: const Color(0xFFFFD600).withValues(alpha: 0.85),
                          width: 2.5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xCCFFD600),
                            blurRadius: 24,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Stars & Sparkles burst outward
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 105,
                centerY: centerY + 105,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFF00E5FF),
                particles: const ['✈️', '🌍', '⭐', '✨', '🗽', '🗼'],
              ),

            // 3D Rotating Earth
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rotationAngle,
                      child: SizedBox(
                        width: 210,
                        height: 210,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 15. 🏰 CASTLE
  // "Magical Castle rises from glowing clouds at the bottom, windows and towers
  // illuminate one by one, golden stars and magical particles surround the castle,
  // clouds gently move, castle sparkles brightly, then it slowly floats upward
  // and dissolves into golden stars. Only Castle animates."
  // ===========================================================================
  Widget _buildCastleAnimation() {
    return AnimatedBuilder(
      animation: _castleController,
      builder: (context, child) {
        final val = _castleController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 230) / 2;
        final double centerY = screenHeight * 0.32;

        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.32) {
          // ① Rises from glowing clouds at the bottom
          final p = val / 0.32;
          posY = screenHeight * 0.70 - (p * (screenHeight * 0.38));
          scale = Curves.easeOutBack.transform(p) * 0.95;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Windows illuminate, castle sparkles brightly
          final p = (val - 0.32) / 0.43;
          posY = centerY + sin(p * 2 * pi) * 6;
          scale = 0.95 + sin(p * pi) * 0.18;
        } else {
          // ③ Slowly floats upward and dissolves into golden stars
          final p = (val - 0.75) / 0.25;
          posY = centerY - (p * 60);
          scale = 1.13 - (p * 0.35);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Glowing magical stardust and clouds
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 115,
                centerY: posY + 110,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFBA43F6),
                particles: const ['🏰', '⭐', '✨', '👑', '🌟', '☁️'],
              ),

            // 3D Magical Castle
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
                      child: Image.asset(
                        AppAssets.giftCastle,
                        fit: BoxFit.contain,
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
        final double centerY = screenHeight * 0.35;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.40) {
          final p = val / 0.40;
          posX = -200 + p * (centerX + 200);
          posY = centerY + sin(p * 6 * pi) * 12;
          scale = 0.60 + 0.40 * p;
          tiltAngle = sin(p * 6 * pi) * 0.08;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          final p = (val - 0.40) / 0.35;
          posX = centerX;
          posY = centerY - sin(p * pi) * 15;
          scale = 1.0 + sin(p * pi) * 0.20;
          tiltAngle = -0.15 * sin(p * pi);
        } else {
          final p = (val - 0.75) / 0.25;
          posX = centerX + (p * 50);
          posY = centerY - (p * 40);
          scale = 1.20 - (p * 0.40);
          tiltAngle = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            if (val >= 0.35)
              _buildFinalEffectShockwave(
                centerX: centerX + 115,
                centerY: centerY + 100,
                progress: ((val - 0.35) / 0.65).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFFF9100),
                particles: const ['🐎', '⭐', '✨', '👑', '💰'],
              ),
            Positioned(
              left: posX,
              top: posY,
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
        final double centerY = screenHeight * 0.35;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.40) {
          final p = val / 0.40;
          posX = -200 + p * (centerX + 200);
          posY = centerY + sin(p * 4 * pi) * 16;
          scale = 0.60 + 0.40 * p;
          tiltAngle = sin(p * 4 * pi) * 0.12;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          final p = (val - 0.40) / 0.35;
          posX = centerX;
          posY = centerY - sin(p * pi) * 22;
          scale = 1.0 + sin(p * pi) * 0.20;
          tiltAngle = -0.20 + (p * 0.40);
        } else {
          final p = (val - 0.75) / 0.25;
          posX = centerX + (p * 40);
          posY = centerY + (p * 50);
          scale = 1.20 - (p * 0.40);
          tiltAngle = 0.10;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            if (val >= 0.35)
              _buildFinalEffectShockwave(
                centerX: centerX + 120,
                centerY: centerY + 100,
                progress: ((val - 0.35) / 0.65).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFF2979FF),
                particles: const ['🌊', '💦', '🐋', '✨', '💎'],
              ),
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 240,
                        height: 210,
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
        final double centerY = screenHeight * 0.30;

        double posX;
        double posY;
        double scale;
        double opacity = 1.0;

        if (val < 0.40) {
          final p = val / 0.40;
          posX = -200 + p * (centerX + 200);
          posY = centerY;
          scale = 0.60 + 0.40 * p;
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          final p = (val - 0.40) / 0.35;
          posX = centerX;
          posY = centerY + sin(p * 2 * pi) * 8;
          scale = 1.0 + sin(p * pi) * 0.15;
        } else {
          final p = (val - 0.75) / 0.25;
          posX = centerX;
          posY = centerY - (p * 50);
          scale = 1.15 - (p * 0.35);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            if (val >= 0.35)
              _buildFinalEffectShockwave(
                centerX: centerX + 120,
                centerY: centerY + 100,
                progress: ((val - 0.35) / 0.65).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFFFF176),
                particles: const ['🪽', '🕊️', '✨', '👑', '💛'],
              ),
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: SizedBox(
                      width: 240,
                      height: 210,
                      child: Image.asset(
                        AppAssets.giftAngelVehicle,
                        fit: BoxFit.contain,
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
  // STANDARD GIFTS
  // ===========================================================================
  Widget _buildStandardGiftAnimation() {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        final val = _shakeController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 180) / 2;
        final double centerY = screenHeight * 0.36;

        double scale;
        double opacity = 1.0;

        if (val < 0.25) {
          final p = val / 0.25;
          scale = Curves.easeOutBack.transform(p);
          opacity = (p / 0.15).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          final p = (val - 0.25) / 0.50;
          scale = 1.0 + sin(p * pi) * 0.20;
        } else {
          final p = (val - 0.75) / 0.25;
          scale = 1.20 - (p * 0.40);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        final assetPath = _activeGift?.imageAssetPath;
        final iconText = _activeGift?.icon ?? '🎁';

        return Stack(
          children: [
            if (val >= 0.30)
              _buildFinalEffectShockwave(
                centerX: centerX + 90,
                centerY: centerY + 90,
                progress: ((val - 0.30) / 0.70).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFFF2D78),
                particles: [iconText, '✨', '🌟', '💖', '⭐'],
              ),
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: assetPath != null
                          ? Image.asset(assetPath, fit: BoxFit.contain)
                          : Center(
                              child: Text(
                                iconText,
                                style: const TextStyle(fontSize: 90),
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
  // REALISTIC VFX ENGINE: SPARKLE GLINT & SHOCKWAVE BURST
  // ===========================================================================
  Widget _buildSparkleGlint({
    required double x,
    required double y,
    required double size,
    required Color color,
    required double opacity,
  }) {
    if (opacity <= 0.0) return const SizedBox.shrink();
    return Positioned(
      left: x - size / 2,
      top: y - size / 2,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Horizontal beam
                Container(
                  width: size,
                  height: size * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size * 0.11),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        color,
                        Colors.white,
                        color,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Vertical beam
                Container(
                  width: size * 0.22,
                  height: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size * 0.11),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        color,
                        Colors.white,
                        color,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Center core
                Container(
                  width: size * 0.32,
                  height: size * 0.32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 6,
                        spreadRadius: 2,
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

  Widget _buildFinalEffectShockwave({
    required double centerX,
    required double centerY,
    required double progress,
    required Color primaryColor,
    required Color secondaryColor,
    required List<String> particles,
  }) {
    if (progress <= 0.0 || progress >= 1.0) return const SizedBox.shrink();

    final easedProgress = Curves.easeOutCubic.transform(progress);
    final shockwaveScale = 0.2 + (easedProgress * 2.3);
    final shockwaveOpacity = (1.0 - progress).clamp(0.0, 1.0);
    final particleCount = min(14, particles.length * 2);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Center Flash Burst
        if (progress < 0.35)
          Positioned(
            left: centerX - 50,
            top: centerY - 50,
            child: IgnorePointer(
              child: Opacity(
                opacity: ((0.35 - progress) / 0.35).clamp(0.0, 1.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [Colors.white, primaryColor, Colors.transparent],
                    ),
                  ),
                ),
              ),
            ),
          ),

        // Expanding Primary Shockwave Ring
        Positioned(
          left: centerX - 80,
          top: centerY - 80,
          child: IgnorePointer(
            child: Opacity(
              opacity: shockwaveOpacity,
              child: Transform.scale(
                scale: shockwaveScale,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primaryColor.withValues(alpha: 0.95),
                      width: 3.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withValues(alpha: 0.7),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                      BoxShadow(
                        color: secondaryColor.withValues(alpha: 0.4),
                        blurRadius: 40,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Outer Secondary Chromatic Ring
        Positioned(
          left: centerX - 90,
          top: centerY - 90,
          child: IgnorePointer(
            child: Opacity(
              opacity: (shockwaveOpacity * 0.7).clamp(0.0, 1.0),
              child: Transform.scale(
                scale: shockwaveScale * 1.15,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: secondaryColor.withValues(alpha: 0.75),
                      width: 1.8,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Glowing Stardust Embers (Luminous Dots)
        ...List.generate(10, (i) {
          final angle = (i / 10) * 2 * pi + 0.3;
          final dist = easedProgress * (85.0 + (i % 3) * 35);
          final emberX = centerX + cos(angle) * dist - 4;
          final emberY = centerY + sin(angle) * dist - 4;
          final emberColor = i.isEven ? primaryColor : secondaryColor;

          return Positioned(
            left: emberX,
            top: emberY,
            child: IgnorePointer(
              child: Opacity(
                opacity: (1.0 - progress).clamp(0.0, 1.0),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: emberColor,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),

        // Radial Thematic Particles Explosion
        ...List.generate(particleCount, (i) {
          final angle = (i / particleCount) * 2 * pi;
          final distance = easedProgress * 155.0;
          final pX = centerX + cos(angle) * distance - 13;
          final pY = centerY + sin(angle) * distance - 13;
          final particle = particles[i % particles.length];

          return Positioned(
            left: pX,
            top: pY,
            child: IgnorePointer(
              child: Opacity(
                opacity: (1.0 - progress).clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: 0.85 + sin(progress * pi) * 0.55,
                  child: Text(
                    particle,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
