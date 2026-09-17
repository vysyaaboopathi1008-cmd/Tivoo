import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_avatar.dart';

class LiveActionBar extends StatelessWidget {
  final String? streamerAvatarAsset;
  final String? streamerAvatarUrl;
  final bool isFollowing;
  final bool isLiked;
  final String likesCount;
  final String commentsCount;
  final String? starsCount;
  final VoidCallback onFollowTap;
  final VoidCallback onLikeTap;
  final VoidCallback onCommentTap;
  final VoidCallback onShareTap;
  final VoidCallback? onStarTap;
  final VoidCallback? onGiftTap;
  final VoidCallback? onAvatarTap;

  const LiveActionBar({
    super.key,
    this.streamerAvatarAsset,
    this.streamerAvatarUrl,
    required this.isFollowing,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
    this.starsCount,
    required this.onFollowTap,
    required this.onLikeTap,
    required this.onCommentTap,
    required this.onShareTap,
    this.onStarTap,
    this.onGiftTap,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 1. Streamer Avatar with Follow '+' button
        _buildStreamerAvatarWithFollow(),

        const SizedBox(height: 16),

        // 2. Like / Heart Button
        _buildActionItem(
          icon: isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          iconColor: isLiked ? AppColors.liveRed : Colors.white,
          label: likesCount,
          onTap: onLikeTap,
        ),

        // 3. Separate Star Button (⭐)
        if (onStarTap != null) ...[
          const SizedBox(height: 14),
          _buildActionItem(
            icon: Icons.star_rounded,
            iconColor: const Color(0xFFFFD700),
            label: starsCount ?? 'Star',
            onTap: onStarTap!,
          ),
        ],

        // 4. Separate Gift Button (🎁)
        if (onGiftTap != null) ...[
          const SizedBox(height: 14),
          _buildActionItem(
            icon: Icons.card_giftcard_rounded,
            iconColor: const Color(0xFFFF4081),
            label: 'Gift',
            onTap: onGiftTap!,
          ),
        ],

        const SizedBox(height: 14),

        // 5. Comments Button
        _buildActionItem(
          icon: Icons.chat_bubble_outline_rounded,
          iconColor: Colors.white,
          label: commentsCount,
          onTap: onCommentTap,
        ),

        const SizedBox(height: 14),

        // 6. Share Button
        _buildActionItem(
          icon: Icons.share_outlined,
          iconColor: Colors.white,
          label: 'Share',
          onTap: onShareTap,
        ),
      ],
    );
  }

  Widget _buildStreamerAvatarWithFollow() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onAvatarTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.glowPurple.withValues(alpha: 0.5),
                  blurRadius: 12,
                ),
              ],
            ),
            child: CustomAvatar(
              radius: 24,
              assetPath:
                  (streamerAvatarAsset != null && streamerAvatarAsset!.isNotEmpty)
                      ? streamerAvatarAsset
                      : null,
              imageUrl: streamerAvatarUrl,
            ),
          ),
        ),
        if (!isFollowing)
          Positioned(
            bottom: -6,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onFollowTap,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryPink,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x66181824),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 0.8,
                ),
                boxShadow: iconColor == AppColors.liveRed
                    ? [
                        BoxShadow(
                          color: AppColors.liveRed.withValues(alpha: 0.5),
                          blurRadius: 14,
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.badgeText.copyWith(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            shadows: [
              const Shadow(
                color: Colors.black,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
