import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';
import '../../../core/theme/sh_text_styles.dart';
import '../widgets/widgets/room_details_page_view.dart';
import '../../../core/shared/domain/entities/entities.dart';
import '../../../core/shared/presentation/widgets/room_card.dart';
import '../../../core/shared/presentation/widgets/sh_appbar.dart';
import '../../../core/shared/presentation/widgets/parallax_image_card.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ShAppBar(),
      body: RoomDetailItems(
        topPadding: context.mediaQuery.padding.top,
        room: room,
      ),
    );
  }
}

class RoomDetailItems extends StatelessWidget {
  const RoomDetailItems({
    required this.room,
    required this.topPadding,
    this.animation = const AlwaysStoppedAnimation<double>(1),
    super.key,
  });

  final Animation<double> animation;
  final double topPadding;
  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    final outDx = 200 * animation.value;
    final outDy = 100 * animation.value;
    final sigma = 10 * animation.value;
    return Hero(
      tag: room.id,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ParallaxImageCard(imageUrl: room.imageUrl),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
              child: const ColoredBox(color: Colors.transparent),
            ),
          ),
          // --------------------------------------------
          // Animated output elements
          // --------------------------------------------
          FadeTransition(
            opacity: Tween<double>(begin: 1, end: 0).animate(animation),
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(-outDx, 0),
                  child: VerticalRoomTitle(room: room),
                ),
                Transform.translate(
                  offset: Offset(outDx, outDy),
                  child: const CameraIconButton(),
                ),
                Transform.translate(
                  offset: Offset(0, outDy),
                  child: const AnimatedUpwardArrows(),
                ),
              ],
            ),
          ),
          // --------------------------------------------
          // Animated room controls
          // --------------------------------------------
          FadeTransition(
            opacity: animation,
            child: Container(
              transform:
              Matrix4.translationValues(0, -200 * (1 - animation.value), 0),
              padding: EdgeInsets.only(top: topPadding + 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    room.name.replaceAll(' ', '\n'),
                    textAlign: TextAlign.center,
                    style: context.displaySmall.copyWith(height: .9, shadows: [
                      const Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 0.5),
                          blurRadius: 0.5),
                    ],),
                  ),
                  Text('SETTINGS', textAlign: TextAlign.center, style: SHTextStyles.header,),
                  Expanded(
                    child: RoomDetailsPageView(
                      animation: animation,
                      room: room,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
