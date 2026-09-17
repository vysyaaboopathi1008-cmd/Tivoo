import 'package:flutter/material.dart';
import '../../../live_stream/presentation/screens/live_stream_screen.dart';
import '../../domain/models/live_stream_card_model.dart';
import '../screens/pk_battle_live_screen.dart';
import 'home_grid_stream_card.dart';

/// Popular view strictly matching the reference design in Screenshot 1 (TaalMil style):
/// - Mini Broadcasters row (`aashi 🔥140`, `payal 🔥133`)
/// - WEEKLY ALL-STARS gold crown event banner with indicator dots
/// - 2-Column Live Stream cards grid (no Star/Gift on cards)
/// - Floating live broadcast circle button on the bottom right
class PopularTaalmilView extends StatelessWidget {
  final List<LiveStreamCardModel> streams;
  final VoidCallback? onBroadcastTap;

  const PopularTaalmilView({
    super.key,
    required this.streams,
    this.onBroadcastTap,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top + 112;
    return Stack(
      children: [
        // Main Virtualized 2-Column Live Stream Grid directly below header tabs
        _buildLiveGrid(context, topPadding),

        // Floating Live Broadcast Action Button (Bottom-Right, above floating nav bar)
        Positioned(
          bottom: 100,
          right: 16,
          child: _buildFloatingBroadcastButton(context),
        ),
      ],
    );
  }

  /// 2-Column Live Streams Grid matching Screenshot 1
  Widget _buildLiveGrid(BuildContext context, double topPadding) {
    if (streams.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding + 40, left: 40, right: 40),
          child: const Text(
            'No live broadcasts right now',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(12, topPadding, 12, 110),
      itemCount: streams.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72, // Tall portrait aspect ratio matching Screenshot 1
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final stream = streams[index];
        return HomeGridStreamCard(
          stream: stream,
          onTap: () {
            if (stream.isPk) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PkBattleLiveScreen(
                    onBack: () => Navigator.of(context).pop(),
                  ),
                ),
              );
              return;
            }
            // Tapping regular video opens live room with downside comments, separate Star & Gift, and active animations
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LiveStreamScreen(
                  streams: streams,
                  initialIndex: index,
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Bottom-right floating live broadcast action button matching Screenshot 1
  Widget _buildFloatingBroadcastButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onBroadcastTap != null) {
          onBroadcastTap!();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🎥 Ready to go live! Tap to start your broadcast'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF1E1C2A),
          border: Border.all(
            color: const Color(0xFF00E676),
            width: 2.2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E676).withValues(alpha: 0.45),
              blurRadius: 16,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: const Color(0xFFFF2D55).withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(-2, -2),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.tv_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
