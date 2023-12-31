import '../../../../core/core.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/core/theme/sh_text_styles.dart';
import '../../../../core/shared/domain/entities/entities.dart';
import '../../../../core/shared/presentation/widgets/sh_card.dart';
import '../../../../core/shared/presentation/widgets/sh_switcher.dart';

class AirConditionerControlsCard extends StatelessWidget {
  const AirConditionerControlsCard({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: const EdgeInsets.all(12),
      children: [
        _AirSwitcher(room: room),
        const _AirIcons(),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  height: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      width: 10,
                      color: Colors.white38,
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          SHIcons.waterDrop,
                          color: Colors.white38,
                          size: 20,
                        ),
                        Text('Air humidity', style: SHTextStyles.normalText2),
                        const SizedBox(width: 8),
                        Text('${room.airHumidity.toInt()}%',
                            style: SHTextStyles.boldText),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class _AirIcons extends StatelessWidget {
  const _AirIcons();

  @override
  Widget build(BuildContext context) {
    return const IconTheme(
      data: IconThemeData(size: 30, color: Colors.white38),
      child: Row(
        children: [
          Icon(SHIcons.snowFlake),
          SizedBox(
            width: 8,
          ),
          Icon(SHIcons.wind),
          SizedBox(
            width: 8,
          ),
          Icon(SHIcons.waterDrop),
          SizedBox(
            width: 8,
          ),
          Icon(SHIcons.timer, color: SHColors.selectedColor),
        ],
      ),
    );
  }
}

class _AirSwitcher extends StatelessWidget {
  const _AirSwitcher({
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Air conditioning',style: SHTextStyles.normalText2),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SHSwitcher(
                icon: const Icon(SHIcons.fan),
                value: room.airCondition.isOn,
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            Text(
              '${room.airCondition.value}˚',
                style: SHTextStyles.boldText,
            )
          ],
        )
      ],
    );
  }
}
