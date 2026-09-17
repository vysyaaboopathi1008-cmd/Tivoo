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
  // 1. 🏎️ SUPER CAR (Reference Style 🔥)
  // "The futuristic super car suddenly appears with bright headlights, accelerates
  // rapidly from the left side toward the center, glowing wheels spin at high speed,
  // strong golden light trails follow the car, camera slightly shakes during acceleration,
  // the car performs a stylish drift around the center, tire smoke and golden sparks
  // appear, headlights flash, then the car speeds away and returns smoothly for a
  // seamless loop. Ultra-premium energetic live gift animation, smooth 60 FPS."
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

        // Camera slight shake during rapid acceleration (val < 0.38)
        final double cameraShakeX = (val < 0.38) ? sin(val * 48 * pi) * 2.8 : 0.0;
        final double cameraShakeY = (val < 0.38) ? cos(val * 48 * pi) * 1.5 : 0.0;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.38) {
          // ① Suddenly appears with bright headlights, accelerates rapidly from left toward center
          final p = val / 0.38;
          posX = -240 + pow(p, 0.75) * (targetCenterX + 240);
          posY = targetCenterY + sin(p * pi * 2) * 6;
          scale = 0.60 + 0.45 * p;
          tiltAngle = -0.04 * (1.0 - p);
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Performs a stylish drift around the center with tire smoke & golden sparks
          final p = (val - 0.38) / 0.36;
          posX = targetCenterX + sin(p * pi) * 28;
          posY = targetCenterY - sin(p * pi) * 14;
          scale = 1.05 + sin(p * pi) * 0.18;
          // Stylish drift rotation & skid
          tiltAngle = sin(p * 2 * pi) * 0.32;
        } else {
          // ③ Headlights flash, speeds away smoothly returning for a seamless loop
          final p = (val - 0.74) / 0.26;
          posX = targetCenterX + pow(p, 1.4) * (screenWidth * 0.60);
          posY = targetCenterY - (p * 40);
          scale = 1.23 - (p * 0.60);
          tiltAngle = 0.08 * p;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        posX += cameraShakeX;
        posY += cameraShakeY;

        return Stack(
          children: [
            // Strong Golden Light Trails following the car
            if (val < 0.78)
              Positioned(
                left: posX - 90,
                top: posY + 70,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.95 * opacity).clamp(0.0, 0.95),
                    child: Container(
                      width: 220,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFFFFEA00),
                            Color(0xFFFF9100),
                            Colors.transparent
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xCCFFD700),
                            blurRadius: 22,
                            spreadRadius: 3,
                          ),
                          BoxShadow(
                            color: Color(0xCCFF9100),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Bright Headlights with twin flash beams
            if (val < 0.85)
              Positioned(
                left: posX + 165,
                top: posY + 35,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 28 * pi).abs() * 0.85 + 0.15).clamp(0.2, 1.0),
                    child: Container(
                      width: 170,
                      height: 55,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white,
                            Color(0xCCFFF9C4),
                            Color(0x66FFD700),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Golden Underglow & Spinning Wheels Aura
            Positioned(
              left: posX + 15,
              top: posY + 82,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.90 * opacity).clamp(0.0, 0.90),
                  child: Container(
                    width: 190,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const RadialGradient(
                        colors: [Color(0xFFFFD700), Color(0xFFFF6D00), Colors.transparent],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xAAFFD700),
                          blurRadius: 26,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Tire Smoke Puffs & Golden Sparks Burst during drift (val >= 0.38)
            if (val >= 0.38 && val <= 0.80)
              Positioned(
                left: targetCenterX - 20,
                top: targetCenterY + 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: sin((val - 0.38) / 0.42 * pi).clamp(0.0, 0.85),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('💨', style: TextStyle(fontSize: 32)),
                        SizedBox(width: 8),
                        Text('✨', style: TextStyle(fontSize: 22)),
                        SizedBox(width: 40),
                        Text('💥', style: TextStyle(fontSize: 28)),
                        SizedBox(width: 8),
                        Text('💨', style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                ),
              ),

            // Golden Spark Blast & Energy Shockwave during drift & acceleration
            if (val >= 0.45)
              _buildFinalEffectShockwave(
                centerX: targetCenterX + 110,
                centerY: targetCenterY + 50,
                progress: ((val - 0.45) / 0.55).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD700),
                secondaryColor: const Color(0xFFFF6D00),
                particles: const ['⚡', '✨', '💨', '🏎️', '💥', '⭐'],
              ),

            // The 3D Futuristic Super Car Vehicle
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
  // "The luxury yacht rapidly sails into the screen from the left with realistic
  // water movement, leaving a glowing blue water trail behind, ocean waves move
  // naturally beneath the yacht, bright blue and white particles sparkle around it,
  // the yacht accelerates forward and slightly toward the viewer, creates a powerful
  // splash effect, then smoothly slows down and returns to the starting position.
  // Cinematic luxury live gift animation, smooth 60 FPS, seamless loop."
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

        if (val < 0.38) {
          // ① Rapidly sails into screen from the left with realistic water movement
          final p = val / 0.38;
          posX = -240 + pow(p, 0.78) * (targetCenterX + 240);
          posY = targetCenterY + sin(p * 8 * pi) * 6;
          scale = 0.65 + (0.45 * p);
          tiltAngle = sin(p * 6 * pi) * 0.05;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Ocean waves move naturally beneath, yacht accelerates forward toward viewer, creates powerful splash
          final p = (val - 0.38) / 0.37;
          posX = targetCenterX + sin(p * pi) * 16;
          posY = targetCenterY + sin(p * 6 * pi) * 7;
          scale = 1.10 + sin(p * pi) * 0.22;
          tiltAngle = sin(p * 4 * pi) * 0.06;
        } else {
          // ③ Smoothly slows down and returns to the starting position for a seamless loop
          final p = (val - 0.75) / 0.25;
          posX = targetCenterX + (p * 40);
          posY = targetCenterY + (p * 18);
          scale = 1.20 - (p * 0.40);
          tiltAngle = 0.04 * (1.0 - p);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Glowing Blue Water Trail / Wake Streaming Behind the Yacht
            if (val < 0.85)
              Positioned(
                left: posX - 90,
                top: posY + 82,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.90 * opacity).clamp(0.0, 0.90),
                    child: Container(
                      width: 220,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFF0055FF),
                            Color(0xFF00E5FF),
                            Color(0xFF80D8FF),
                            Colors.transparent,
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xCC00E5FF),
                            blurRadius: 20,
                            spreadRadius: 3,
                          ),
                          BoxShadow(
                            color: Color(0x880055FF),
                            blurRadius: 28,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Ocean Wave Ripples naturally moving beneath
            Positioned(
              left: posX - 20,
              top: posY + 92,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: Container(
                    width: 270,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      gradient: const RadialGradient(
                        colors: [Color(0xFF00E5FF), Color(0xFF0022AA), Colors.transparent],
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

            // Powerful Water Splash Effect & Sparkling Particles
            if (val >= 0.28)
              _buildFinalEffectShockwave(
                centerX: targetCenterX + 115,
                centerY: targetCenterY + 95,
                progress: ((val - 0.28) / 0.72).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFF2979FF),
                particles: const ['🌊', '💦', '✨', '💎', '💧', '🛥️'],
              ),

            // 3D Luxury Yacht with realistic bobbing
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
  // "The futuristic rocket launches powerfully from the bottom-left toward the
  // upper-right, its engines produce intense blue and pink flames, glowing smoke
  // and star particles trail behind, the rocket accelerates rapidly through space,
  // camera follows the rocket with dynamic movement, planets and stars move quickly
  // in the background, the rocket performs a small stylish turn, creates a bright
  // cosmic energy burst, then smoothly returns to the starting position. High-energy
  // cinematic live gift animation, smooth 60 FPS, seamless loop."
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
        double tiltAngle = 0.0;
        double opacity = 1.0;

        if (val < 0.60) {
          // ① Launches powerfully from bottom-left toward upper-right with dynamic acceleration
          final p = val / 0.60;
          final t = Curves.easeInQuad.transform(p);
          posX = -100 + t * (screenWidth * 0.70 + 100);
          posY = screenHeight * 0.88 - t * (screenHeight * 0.60);
          scale = 0.65 + 0.55 * p;
          tiltAngle = -sin(p * pi) * 0.12;
        } else if (val < 0.82) {
          // ② Performs a small stylish turn & creates a bright cosmic energy burst
          final p = (val - 0.60) / 0.22;
          posX = screenWidth * 0.70 + sin(p * pi) * 20;
          posY = screenHeight * 0.28 + sin(p * pi) * 15;
          scale = 1.20 + sin(p * pi) * 0.15;
          tiltAngle = sin(p * 2 * pi) * 0.25;
        } else {
          // ③ Smoothly returns to starting position for a seamless loop
          final p = (val - 0.82) / 0.18;
          posX = screenWidth * 0.70 + (p * 50);
          posY = screenHeight * 0.28 - (p * 50);
          scale = 1.35 - (p * 0.65);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Background cosmic stars and planets moving quickly
            if (val >= 0.15 && val <= 0.85)
              Positioned(
                left: posX - 60,
                top: posY - 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * pi) * 0.85).clamp(0.0, 0.85),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('🪐', style: TextStyle(fontSize: 26)),
                        SizedBox(width: 40),
                        Text('⭐', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 50),
                        Text('🌌', style: TextStyle(fontSize: 28)),
                      ],
                    ),
                  ),
                ),
              ),

            // Intense Blue & Pink Engine Flames with glowing smoke & star particles
            if (val < 0.82)
              Positioned(
                left: posX - 48,
                top: posY + 82,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.95 * opacity).clamp(0.0, 0.95),
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: Container(
                        width: 48,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Color(0xFF00E5FF), // Intense Blue flame
                              Color(0xFFFF007F), // Hot Pink flame
                              Colors.transparent,
                            ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xCC00E5FF),
                              blurRadius: 22,
                              spreadRadius: 3,
                            ),
                            BoxShadow(
                              color: Color(0xCCFF007F),
                              blurRadius: 26,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Bright Cosmic Energy Burst at the stylish turn
            if (val >= 0.55)
              _buildFinalEffectShockwave(
                centerX: screenWidth * 0.70 + 70,
                centerY: screenHeight * 0.28 + 70,
                progress: ((val - 0.55) / 0.45).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFFFF007F),
                particles: const ['🚀', '⭐', '✨', '🔥', '🌌', '💥'],
              ),

            // The 3D Futuristic Rocket
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
  // 4. 🪽 ANGEL WINGS
  // "The glowing angel wings appear with a powerful blue-white magical burst,
  // wings slowly unfold from closed to fully open, feathers shimmer individually,
  // bright heavenly light rays spread outward, sparkling particles and tiny glowing
  // feathers float around, the wings gently flap two times, then expand dramatically
  // toward the viewer with a beautiful energy wave, followed by a soft glowing pulse
  // before returning smoothly to the original position. Divine premium live gift
  // animation, smooth 60 FPS, seamless loop."
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

        if (val < 0.28) {
          // ① Appears with powerful blue-white magical burst, wings slowly unfold from closed to fully open
          final p = val / 0.28;
          scale = 0.50 + Curves.easeOutBack.transform(p) * 0.50;
          flapScale = 0.15 + 0.85 * Curves.easeOutCubic.transform(p);
          opacity = (p / 0.10).clamp(0.0, 1.0);
        } else if (val < 0.70) {
          // ② Feathers shimmer, wings gently flap two times
          final p = (val - 0.28) / 0.42;
          scale = 1.0 + sin(p * pi) * 0.10;
          // Exactly two gentle flaps: 2 cycles across 0..1
          final flapCycle = sin(p * 4 * pi);
          flapScale = 0.82 + (flapCycle.abs() * 0.28);
        } else {
          // ③ Expands dramatically toward viewer with energy wave, soft pulse, and returns smoothly
          final p = (val - 0.70) / 0.30;
          scale = 1.10 + (sin(p * pi) * 0.35); // Expands dramatically toward viewer
          flapScale = 1.0;
          opacity = (1.0 - pow(p, 2.0)).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Powerful Blue-White Magical Burst & Heavenly Light Rays
            if (val >= 0.12)
              _buildFinalEffectShockwave(
                centerX: centerX + 120,
                centerY: centerY + 100,
                progress: ((val - 0.12) / 0.88).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF80D8FF),
                secondaryColor: const Color(0xFFFFFFFF),
                particles: const ['🪽', '✨', '🕊️', '⭐', '🤍', '🌟'],
              ),

            // Shimmering Light Beam Rays spreading outward
            if (val >= 0.25 && val <= 0.75)
              _buildSparkleGlint(
                x: centerX + 120,
                y: centerY + 100,
                size: 260,
                color: const Color(0xFFB3E5FC),
                opacity: sin((val - 0.25) / 0.50 * pi) * 0.80,
              ),

            // Soft glowing pulse halo behind wings
            Positioned(
              left: centerX - 20,
              top: centerY - 20,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (sin(val * 4 * pi).abs() * 0.75 * opacity).clamp(0.0, 0.75),
                  child: Container(
                    width: 280,
                    height: 240,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color(0xCCB3E5FC),
                          Color(0x6680D8FF),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 3D Angel Wings with individual shimmer & animated unfolding flap scale
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
  // "The golden crown rises from below through a bright golden light beam, rotates
  // slowly while floating in the air, royal golden particles and sparkling stars
  // surround it, a glowing royal energy ring appears behind the crown, the crown
  // moves forward and slightly downward as if being placed on an invisible royal head,
  // then rises back up with a powerful golden flash and returns to its starting position.
  // Majestic premium live gift animation, smooth 60 FPS, seamless loop."
  // ===========================================================================
  Widget _buildCrownAnimation() {
    return AnimatedBuilder(
      animation: _crownController,
      builder: (context, child) {
        final val = _crownController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.32;

        double posY;
        double scale;
        double rotY = 0.0;
        double opacity = 1.0;

        if (val < 0.32) {
          // ① Rises from below through a bright golden light beam
          final p = val / 0.32;
          posY = screenHeight * 0.75 - (p * (screenHeight * 0.43));
          scale = 0.70 + (Curves.easeOutBack.transform(p) * 0.35);
          rotY = -0.4 + (p * 0.4);
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.72) {
          // ② Rotates slowly floating in air; moves forward & downward onto invisible head
          final p = (val - 0.32) / 0.40;
          // Moves forward and downward (placing on head)
          posY = centerY + (sin(p * pi) * 22);
          scale = 1.05 + (sin(p * pi) * 0.28);
          rotY = sin(p * 2 * pi) * 0.45; // Slow 3D floating rotation
        } else {
          // ③ Rises back up with powerful golden flash, returns to starting position
          final p = (val - 0.72) / 0.28;
          posY = centerY - (p * 28);
          scale = 1.33 - (p * 0.45);
          rotY = (1.0 - p) * 0.20;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Bright Golden Vertical Light Beam from below
            if (val < 0.50)
              Positioned(
                left: centerX + 20,
                top: centerY - 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: ((0.50 - val) / 0.50 * opacity).clamp(0.0, 0.85),
                    child: Container(
                      width: 160,
                      height: screenHeight * 0.60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color(0x99FFEA00),
                            Color(0xCCFFD600),
                            Color(0xFFFF9100),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Glowing Royal Energy Ring behind the crown
            Positioned(
              left: centerX - 25,
              top: posY - 25,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.90 * opacity).clamp(0.0, 0.90),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFFD600).withValues(alpha: 0.85),
                        width: 2.5,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xCCFFD600),
                          blurRadius: 36,
                          spreadRadius: 6,
                        ),
                        BoxShadow(
                          color: Color(0x88FFA000),
                          blurRadius: 48,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Gemstones Star Flashes on Crown Tips
            if (val >= 0.20 && val <= 0.85) ...[
              _buildSparkleGlint(
                x: centerX + 52 + sin(val * 10 * pi) * 8,
                y: posY + 46,
                size: 30,
                color: const Color(0xFFFFFFFF),
                opacity: (sin(val * 16 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
              _buildSparkleGlint(
                x: centerX + 100,
                y: posY + 26,
                size: 40,
                color: const Color(0xFFFFEA00),
                opacity: (cos(val * 18 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
              _buildSparkleGlint(
                x: centerX + 148 - sin(val * 10 * pi) * 8,
                y: posY + 46,
                size: 30,
                color: const Color(0xFFFFFFFF),
                opacity: (sin(val * 20 * pi).abs() * 0.95).clamp(0.0, 1.0),
              ),
            ],

            // Royal Golden Particles & Star Burst Shockwave
            if (val >= 0.30)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: posY + 100,
                progress: ((val - 0.30) / 0.70).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFFFEA00),
                particles: const ['👑', '⭐', '✨', '💛', '🌟', '💎'],
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
  // "The giant diamond rises dramatically from below with intense blue magical light,
  // slowly rotates 360 degrees while sparkling from every facet, multiple blue
  // light rays shoot outward, tiny diamonds and glitter particles orbit around it,
  // a bright circular energy ring expands behind the diamond, the diamond zooms
  // slightly toward the viewer, produces a powerful shine flash, then smoothly
  // returns to its original position. Luxury premium live gift animation, smooth 60 FPS,
  // seamless loop."
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

        double posY;
        double scale;
        double rotAngle;
        double opacity = 1.0;

        if (val < 0.30) {
          // ① Giant diamond rises dramatically from below with intense blue magical light
          final p = val / 0.30;
          posY = screenHeight * 0.75 - (p * (screenHeight * 0.40));
          scale = 0.65 + Curves.easeOutBack.transform(p) * 0.40;
          rotAngle = p * pi;
          opacity = (p / 0.10).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Slowly rotates 360 degrees, blue light rays shoot outward, circular energy ring expands
          final p = (val - 0.30) / 0.44;
          posY = centerY;
          // Zooms slightly toward viewer (up to 1.32x)
          scale = 1.05 + sin(p * pi) * 0.28;
          rotAngle = pi + (p * 2 * pi); // Smooth 360 deg rotation
        } else {
          // ③ Powerful shine flash, then smoothly returns to original position
          final p = (val - 0.74) / 0.26;
          posY = centerY + (p * 15);
          scale = 1.33 - (p * 0.45);
          rotAngle = 3 * pi + (p * 0.5 * pi);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Intense Blue Magical Light Beam from below
            if (val < 0.45)
              Positioned(
                left: centerX + 15,
                top: centerY - 30,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: ((0.45 - val) / 0.45 * opacity).clamp(0.0, 0.85),
                    child: Container(
                      width: 170,
                      height: screenHeight * 0.55,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color(0x9900E5FF),
                            Color(0xCC0091EA),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Expanding Bright Circular Energy Ring behind diamond
            Positioned(
              left: centerX - 25,
              top: centerY - 25,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.88 * opacity).clamp(0.0, 0.88),
                  child: Transform.scale(
                    scale: 0.90 + sin(val * pi) * 0.35,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF00E5FF).withValues(alpha: 0.90),
                          width: 2.8,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xCC00E5FF),
                            blurRadius: 32,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: Color(0x882979FF),
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

            // Tiny diamonds and glitter particles orbiting around the diamond
            if (val >= 0.20)
              ...List.generate(4, (i) {
                final orbitAngle = (val * 4 * pi) + (i * pi / 2);
                final orbitX = centerX + 100 + cos(orbitAngle) * 95;
                final orbitY = centerY + 100 + sin(orbitAngle) * 60;
                return Positioned(
                  left: orbitX - 10,
                  top: orbitY - 10,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: opacity,
                      child: const Text('💎', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                );
              }),

            // Multiple Blue Light Rays shooting outward
            if (val >= 0.20 && val <= 0.82) ...[
              _buildSparkleGlint(
                x: centerX + 100,
                y: centerY + 100,
                size: 260,
                color: const Color(0xFF00E5FF),
                opacity: (sin(val * 18 * pi).abs() * 0.90).clamp(0.0, 0.90),
              ),
              _buildSparkleGlint(
                x: centerX + 100,
                y: centerY + 100,
                size: 200,
                color: const Color(0xFFFFFFFF),
                opacity: (cos(val * 22 * pi).abs() * 0.85).clamp(0.0, 0.85),
              ),
            ],

            // Blue Diamond Facet Shine Flash
            if (val >= 0.35)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: centerY + 100,
                progress: ((val - 0.35) / 0.65).clamp(0.0, 1.0),
                primaryColor: const Color(0xFF00E5FF),
                secondaryColor: const Color(0xFF2979FF),
                particles: const ['💎', '✨', '⚡', '💠', '🔹', '⭐'],
              ),

            // 3D Giant Diamond rotating 360 degrees
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
                        ..setEntry(3, 2, 0.0022)
                        ..rotateY(rotAngle)
                        ..rotateX(0.18 * sin(rotAngle))
                        ..rotateZ(0.08),
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
  // 9. 🎂 BIRTHDAY CAKE
  // "The birthday cake pops into the screen with a colorful magical burst,
  // candle flames ignite one by one, the cake gently bounces, colorful confetti
  // explodes from both sides, glowing balloons and tiny stars appear around it,
  // the candle flames flicker naturally, the cake rotates slightly while sparkling,
  // then confetti falls down and the cake returns smoothly to the original position.
  // Festive energetic live gift animation, smooth 60 FPS, seamless loop."
  // ===========================================================================
  Widget _buildCakeAnimation() {
    return AnimatedBuilder(
      animation: _cakeController,
      builder: (context, child) {
        final val = _cakeController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 200) / 2;
        final double centerY = screenHeight * 0.35;

        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.28) {
          // ① Pops into screen with colorful magical burst & elastic bounce
          final p = val / 0.28;
          posY = screenHeight * 0.65 - (p * (screenHeight * 0.30));
          scale = Curves.elasticOut.transform(p.clamp(0.0, 1.0)) * 1.0;
          tiltAngle = sin(p * 2 * pi) * 0.06;
          opacity = (p / 0.10).clamp(0.0, 1.0);
        } else if (val < 0.76) {
          // ② Candle flames ignite, gentle bounce, rotates slightly while sparkling
          final p = (val - 0.28) / 0.48;
          posY = centerY - sin(p * 3 * pi).abs() * 12;
          scale = 1.0 + sin(p * pi) * 0.16;
          tiltAngle = sin(p * 2 * pi) * 0.08;
        } else {
          // ③ Confetti falls down, returns smoothly to original position
          final p = (val - 0.76) / 0.24;
          posY = centerY + (p * 15);
          scale = 1.16 - (p * 0.35);
          tiltAngle = 0.05 * (1.0 - p);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Colorful Confetti Exploding from Both Sides (val >= 0.25)
            if (val >= 0.25 && val <= 0.85) ...[
              // Left Confetti Cannon
              Positioned(
                left: centerX - 60,
                top: centerY + 20,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: sin((val - 0.25) / 0.60 * pi).clamp(0.0, 1.0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('🎉', style: TextStyle(fontSize: 26)),
                        SizedBox(width: 4),
                        Text('✨', style: TextStyle(fontSize: 20)),
                        SizedBox(width: 4),
                        Text('🎈', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
              ),
              // Right Confetti Cannon
              Positioned(
                left: centerX + 180,
                top: centerY + 20,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: sin((val - 0.25) / 0.60 * pi).clamp(0.0, 1.0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('🎈', style: TextStyle(fontSize: 24)),
                        SizedBox(width: 4),
                        Text('✨', style: TextStyle(fontSize: 20)),
                        SizedBox(width: 4),
                        Text('🎊', style: TextStyle(fontSize: 26)),
                      ],
                    ),
                  ),
                ),
              ),
            ],

            // Candle Flames Igniting & Flickering Naturally (Staggered points)
            if (val >= 0.26 && val <= 0.88)
              ...List.generate(3, (i) {
                final flameX = centerX + 60 + (i * 38.0);
                final flameFlicker = (sin((val * 24 * pi) + (i * 1.5)).abs() * 0.40 + 0.60);
                final flameIgnited = val >= (0.26 + i * 0.07);

                if (!flameIgnited) return const SizedBox.shrink();

                return Positioned(
                  left: flameX,
                  top: posY + 26,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: (flameFlicker * opacity).clamp(0.0, 1.0),
                      child: Container(
                        width: 14,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFFFFF9C4), Color(0xFFFF9100), Colors.transparent],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFD700).withValues(alpha: 0.85),
                              blurRadius: 16,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),

            // Floating Confetti Shower & Colorful Burst Shockwave
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: centerY + 100,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF4081),
                secondaryColor: const Color(0xFFFFD600),
                particles: const ['🎉', '🎂', '✨', '🎈', '🎊', '⭐'],
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
                    child: Transform.rotate(
                      angle: tiltAngle,
                      child: SizedBox(
                        width: 200,
                        height: 200,
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 10. 🧸 TEDDY
  // "The cute teddy jumps into the screen with a soft bounce, lands gently,
  // hugs the glowing heart in its hands, the heart becomes brighter and sends small
  // pink hearts floating upward, teddy blinks and moves its head playfully, tiny
  // sparkles surround its body, teddy gives a cute little jump and returns to the
  // starting position. Adorable emotional 3D live gift animation, smooth 60 FPS,
  // seamless loop."
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
          // ① Jumps into screen with soft bounce, lands gently
          final p = val / 0.30;
          posY = screenHeight * 0.70 - sin(p * pi * 0.5) * (screenHeight * 0.35) - sin(p * pi) * 35;
          scale = Curves.easeOutBack.transform(p.clamp(0.0, 1.0)) * 0.96;
          tiltAngle = sin(p * 2 * pi) * 0.05;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Hugs glowing heart, blinks & playful head tilt, tiny sparkles surround body
          final p = (val - 0.30) / 0.44;
          posY = centerY + sin(p * 2 * pi) * 5;
          scale = 0.96 + sin(p * pi) * 0.18;
          // Playful head movement / tilt
          tiltAngle = sin(p * 4 * pi) * 0.12;
        } else {
          // ③ Gives a cute little jump and returns to starting position
          final p = (val - 0.74) / 0.26;
          // Little jump arc
          posY = centerY - sin(p * pi) * 26 + (p * 18);
          scale = 1.14 - (p * 0.36);
          tiltAngle = 0.04 * (1.0 - p);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Glowing heart in hands pulses brighter
            if (val >= 0.28)
              Positioned(
                left: centerX + 75,
                top: posY + 85,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 12 * pi).abs() * 0.50 + 0.50).clamp(0.0, 1.0),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF4081),
                            blurRadius: 28,
                            spreadRadius: 6,
                          ),
                          BoxShadow(
                            color: Color(0xFFFF80AB),
                            blurRadius: 36,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Small Pink Hearts Floating Upward from the Glowing Heart
            if (val >= 0.30 && val <= 0.86)
              ...List.generate(4, (i) {
                final heartP = ((val - 0.30 - (i * 0.09)) / 0.45).clamp(0.0, 1.0);
                if (heartP <= 0.0 || heartP >= 1.0) return const SizedBox.shrink();

                final floatX = centerX + 82 + sin(heartP * 3 * pi + i) * 35;
                final floatY = centerY + 80 - (heartP * 120);

                return Positioned(
                  left: floatX,
                  top: floatY,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: (sin(heartP * pi) * opacity).clamp(0.0, 1.0),
                      child: Transform.scale(
                        scale: 0.60 + (heartP * 0.60),
                        child: Text(
                          i.isEven ? '💖' : '💕',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              }),

            // Tiny sparkles surrounding body & adorable emotional burst
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 95,
                centerY: posY + 95,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
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
  // 2. 🐱 KITTY — CUTE CAT
  // "The cute kitty jumps into the screen with a playful bounce, lands softly,
  // waves its paw, blinks its eyes and makes a cute heart gesture, multiple pink
  // hearts pop around the kitty, small sparkles burst from both sides, the kitty
  // makes a gentle side-to-side movement, then jumps slightly and returns to its
  // starting position. Cute energetic 3D live gift animation, smooth 60 FPS,
  // seamless loop."
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
        double tiltAngle;
        double opacity = 1.0;

        if (val < 0.32) {
          // ① Jumps into the screen with a playful bounce, lands softly
          final p = val / 0.32;
          posX = -90 + p * (centerX + 90);
          posY = screenHeight * 0.65 - sin(p * pi) * 140;
          scale = 0.55 + 0.45 * p;
          tiltAngle = sin(p * 2 * pi) * 0.08;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Waves paw, heart gesture, multiple hearts pop, gentle side-to-side movement
          final p = (val - 0.32) / 0.42;
          posX = centerX + sin(p * 2 * pi) * 12;
          posY = centerY + sin(p * 4 * pi).abs() * 6;
          scale = 1.0 + sin(p * pi) * 0.18;
          tiltAngle = sin(p * 4 * pi) * 0.10;
        } else {
          // ③ Jumps slightly and returns to starting position
          final p = (val - 0.74) / 0.26;
          posX = centerX + (p * 25);
          posY = centerY - sin(p * pi) * 22 + (p * 18);
          scale = 1.18 - (p * 0.45);
          tiltAngle = 0.05 * (1.0 - p);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Small Sparkles Bursting from Both Sides (val >= 0.30)
            if (val >= 0.30 && val <= 0.82) ...[
              // Left Sparkles
              Positioned(
                left: centerX - 40,
                top: centerY + 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: sin((val - 0.30) / 0.52 * pi).clamp(0.0, 1.0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('✨', style: TextStyle(fontSize: 22)),
                        SizedBox(width: 4),
                        Text('💖', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ),
              // Right Sparkles
              Positioned(
                left: centerX + 180,
                top: centerY + 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: sin((val - 0.30) / 0.52 * pi).clamp(0.0, 1.0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('🐾', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 4),
                        Text('✨', style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ),
                ),
              ),
            ],

            // Multiple Pink Hearts Popping Around the Kitty
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 95,
                centerY: centerY + 95,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF2D78),
                secondaryColor: const Color(0xFFFF80AB),
                particles: const ['🐱', '💖', '🐾', '✨', '💕', '🌸'],
              ),

            // 3D Cute Kitty with playful bounce & paw wave
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
  // 3. 💕 TIKI LOVE
  // "The Tiki Love logo flies rapidly into the screen surrounded by pink and purple
  // heart particles, performs a small spinning motion, a large glowing heart appears
  // behind it and pulses three times, golden sparkles explode around the crown, tiny
  // hearts fly upward, the logo moves slightly toward the camera with a powerful glow,
  // then smoothly returns to the original position. Premium romantic live gift
  // animation, smooth 60 FPS, seamless loop."
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

        double posX;
        double posY;
        double scale;
        double rotY = 0.0;
        double opacity = 1.0;

        if (val < 0.28) {
          // ① Flies rapidly into screen surrounded by pink & purple particles, small spin
          final p = val / 0.28;
          posX = -180 + pow(p, 0.85) * (centerX + 180);
          posY = centerY;
          scale = 0.60 + 0.40 * p;
          rotY = (1.0 - p) * pi;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.76) {
          // ② Large glowing heart pulses 3 times, golden sparkles around crown, moves toward camera
          final p = (val - 0.28) / 0.48;
          posX = centerX;
          posY = centerY;
          // Moves slightly toward camera with powerful glow (scale up to 1.30x)
          scale = 1.05 + (sin(p * 6 * pi).abs() * 0.25);
          rotY = sin(p * 2 * pi) * 0.15;
        } else {
          // ③ Smoothly returns to original position
          final p = (val - 0.76) / 0.24;
          posX = centerX;
          posY = centerY + (p * 18);
          scale = 1.30 - (p * 0.45);
          rotY = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Large Glowing Heart Pulses Behind It (Pulses 3 times)
            if (val >= 0.25)
              Positioned(
                left: centerX - 30,
                top: centerY - 25,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.90 * opacity).clamp(0.0, 0.90),
                    child: Transform.scale(
                      scale: 0.95 + (sin(val * 6 * pi).abs() * 0.35),
                      child: Container(
                        width: 270,
                        height: 260,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Color(0xFFFF007F),
                              Color(0xFFBA43F6),
                              Colors.transparent,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xCCFF007F),
                              blurRadius: 40,
                              spreadRadius: 8,
                            ),
                            BoxShadow(
                              color: Color(0xAA7B1FA2),
                              blurRadius: 48,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Golden Sparkles Exploding Around the Crown (Top of Logo)
            if (val >= 0.30 && val <= 0.85)
              Positioned(
                left: centerX + 50,
                top: centerY - 18,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 16 * pi).abs() * 0.85 + 0.15).clamp(0.0, 1.0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('✨', style: TextStyle(fontSize: 22)),
                        SizedBox(width: 8),
                        Text('👑', style: TextStyle(fontSize: 26)),
                        SizedBox(width: 8),
                        Text('⭐', style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ),
                ),
              ),

            // Tiny Hearts Flying Upward
            if (val >= 0.28 && val <= 0.88)
              ...List.generate(4, (i) {
                final heartP = ((val - 0.28 - (i * 0.10)) / 0.45).clamp(0.0, 1.0);
                if (heartP <= 0.0 || heartP >= 1.0) return const SizedBox.shrink();

                final floatX = centerX + 40 + (i * 35.0) + sin(heartP * 2 * pi) * 20;
                final floatY = centerY + 80 - (heartP * 140);

                return Positioned(
                  left: floatX,
                  top: floatY,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: (sin(heartP * pi) * opacity).clamp(0.0, 1.0),
                      child: Text(
                        i.isEven ? '💖' : '💜',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),

            // Pink & Purple Heart Particles Explosion Shockwave
            if (val >= 0.28)
              _buildFinalEffectShockwave(
                centerX: centerX + 105,
                centerY: centerY + 105,
                progress: ((val - 0.28) / 0.72).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF007F),
                secondaryColor: const Color(0xFFBA43F6),
                particles: const ['💕', '💜', '👑', '✨', '💖', '🌟'],
              ),

            // 3D Tiki Love Logo Moving Toward Camera with Powerful Glow
            Positioned(
              left: posX,
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
                        ..rotateY(rotY),
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
  // 4. 💖 LOVE COIN
  // "The glowing pink heart coin enters from the side like a magical flying object,
  // spins 360 degrees while moving forward, small hearts orbit around it, golden
  // and pink sparkles trail behind, the heart pulses with bright neon light, a circular
  // energy ring expands outward, then the coin slows down and returns smoothly to
  // its original position. Dynamic premium live gift animation, smooth 60 FPS,
  // seamless loop."
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
        double rotY;
        double opacity = 1.0;

        if (val < 0.35) {
          // ① Enters from side like magical flying object, spins 360 while moving forward
          final p = val / 0.35;
          posX = -200 + pow(p, 0.80) * (centerX + 200);
          posY = centerY + sin(p * 4 * pi) * 10;
          scale = 0.60 + 0.40 * p;
          rotY = p * 2 * pi; // Spins 360 degrees while moving forward
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.75) {
          // ② Small hearts orbit, pulses with bright neon light, circular energy ring expands
          final p = (val - 0.35) / 0.40;
          posX = centerX;
          posY = centerY;
          // Neon heartbeat pulse
          scale = 1.05 + (sin(p * 6 * pi).abs() * 0.25);
          rotY = sin(p * 2 * pi) * 0.22;
        } else {
          // ③ Coin slows down and returns smoothly to original position
          final p = (val - 0.75) / 0.25;
          posX = centerX + (p * 20);
          posY = centerY + (p * 15);
          scale = 1.30 - (p * 0.45);
          rotY = 0.0;
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Golden and Pink Sparkles Trailing Behind
            if (val < 0.45)
              Positioned(
                left: posX - 50,
                top: posY + 60,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.90 * opacity).clamp(0.0, 0.90),
                    child: Container(
                      width: 140,
                      height: 22,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFFFFD700),
                            Color(0xFFFF4081),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Circular Energy Ring Expands Outward
            if (val >= 0.30)
              Positioned(
                left: centerX - 25,
                top: centerY - 25,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (0.88 * opacity).clamp(0.0, 0.88),
                    child: Transform.scale(
                      scale: 0.90 + sin(val * pi) * 0.35,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFF1744).withValues(alpha: 0.85),
                            width: 2.8,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xCCFF1744),
                              blurRadius: 30,
                              spreadRadius: 6,
                            ),
                            BoxShadow(
                              color: Color(0x88FF80AB),
                              blurRadius: 38,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Small Hearts Orbiting Around the Coin in 3D Ellipse
            if (val >= 0.25)
              ...List.generate(4, (i) {
                final orbitAngle = (val * 4 * pi) + (i * pi / 2);
                final orbitX = centerX + 100 + cos(orbitAngle) * 95;
                final orbitY = centerY + 100 + sin(orbitAngle) * 60;

                return Positioned(
                  left: orbitX - 12,
                  top: orbitY - 12,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: opacity,
                      child: Text(
                        i.isEven ? '💖' : '💕',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              }),

            // Neon Light Heart Burst Shockwave
            if (val >= 0.35)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: centerY + 100,
                progress: ((val - 0.35) / 0.65).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF1744),
                secondaryColor: const Color(0xFFFF80AB),
                particles: const ['💖', '💕', '✨', '⚡', '❤️', '🪙'],
              ),

            // 3D Glowing Pink Heart Coin
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0020)
                        ..rotateY(rotY),
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
  // 1. 🌹 FLOWERS — FLOWER BOUQUET
  // "The flower bouquet suddenly appears with a soft pink magical burst,
  // flowers gently bloom and open one by one, petals float outward in the air,
  // the bouquet slightly moves forward toward the viewer, sparkling particles
  // and tiny hearts circle around it, a bright pink glow pulses behind the
  // flowers, then petals fall gently while the bouquet returns to its original
  // position. Premium romantic live gift animation, smooth 60 FPS, seamless loop."
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

        if (val < 0.28) {
          // ① Suddenly appears with soft pink magical burst, flowers gently bloom
          final p = val / 0.28;
          posY = screenHeight * 0.60 - (p * (screenHeight * 0.25));
          scale = Curves.easeOutBack.transform(p) * 0.95;
          tiltAngle = sin(p * 2 * pi) * 0.05;
          opacity = (p / 0.10).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Moves forward toward viewer, bright pink glow pulses, particles circle
          final p = (val - 0.28) / 0.46;
          posY = centerY;
          // Moves forward toward viewer (zoom scale)
          scale = 0.95 + sin(p * pi) * 0.30;
          tiltAngle = sin(p * 2 * pi) * 0.08;
        } else {
          // ③ Petals fall gently while bouquet returns to its original position
          final p = (val - 0.74) / 0.26;
          posY = centerY + (p * 15);
          scale = 1.25 - (p * 0.35);
          tiltAngle = 0.04 * (1.0 - p);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Bright Pink Glow Pulsing Behind the Flowers
            Positioned(
              left: centerX - 25,
              top: centerY - 25,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFFFF4081).withValues(alpha: 0.85),
                          const Color(0xFFFF80AB).withValues(alpha: 0.40),
                          Colors.transparent,
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xCCFF4081),
                          blurRadius: 36,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Petals Floating Outward in the Air & Falling Gently
            if (val >= 0.25)
              ...List.generate(6, (i) {
                final angle = (i * pi / 3) + (val * pi * 0.5);
                final dist = 80 + (val * 70);
                final petalX = centerX + 100 + cos(angle) * dist;
                final petalY = centerY + 100 + sin(angle) * (dist * 0.70) + (val > 0.65 ? (val - 0.65) * 80 : 0);

                return Positioned(
                  left: petalX - 10,
                  top: petalY - 10,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: (sin(val * pi) * opacity).clamp(0.0, 0.90),
                      child: Text(
                        i.isEven ? '🌸' : '🌺',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),

            // Sparkling Particles & Tiny Hearts Circling Around
            if (val >= 0.20)
              ...List.generate(4, (i) {
                final orbitAngle = (val * 4 * pi) + (i * pi / 2);
                final orbitX = centerX + 100 + cos(orbitAngle) * 90;
                final orbitY = centerY + 100 + sin(orbitAngle) * 60;

                return Positioned(
                  left: orbitX - 10,
                  top: orbitY - 10,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: opacity,
                      child: Text(
                        i.isEven ? '💕' : '✨',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),

            // Soft Pink Magical Burst Shockwave
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 100,
                centerY: posY + 100,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFF80AB),
                secondaryColor: const Color(0xFFFFD54F),
                particles: const ['💐', '🌸', '🌷', '✨', '🌺', '💖'],
              ),

            // 3D Flower Bouquet moving forward toward viewer
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
  // 11. 🌍 WORLD TOUR
  // "The glowing Earth rapidly spins into the screen, surrounded by colorful
  // travel lights and sparkling particles, famous-style miniature landmarks appear
  // around the globe, a bright golden airplane flies around the Earth leaving a
  // glowing trail, the Earth rotates faster, a golden “world tour” energy ring
  // expands outward, stars and travel particles burst around it, then the Earth
  // slows down and returns smoothly to its original position. Epic premium travel
  // live gift animation, smooth 60 FPS, seamless loop."
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

        if (val < 0.28) {
          // ① Glowing Earth rapidly spins into the screen
          final p = val / 0.28;
          scale = Curves.easeOutBack.transform(p) * 0.95;
          rotationAngle = p * 3 * pi;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Landmark miniatures, golden airplane orbits, golden energy ring expands
          final p = (val - 0.28) / 0.46;
          scale = 0.95 + sin(p * pi) * 0.25;
          // Earth rotates faster
          rotationAngle = 3 * pi + (p * 4 * pi);
        } else {
          // ③ Slows down and returns smoothly to original position
          final p = (val - 0.74) / 0.26;
          scale = 1.20 - (p * 0.35);
          rotationAngle = 7 * pi + (p * pi * 0.5);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        // Golden airplane orbiting in 3D ellipse
        final planeOrbitAngle = val * 5 * pi;
        final planeX = centerX + 105 + cos(planeOrbitAngle) * 115;
        final planeY = centerY + 105 + sin(planeOrbitAngle) * 65;

        return Stack(
          children: [
            // Golden "World Tour" Energy Ring Expands Outward
            Positioned(
              left: centerX - 30,
              top: centerY - 20,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.90 * opacity).clamp(0.0, 0.90),
                  child: Transform.scale(
                    scale: 0.92 + sin(val * pi) * 0.30,
                    child: Container(
                      width: 270,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(135),
                        border: Border.all(
                          color: const Color(0xFFFFD600).withValues(alpha: 0.90),
                          width: 2.8,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xCCFFD600),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: Color(0x8800E5FF),
                            blurRadius: 36,
                            spreadRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Famous-Style Miniature Landmarks Appearing Around the Globe
            if (val >= 0.28) ...[
              Positioned(
                left: centerX - 18,
                top: centerY + 30,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: opacity,
                    child: const Text('🗽', style: TextStyle(fontSize: 22)),
                  ),
                ),
              ),
              Positioned(
                left: centerX + 195,
                top: centerY + 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: opacity,
                    child: const Text('🗼', style: TextStyle(fontSize: 22)),
                  ),
                ),
              ),
              Positioned(
                left: centerX + 90,
                top: centerY - 22,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: opacity,
                    child: const Text('🏛️', style: TextStyle(fontSize: 22)),
                  ),
                ),
              ),
            ],

            // Bright Golden Airplane Flying Around the Earth Leaving Glowing Trail
            Positioned(
              left: planeX - 16,
              top: planeY - 16,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.rotate(
                    angle: planeOrbitAngle + pi / 2,
                    child: const Text('✈️', style: TextStyle(fontSize: 28)),
                  ),
                ),
              ),
            ),

            // Stars and Travel Particles Burst Shockwave
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 105,
                centerY: centerY + 105,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFF00E5FF),
                particles: const ['✈️', '🌍', '⭐', '✨', '🌟', '🗺️'],
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
  // 12. 🏰 CASTLE
  // "The magical castle rises dramatically from glowing clouds, castle towers
  // illuminate one by one, golden lights travel upward through the towers, sparkling
  // stars appear around the castle, a glowing heart-shaped light forms above it,
  // magical fireworks burst in the background, the castle gently floats forward toward
  // the viewer, then slowly returns to its original position while sparkles continue
  // to shine. Fantasy luxury live gift animation, smooth 60 FPS, seamless loop."
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
          // ① Rises dramatically from glowing clouds at the bottom
          final p = val / 0.32;
          posY = screenHeight * 0.70 - (p * (screenHeight * 0.38));
          scale = Curves.easeOutBack.transform(p) * 0.95;
          opacity = (p / 0.12).clamp(0.0, 1.0);
        } else if (val < 0.74) {
          // ② Castle towers illuminate one by one, floats forward toward viewer
          final p = (val - 0.32) / 0.42;
          posY = centerY + sin(p * 2 * pi) * 6;
          // Gently floats forward toward the viewer
          scale = 0.95 + sin(p * pi) * 0.25;
        } else {
          // ③ Slowly returns to original position while sparkles continue to shine
          final p = (val - 0.74) / 0.26;
          posY = centerY + (p * 15);
          scale = 1.20 - (p * 0.35);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Magical Fireworks Bursting in the Background
            if (val >= 0.28 && val <= 0.85) ...[
              Positioned(
                left: centerX - 30,
                top: centerY - 30,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 12 * pi).abs() * 0.85).clamp(0.0, 0.85),
                    child: const Text('🎆', style: TextStyle(fontSize: 34)),
                  ),
                ),
              ),
              Positioned(
                left: centerX + 200,
                top: centerY - 40,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (cos(val * 14 * pi).abs() * 0.85).clamp(0.0, 0.85),
                    child: const Text('🎇', style: TextStyle(fontSize: 34)),
                  ),
                ),
              ),
            ],

            // Glowing Clouds at the Base of the Castle
            Positioned(
              left: centerX - 20,
              top: posY + 160,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.85 * opacity).clamp(0.0, 0.85),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('☁️', style: TextStyle(fontSize: 36)),
                      SizedBox(width: 8),
                      Text('☁️', style: TextStyle(fontSize: 42)),
                      SizedBox(width: 8),
                      Text('☁️', style: TextStyle(fontSize: 36)),
                    ],
                  ),
                ),
              ),
            ),

            // Castle Towers Illuminating One by One (Golden light points traveling upward)
            if (val >= 0.30 && val <= 0.88)
              ...List.generate(3, (i) {
                final towerX = centerX + 45 + (i * 65.0);
                final lightProgress = ((val - 0.30 - (i * 0.08)) / 0.25).clamp(0.0, 1.0);
                final towerY = posY + 120 - (lightProgress * 70);

                return Positioned(
                  left: towerX,
                  top: towerY,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: (lightProgress * opacity).clamp(0.0, 1.0),
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFFD600),
                              blurRadius: 18,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),

            // Glowing Heart-Shaped Light Forming Above Castle
            if (val >= 0.35)
              Positioned(
                left: centerX + 98,
                top: posY - 16,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 8 * pi).abs() * 0.85 + 0.15).clamp(0.0, 1.0),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF4081),
                            blurRadius: 24,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Text('💖', style: TextStyle(fontSize: 26)),
                    ),
                  ),
                ),
              ),

            // Glowing magical stardust and stars
            if (val >= 0.25)
              _buildFinalEffectShockwave(
                centerX: centerX + 115,
                centerY: posY + 110,
                progress: ((val - 0.25) / 0.75).clamp(0.0, 1.0),
                primaryColor: const Color(0xFFFFD600),
                secondaryColor: const Color(0xFFBA43F6),
                particles: const ['🏰', '⭐', '✨', '👑', '🌟', '💖'],
              ),

            // 3D Magical Castle gently floating forward toward viewer
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
