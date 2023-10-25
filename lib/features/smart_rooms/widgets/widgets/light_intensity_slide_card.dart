import 'package:flutter/material.dart';
import '../../../../core/theme/sh_icons.dart';
import 'package:smart_home/core/theme/sh_text_styles.dart';
import '../../../../core/shared/domain/entities/entities.dart';
import '../../../../core/shared/presentation/widgets/sh_card.dart';
import '../../../../core/shared/presentation/widgets/sh_switcher.dart';

class LightIntensitySliderCard extends StatelessWidget {
  const LightIntensitySliderCard({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: const EdgeInsets.all(12),
      children: [
        _LightSwitcher(room: room),
        Row(
          children: [
            const Icon(SHIcons.lightMin),
            Expanded(
              child: Slider(
                value: .2,
                onChanged: (value) {},
              ),
            ),
            const Icon(SHIcons.lightMax),
          ],
        )
      ],
    );
  }
}

class _LightSwitcher extends StatelessWidget {
  const _LightSwitcher({
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Light intensity', style: SHTextStyles.normalText2,),
          ),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${room.lights.value}%',
              style: SHTextStyles.boldText,
            ),
          ),
        ),
        SHSwitcher(
          value: room.lights.isOn,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
