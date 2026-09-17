import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class LiveBottomInputBar extends StatefulWidget {
  final Function(String text) onSendComment;
  final VoidCallback? onStarTap;
  final VoidCallback? onGiftTap;
  final FocusNode? focusNode;

  const LiveBottomInputBar({
    super.key,
    required this.onSendComment,
    this.onStarTap,
    this.onGiftTap,
    this.focusNode,
  });

  @override
  State<LiveBottomInputBar> createState() => _LiveBottomInputBarState();
}

class _LiveBottomInputBarState extends State<LiveBottomInputBar> {
  final TextEditingController _textController = TextEditingController();

  void _handleSend() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      widget.onSendComment(text);
      _textController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Direct inline comment box - NO Chat Room modal! (Keep Live screen unchanged)
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0x8A181824),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                  width: 0.8,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: widget.focusNode,
                      style: AppTextStyles.chatBubble.copyWith(
                        color: Colors.white,
                        fontSize: 13.5,
                      ),
                      onSubmitted: (_) => _handleSend(),
                      decoration: InputDecoration(
                        hintText: 'Comment...',
                        hintStyle: AppTextStyles.chatBubble.copyWith(
                          color: Colors.white60,
                          fontSize: 13.5,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send_rounded,
                      color: AppColors.primaryYellow,
                      size: 20,
                    ),
                    onPressed: _handleSend,
                  ),
                  const SizedBox(width: 2),
                ],
              ),
            ),
          ),

          // Separate Star Button (⭐)
          if (widget.onStarTap != null) ...[
            const SizedBox(width: 8),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: widget.onStarTap,
                child: Container(
                  width: 46,
                  height: 46,
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
                        blurRadius: 14,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.star_rounded,
                      color: Colors.black87,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ),
          ],

          // Separate Gift Box Button (🎁)
          if (widget.onGiftTap != null) ...[
            const SizedBox(width: 8),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: widget.onGiftTap,
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF2D55), Color(0xFFAA00FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.glowPurple.withValues(alpha: 0.5),
                        blurRadius: 14,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '🎁',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
