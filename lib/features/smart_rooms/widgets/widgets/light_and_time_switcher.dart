import '../../../../core/core.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/sh_text_styles.dart';
import '../../../../core/shared/domain/entities/entities.dart';
import '../../../../core/shared/presentation/widgets/sh_card.dart';
import '../../../../core/shared/presentation/widgets/sh_switcher.dart';
import '../../../../core/shared/presentation/widgets/blue_dot_light.dart';

class LightsAndTimerSwitchers extends StatelessWidget {
  const LightsAndTimerSwitchers({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: const EdgeInsets.all(12),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lights',
              style: SHTextStyles.normalText2,
            ),
            const SizedBox(height: 8),
            SHSwitcher(
              value: room.lights.isOn,
              onChanged: (value) {},
              icon: const Icon(SHIcons.lightBulbOutline),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8,),
                Text(
                  'Timer',
                  style: SHTextStyles.normalText2,
                ),
                const Spacer(),
                const BlueLightDot(),
                const SizedBox(width: 8,),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.5),
              child: SHSwitcher(
                icon: room.timer.isOn
                    ? const Icon(SHIcons.timer)
                    : const Icon(SHIcons.timerOff),
                value: room.timer.isOn,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
