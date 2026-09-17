import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_avatar.dart';
import '../../../../core/widgets/live_badge.dart';

class LiveStreamTopBar extends StatelessWidget {
  final String viewersCount;
  final VoidCallback onCloseTap;

  const LiveStreamTopBar({
    super.key,
    required this.viewersCount,
    required this.onCloseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: LIVE badge, Viewers Count, and Active Viewers Photos Row
          Row(
            children: [
              const LiveBadge(),
              const SizedBox(width: 8),
              MetricBadge(
                text: viewersCount,
                icon: const Icon(
                  Icons.visibility_outlined,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              const SizedBox(width: 8),
              // Upside Active Viewers' Profile Photos ("malla yaru yella pakuragalo avuga photo varanu")
              _buildViewersAvatarStack(context),
            ],
          ),

          // Right: Close Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: onCloseTap,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.glassBackground.withValues(alpha: 0.65),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 0.8,
                  ),
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewersAvatarStack(BuildContext context) {
    const viewerAssets = [
      AppAssets.status1,
      AppAssets.status2,
      AppAssets.status4,
      AppAssets.status5,
    ];

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$viewersCount active viewers watching this live room! 👥'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: SizedBox(
        height: 28,
        width: 76,
        child: Stack(
          children: List.generate(viewerAssets.length, (i) {
            return Positioned(
              left: i * 16.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: i == 0 ? const Color(0xFF00E676) : Colors.white,
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: CustomAvatar(
                  radius: 12,
                  assetPath: viewerAssets[i],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
