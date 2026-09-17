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
  // ===========================================================================
  // 6. 🏎️ SUPER CAR
  // "Create an ultra-realistic cinematic animation of the super car. The car starts
  // stationary, headlights turn on, the wheels begin rotating, the car smoothly
  // accelerates forward, realistic suspension movement and tire rotation are visible,
  // the car performs a controlled high-speed turn, subtle tire smoke appears during
  // the turn, reflections move naturally across the body, headlights create realistic
  // light reflections, and the camera follows the car dynamically. Keep the original
  // car design, shape, colors and proportions exactly unchanged. Photorealistic car
  // physics, realistic road interaction, cinematic camera movement, no cartoon
  // effects, no fantasy effects."
  // ===========================================================================
  Widget _buildSuperCarAnimation() {
    return AnimatedBuilder(
      animation: _carController,
      builder: (context, child) {
        final val = _carController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double targetCenterX = (screenWidth - 230) / 2;
        final double targetCenterY = screenHeight * 0.38;

        double posX;
        double posY;
        double scale;
        double tiltAngle;
        double opacity = 1.0;
        double suspensionDip = 0.0;

        if (val < 0.20) {
          // Stationary -> Headlights turn on, suspension sets
          final p = val / 0.20;
          posX = targetCenterX - 40;
          posY = targetCenterY;
          scale = 0.95;
          tiltAngle = 0.0;
          suspensionDip = sin(p * pi) * 2.0;
          opacity = (p / 0.10).clamp(0.0, 1.0);
        } else if (val < 0.65) {
          // Smoothly accelerates forward, camera follows dynamically, controlled turn
          final p = (val - 0.20) / 0.45;
          final accel = Curves.easeInCubic.transform(p);
          posX = (targetCenterX - 40) + (accel * 50);
          posY = targetCenterY - sin(p * pi) * 10;
          scale = 0.95 + (p * 0.18);
          tiltAngle = sin(p * 2 * pi) * 0.04;
          suspensionDip = sin(p * 8 * pi) * 1.5;
        } else {
          // Controlled high-speed curve & smooth cinematic settle
          final p = (val - 0.65) / 0.35;
          posX = (targetCenterX + 10) + (p * 40);
          posY = (targetCenterY - 10) + (p * 20);
          scale = 1.13 - (p * 0.30);
          tiltAngle = 0.02 * (1.0 - p);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            // Realistic Asphalt Ground Contact Shadow Beneath Tires
            _buildRealisticGroundShadow(
              centerX: posX + 115,
              groundY: posY + 90,
              scale: scale,
              elevation: suspensionDip,
              width: 220,
            ),

            // Headlights Lighting the Road in Front (Smoothly turns on after val >= 0.08)
            if (val >= 0.08 && val < 0.90)
              Positioned(
                left: posX + 175,
                top: posY + 36,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: ((val - 0.08) / 0.15).clamp(0.0, 1.0) * opacity * 0.85,
                    child: Container(
                      width: 180,
                      height: 50,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white,
                            Color(0x88FFF9C4),
                            Color(0x33FFD54F),
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.25, 0.60, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
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
  // "Create a realistic luxury yacht movement. The yacht smoothly travels forward
  // across realistic water, the hull naturally moves with the waves, realistic
  // water splashes appear around the sides, subtle reflections of the yacht appear
  // on the water, the camera follows the yacht with a cinematic tracking movement,
  // then the yacht gradually slows down. Keep the original yacht design and
  // proportions unchanged. Photorealistic lighting, realistic physics, no cartoon
  // effects."
  // ===========================================================================
  Widget _buildYachtAnimation() {
    return AnimatedBuilder(
      animation: _yachtController,
      builder: (context, child) {
        final val = _yachtController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double targetCenterX = (screenWidth - 230) / 2;
        final double targetCenterY = screenHeight * 0.38;

        // Cinematic tracking forward across realistic water
        final double posX = targetCenterX - 20 + (sin(val * pi * 0.5) * 40);
        // Natural wave bobbing physics (heave & pitch)
        final double waveHeave = sin(val * 6 * pi) * 4.5;
        final double wavePitch = cos(val * 6 * pi) * 0.025;
        final double posY = targetCenterY + waveHeave;

        final double scale = 0.96 + (sin(val * pi) * 0.12);
        final double opacity = val > 0.82 ? ((1.0 - val) / 0.18).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Realistic Water Ripples & Wake Beneath the Hull
            _buildRealisticWaterRipples(
              left: posX - 15,
              top: posY + 96,
              width: 260,
              progress: val,
              opacity: (0.75 * opacity).clamp(0.0, 0.75),
            ),

            // Subtle Water Surface Reflection
            Positioned(
              left: posX + 10,
              top: posY + 108,
              child: IgnorePointer(
                child: Opacity(
                  opacity: (0.22 * opacity).clamp(0.0, 0.22),
                  child: Transform(
                    transform: Matrix4.diagonal3Values(1.0, -0.35, 1.0),
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 230,
                      height: 120,
                      child: Image.asset(
                        AppAssets.giftYacht,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Photorealistic Yacht with Sunlight Reflection Sweep
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: wavePitch,
                      child: SizedBox(
                        width: 230,
                        height: 130,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFE0F7FA),
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
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 13. 🚀 ROCKET
  // "Create a photorealistic rocket launch animation. The rocket engines ignite
  // realistically, bright engine flames and hot exhaust appear beneath the rocket,
  // smoke expands naturally, the rocket gradually lifts from the starting position
  // and accelerates upward, realistic camera tracking follows its movement, subtle
  // vibration occurs during launch, then the rocket moves smoothly through space.
  // Realistic physics, realistic engine exhaust, cinematic lighting and camera
  // movement. Keep the original rocket design and proportions unchanged. No
  // cartoon effects."
  // ===========================================================================
  Widget _buildRocketAnimation() {
    return AnimatedBuilder(
      animation: _rocketController,
      builder: (context, child) {
        final val = _rocketController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 160) / 2;
        final double startY = screenHeight * 0.55;

        double posX = centerX;
        double posY;
        double scale;
        double vibration = 0.0;
        double opacity = 1.0;

        if (val < 0.22) {
          // Engines ignite realistically -> launch vibration at starting position
          final p = val / 0.22;
          vibration = sin(p * 48 * pi) * 1.8;
          posY = startY;
          scale = 0.95;
          opacity = (p / 0.08).clamp(0.0, 1.0);
        } else if (val < 0.78) {
          // Gradually lifts from starting position and accelerates upward
          final p = (val - 0.22) / 0.56;
          final lift = pow(p, 1.8);
          posY = startY - (lift * (screenHeight * 0.42));
          scale = 0.95 + (p * 0.20);
          vibration = sin(p * 24 * pi) * (1.2 * (1.0 - p));
        } else {
          // Moves smoothly through space, seamless settle
          final p = (val - 0.78) / 0.22;
          posY = (startY - (screenHeight * 0.42)) - (p * 40);
          scale = 1.15 - (p * 0.25);
          opacity = (1.0 - p).clamp(0.0, 1.0);
        }

        posX += vibration;

        return Stack(
          children: [
            // Engine Flames & Hot Plasma Exhaust Beneath the Rocket
            if (val >= 0.08 && val < 0.88)
              Positioned(
                left: posX + 60,
                top: posY + 120,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (sin(val * 32 * pi).abs() * 0.25 + 0.75) * opacity,
                    child: Container(
                      width: 40,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color(0xFF00E5FF),
                            Color(0xFFFF9100),
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.30, 0.65, 1.0],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x9900E5FF),
                            blurRadius: 20,
                            spreadRadius: 3,
                          ),
                          BoxShadow(
                            color: Color(0x66FF6D00),
                            blurRadius: 26,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // Photorealistic Rocket with Fuselage Metallic Sheen
            Positioned(
              left: posX,
              top: posY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
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

  // ===========================================================================
  // 14. 🪽 ANGEL WINGS
  // "Create realistic 3D feather-wing movement. The wings slowly open and close
  // with natural feather movement, individual feathers slightly move and overlap
  // naturally, subtle airflow causes the feather tips to move gently, realistic
  // light reflects across the feathers, the wings slightly move forward and
  // backward with natural weight. Premium cinematic lighting, realistic feather
  // texture, realistic shadows and depth. Keep the original wing design, colors
  // and proportions unchanged. No cartoon effects, no magical explosion, no
  // excessive particles."
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

        // Subtle airflow causes feather tips to move gently (micro pitch & roll)
        final double airflowSway = sin(val * 2 * pi) * 0.025;
        // Natural weight elevation
        final double naturalElevation = sin(val * 2 * pi) * 6;
        final double posY = centerY + naturalElevation;

        // Wings slightly move forward and backward with natural depth (camera push-in & settle)
        final double scale = 0.94 + (sin(val * pi) * 0.14);

        // Wings slowly open and close with natural feather movement (2 natural breathing flap cycles)
        final double flapFactor = 0.88 + (sin(val * 4 * pi).abs() * 0.12);

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Realistic Soft Ambient Depth Shadow Behind the Wings
            _buildRealisticGroundShadow(
              centerX: centerX + 120,
              groundY: posY + 160,
              scale: scale,
              elevation: naturalElevation,
              width: 220,
            ),

            // Photorealistic Angel Wings with Natural Feather Specular Reflection Sweep
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
                          lightColor: const Color(0xFFE1F5FE),
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

        // Gentle camera push-in
        final double scale = 0.94 + (sin(val * pi) * 0.14);

        // Petals move slightly from a soft breeze
        final double breezeSway = sin(val * 2 * pi) * 0.025;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft realistic contact ground shadow
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: centerY + 170,
              scale: scale,
              width: 170,
            ),

            // Photorealistic Rose with Natural Studio Lighting Sweep
            Positioned(
              left: centerX,
              top: centerY,
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
  // "Create a realistic luxury crown movement. The golden crown slowly rises and
  // rotates naturally, realistic gold reflections move across the metal surface,
  // gemstones catch and reflect the light naturally, the crown gently moves toward
  // the camera before settling back into position. Premium royal studio lighting,
  // realistic metallic materials and shadows. Keep the original crown design,
  // gemstones, colors and proportions unchanged. No magical effects, no cartoon
  // animation."
  // ===========================================================================
  Widget _buildCrownAnimation() {
    return AnimatedBuilder(
      animation: _crownController,
      builder: (context, child) {
        final val = _crownController.value;
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        final double centerX = (screenWidth - 210) / 2;
        final double centerY = screenHeight * 0.34;

        // Crown slowly rises from starting position to center
        final double elevationProgress = Curves.easeOutCubic.transform((val / 0.40).clamp(0.0, 1.0));
        final double startY = screenHeight * 0.45;
        final double posY = startY - (elevationProgress * (startY - centerY));

        // Gently moves toward the camera before settling back (camera push-in)
        final double scale = 0.94 + (sin(val * pi) * 0.16);

        // Rotates naturally in 3D space with subtle yaw & pitch
        final double rotY = sin(val * 2 * pi) * 0.22;
        final double rotX = -0.05 + sin(val * 2 * pi) * 0.02;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ground Contact Shadow Beneath the Crown
            _buildRealisticGroundShadow(
              centerX: centerX + 105,
              groundY: centerY + 175,
              scale: scale,
              elevation: (startY - posY),
              width: 190,
            ),

            // Subtle Studio Royal Backlight
            _buildRealisticStudioAura(
              centerX: centerX + 105,
              centerY: posY + 100,
              scale: scale,
              color: const Color(0xFFFFD54F),
              radius: 200,
              opacity: 0.25 * opacity,
            ),

            // Gemstones Catch & Reflect Light Naturally (Micro Glints)
            if (val >= 0.15 && val <= 0.85) ...[
              _buildSparkleGlint(
                x: centerX + 60,
                y: posY + 55,
                size: 24,
                color: Colors.white,
                opacity: (sin(val * 14 * pi).abs() * 0.85).clamp(0.0, 0.85),
              ),
              _buildSparkleGlint(
                x: centerX + 105,
                y: posY + 32,
                size: 30,
                color: const Color(0xFFFFEA00),
                opacity: (cos(val * 16 * pi).abs() * 0.90).clamp(0.0, 0.90),
              ),
              _buildSparkleGlint(
                x: centerX + 150,
                y: posY + 55,
                size: 24,
                color: Colors.white,
                opacity: (sin(val * 18 * pi).abs() * 0.85).clamp(0.0, 0.85),
              ),
            ],

            // Photorealistic Golden Crown with Metallic Specular Sheen Sweep
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
  // "Create a photorealistic 3D diamond movement. The diamond slowly rotates
  // naturally, realistic light passes through each facet, detailed reflections
  // and refractions change as it rotates, subtle highlights move across the
  // surface, the diamond gently moves closer to the camera and then returns.
  // Realistic studio lighting, realistic glass-like optical behavior, natural
  // shadows. Keep the original diamond design and proportions unchanged. No
  // cartoon effects, no excessive particles."
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

        // Diamond gently moves closer to the camera and then returns
        final double scale = 0.94 + (sin(val * pi) * 0.18);

        // Slowly rotates naturally with 3D optical perspective
        final double rotY = val * 2 * pi;
        final double rotX = sin(val * 2 * pi) * 0.08;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ground Contact Shadow Beneath Diamond
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: centerY + 175,
              scale: scale,
              width: 170,
            ),

            // Studio Backlight Rim Illumination
            _buildRealisticStudioAura(
              centerX: centerX + 100,
              centerY: centerY + 100,
              scale: scale,
              color: const Color(0xFF00E5FF),
              radius: 190,
              opacity: 0.22 * opacity,
            ),

            // Subtle Optical Highlights Moving Across the Facets
            if (val >= 0.10 && val <= 0.88) ...[
              _buildSparkleGlint(
                x: centerX + 100 + cos(rotY) * 35,
                y: centerY + 90 + sin(rotY) * 20,
                size: 32,
                color: Colors.white,
                opacity: (sin(val * 16 * pi).abs() * 0.85).clamp(0.0, 0.85),
              ),
              _buildSparkleGlint(
                x: centerX + 100 - cos(rotY) * 40,
                y: centerY + 110 - sin(rotY) * 15,
                size: 26,
                color: const Color(0xFF80D8FF),
                opacity: (cos(val * 20 * pi).abs() * 0.75).clamp(0.0, 0.75),
              ),
            ],

            // Photorealistic 3D Diamond with Glass-like Refractive Sheen Sweep
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
                        ..setEntry(3, 2, 0.0016)
                        ..rotateY(rotY)
                        ..rotateX(rotX),
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
  // "Create a realistic 3D birthday cake animation. The cake gently moves forward,
  // candle flames naturally flicker with realistic fire movement, frosting and
  // decorations remain stable, subtle candlelight reflections appear on the cake
  // surface, the cake slowly rotates slightly while the camera gently moves closer.
  // Realistic food texture, realistic lighting and shadows. Keep the original
  // cake design, text and proportions unchanged. No cartoon effects, no
  // excessive confetti."
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

        // Cake gently moves forward while the camera gently moves closer
        final double scale = 0.94 + (sin(val * pi) * 0.14);

        // Cake slowly rotates slightly
        final double tiltAngle = sin(val * 2 * pi) * 0.025;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ground Contact Shadow Beneath Cake
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: centerY + 165,
              scale: scale,
              width: 190,
            ),

            // Candle Flames Naturally Flicker with Organic Fire Movement
            if (val >= 0.10 && val <= 0.88)
              ...List.generate(3, (i) {
                final flameX = centerX + 62 + (i * 38.0);
                final flameFlicker = (sin((val * 26 * pi) + (i * 1.8)).abs() * 0.35 + 0.65);

                return Positioned(
                  left: flameX,
                  top: centerY + 26,
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

            // Photorealistic Birthday Cake with Subtle Candlelight Reflection Sweep
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
  // "Create realistic soft-toy movement for the teddy. The teddy gently moves
  // forward, naturally tilts its head, slightly moves its arms while holding
  // the heart, subtle body movement simulates soft fabric and natural weight,
  // the teddy gently returns to its original position. Realistic plush texture,
  // soft lighting and natural shadows. Keep the original teddy face, heart,
  // colors and proportions unchanged. No cartoon exaggeration, no magical
  // effects."
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

        // Teddy gently moves forward with natural weight and returns
        final double scale = 0.94 + (sin(val * pi) * 0.12);

        // Naturally tilts its head with soft toy weight
        final double tiltAngle = sin(val * 3 * pi) * 0.035;

        // Subtle body movement simulates soft fabric
        final double breathScaleY = 1.0 + (sin(val * 4 * pi) * 0.018);

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ground Contact Shadow Beneath Teddy
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: centerY + 160,
              scale: scale,
              width: 170,
            ),

            // Photorealistic Plush Teddy with Soft Studio Lighting Sweep
            Positioned(
              left: centerX,
              top: centerY,
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
  // "Create realistic cat-like movement for the kitty sticker. The kitty gently
  // moves its head, naturally blinks its eyes, slowly raises and moves one paw,
  // slightly moves its ears and body, then settles back naturally. Subtle
  // breathing movement and realistic soft lighting. Keep the original face,
  // colors, design and proportions unchanged. No exaggerated cartoon movement,
  // no magical effects, no excessive hearts or particles."
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

        // Camera presentation forward and natural settle
        final double scale = 0.94 + (sin(val * pi) * 0.12);

        // Kitty gently moves its head and body
        final double tiltAngle = sin(val * 3 * pi) * 0.03;

        // Subtle breathing movement
        final double breathScaleY = 1.0 + (sin(val * 4 * pi) * 0.015);

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ground Contact Shadow Beneath Kitty
            _buildRealisticGroundShadow(
              centerX: centerX + 95,
              groundY: centerY + 160,
              scale: scale,
              width: 170,
            ),

            // Photorealistic Kitty with Soft Realistic Lighting
            Positioned(
              left: centerX,
              top: centerY,
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
                          lightColor: const Color(0xFFFFF9C4),
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
  // 3. 💕 TIKI LOVE
  // "Create a realistic premium 3D motion for the Tiki Love gift. The logo
  // gently moves forward toward the viewer with a subtle natural rotation, the
  // glowing text and crown have a realistic light reflection, the heart elements
  // gently pulse like illuminated objects, followed by a smooth slow camera
  // push-in. Keep the exact original design, text, colors and proportions. No
  // cartoon animation, no excessive particles, no deformation."
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

        // Smooth slow camera push-in and natural settle
        final double scale = 0.92 + (sin(val * pi) * 0.16);

        // Subtle natural 3D rotation
        final double rotY = sin(val * 2 * pi) * 0.10;
        final double rotX = -0.04 + (sin(val * 2 * pi) * 0.02);

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ambient Ground Shadow
            _buildRealisticGroundShadow(
              centerX: centerX + 105,
              groundY: centerY + 180,
              scale: scale,
              width: 190,
            ),

            // Heart Elements Gently Pulse like Illuminated Objects (Volumetric Studio Glow)
            _buildRealisticStudioAura(
              centerX: centerX + 105,
              centerY: centerY + 105,
              scale: scale,
              color: const Color(0xFFFF007F),
              radius: 210,
              opacity: (0.28 + sin(val * 4 * pi) * 0.08) * opacity,
            ),

            // Photorealistic Tiki Love Logo with Realistic Metallic Sheen across Crown and Text
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
                        ..setEntry(3, 2, 0.0012)
                        ..rotateY(rotY)
                        ..rotateX(rotX),
                      child: SizedBox(
                        width: 210,
                        height: 210,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFF80AB),
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
  // 4. 💖 LOVE COIN
  // "Create realistic 3D motion for the heart-shaped love coin. The coin slowly
  // rotates naturally around its vertical axis while moving slightly toward the
  // viewer, realistic metallic reflections travel across the surface, the pink
  // heart has a subtle natural glow, then the coin gently slows and returns to
  // its original position. Keep the original design, text, coin value and
  // proportions exactly unchanged. No cartoon effects, no excessive particles."
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

        // Moves slightly toward the viewer and returns
        final double scale = 0.94 + (sin(val * pi) * 0.16);

        // Slowly rotates naturally around vertical axis in 3D
        final double rotY = val * 2 * pi;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Ground Contact Shadow Beneath Coin
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: centerY + 175,
              scale: scale,
              width: 170,
            ),

            // Pink Heart Subtle Natural Glow
            _buildRealisticStudioAura(
              centerX: centerX + 100,
              centerY: centerY + 100,
              scale: scale,
              color: const Color(0xFFFF1744),
              radius: 190,
              opacity: (0.24 + sin(val * 4 * pi) * 0.06) * opacity,
            ),

            // Photorealistic 3D Heart Coin with Realistic Metallic Reflection Sweep
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
                        ..setEntry(3, 2, 0.0015)
                        ..rotateY(rotY),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFD54F),
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
  // 1. 🌹 FLOWERS — FLOWER BOUQUET
  // "Create a realistic 3D motion of the flower bouquet. The bouquet gently
  // moves forward as if being presented to someone, individual flowers and
  // leaves naturally sway with subtle movement, petals move slightly from a soft
  // breeze, realistic natural lighting and shadows, gentle camera push-in,
  // natural depth of field. Keep the original bouquet design, colors, text and
  // proportions unchanged. No cartoon motion, no magical effects, no excessive
  // particles, no deformation."
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

        // Bouquet gently moves forward as if being presented to someone (camera push-in)
        final double scale = 0.94 + (sin(val * pi) * 0.14);

        // Individual flowers and leaves naturally sway with subtle movement from soft breeze
        final double breezeSway = sin(val * 2 * pi) * 0.025;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Realistic Soft Ground Contact Shadow Beneath Bouquet
            _buildRealisticGroundShadow(
              centerX: centerX + 100,
              groundY: centerY + 175,
              scale: scale,
              width: 180,
            ),

            // Photorealistic Flower Bouquet with Natural Studio Lighting Sweep
            Positioned(
              left: centerX,
              top: centerY,
              child: IgnorePointer(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: breezeSway,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _buildRealisticSpecularSheen(
                          progress: val,
                          lightColor: const Color(0xFFFFD1DC),
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
  // 11. 🌍 WORLD TOUR
  // "Create a realistic 3D Earth rotation. The globe slowly rotates naturally,
  // realistic continents and oceans remain clearly visible, subtle atmospheric
  // lighting moves across the surface, realistic city lights become visible on
  // the darker side, the globe gently moves toward the camera and then returns.
  // Premium cinematic space lighting, realistic Earth appearance, natural
  // depth and shadows. Keep the original World Tour design and proportions
  // unchanged. No cartoon effects, no excessive particles."
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

        // Globe gently moves toward the camera and then returns
        final double scale = 0.94 + (sin(val * pi) * 0.16);

        // Globe slowly rotates naturally in 3D
        final double rotY = val * 2 * pi;

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Atmospheric Rim Lighting (Subtle Blue Fresnel Glow)
            _buildRealisticStudioAura(
              centerX: centerX + 105,
              centerY: centerY + 105,
              scale: scale,
              color: const Color(0xFF00E5FF),
              radius: 220,
              opacity: 0.25 * opacity,
            ),

            // Photorealistic 3D Earth Globe with Specular Sunlight Reflection Sweep
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
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // 12. 🏰 CASTLE
  // "Create a realistic cinematic 3D castle scene. The castle slowly rises from
  // the clouds with natural movement, clouds gently move around the lower part of
  // the castle, warm lights inside the castle windows gradually turn on, subtle
  // sunlight reflects across the towers, the camera slowly pushes toward the
  // castle, creating realistic depth and scale. Keep the original castle design,
  // colors and proportions unchanged. Photorealistic materials, realistic
  // clouds and lighting, no cartoon effects, no excessive magical particles."
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

        // Castle slowly rises with natural movement
        final double riseProgress = Curves.easeOutCubic.transform((val / 0.45).clamp(0.0, 1.0));
        final double startY = screenHeight * 0.44;
        final double posY = startY - (riseProgress * (startY - centerY));

        // Camera slowly pushes toward the castle creating realistic depth and scale
        final double scale = 0.94 + (sin(val * pi) * 0.16);

        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            // Soft Realistic Clouds / Mist Gently Moving Around Lower Part of Castle
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

            // Warm Window Light Glow Subtle Backlight
            if (val >= 0.20)
              _buildRealisticStudioAura(
                centerX: centerX + 115,
                centerY: posY + 115,
                scale: scale,
                color: const Color(0xFFFFD54F),
                radius: 200,
                opacity: (0.22 * opacity).clamp(0.0, 0.22),
              ),

            // Photorealistic 3D Castle with Sunlight Reflection Sweep Across Towers
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
  // BONUS: GOLDEN HORSE (Realistic Motion)
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

        final double scale = 0.94 + (sin(val * pi) * 0.14);
        final double tiltAngle = sin(val * 2 * pi) * 0.03;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 115,
              groundY: centerY + 180,
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
  // BONUS: OCEAN WHALE (Realistic Marine Motion)
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

        final double scale = 0.95 + (sin(val * pi) * 0.12);
        final double waveBob = sin(val * 4 * pi) * 5;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticWaterRipples(
              left: centerX,
              top: centerY + 180,
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
        final double centerY = screenHeight * 0.32;

        final double scale = 0.94 + (sin(val * pi) * 0.14);
        final double floatBob = sin(val * 2 * pi) * 6;
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 120,
              groundY: centerY + 180,
              scale: scale,
              width: 220,
            ),
            Positioned(
              left: centerX,
              top: centerY + floatBob,
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
                        lightColor: const Color(0xFFFFD54F),
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
          ],
        );
      },
    );
  }

  // ===========================================================================
  // STANDARD GIFTS (Clean Realistic Presentation)
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

        final double scale = 0.94 + (sin(val * pi) * 0.14);
        final double opacity = val > 0.85 ? ((1.0 - val) / 0.15).clamp(0.0, 1.0) : (val / 0.12).clamp(0.0, 1.0);

        final assetPath = _activeGift?.imageAssetPath;
        final iconText = _activeGift?.icon ?? '🎁';

        return Stack(
          children: [
            _buildRealisticGroundShadow(
              centerX: centerX + 90,
              groundY: centerY + 160,
              scale: scale,
              width: 160,
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
                          ? _buildRealisticSpecularSheen(
                              progress: val,
                              child: Image.asset(assetPath, fit: BoxFit.contain),
                            )
                          : Center(
                              child: Text(
                                iconText,
                                style: const TextStyle(fontSize: 85),
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

  // ===========================================================================
  // PHOTOREALISTIC STUDIO LIGHTING & PHYSICS ENGINE
  // (No cartoon effects, no emoji particles, realistic natural lighting & shadows)
  // ===========================================================================

  /// Sweeps a realistic studio specular highlight reflection across any surface
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
      blendMode: BlendMode.srcOver,
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
            height: 24 * shadowScale,
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
}
