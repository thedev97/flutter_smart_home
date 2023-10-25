import 'package:smart_home/core/theme/sh_text_styles.dart';

import '../../../../core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/shared/domain/entities/smart_room.dart';
import '../../../../core/shared/presentation/widgets/sh_divider.dart';
import '../../../../core/shared/presentation/widgets/blue_dot_light.dart';

class BackgroundRoomCard extends StatelessWidget {
  const BackgroundRoomCard({
    required this.room,
    required this.translation,
    super.key,
  });

  final SmartRoom room;
  final double translation;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, 80 * translation, 0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: SHColors.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(-7, 7),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RoomInfoRow(
              icon: const Icon(SHIcons.thermostat),
              label: Text(
                'Temperature',
                style: SHTextStyles.normalText,
              ),
              data: '${room.temperature}°',
            ),
            height4,
            _RoomInfoRow(
              icon: const Icon(SHIcons.waterDrop),
              label: Text(
                'Air Humidity',
                style: SHTextStyles.normalText,
              ),
              data: '${room.airHumidity}%',
            ),
            height4,
            _RoomInfoRow(
              icon: const Icon(SHIcons.timer),
              label: Text(
                'Timer',
                style: SHTextStyles.normalText,
              ),
              data: null,
            ),
            height12,
            const SHDivider(),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _DeviceIconSwitcher(
                    onTap: (value) {},
                    icon: const Icon(SHIcons.lightBulbOutline),
                    label: Text(
                      'Lights',
                      style: SHTextStyles.normalText,
                    ),
                    value: room.lights.isOn,
                  ),
                  _DeviceIconSwitcher(
                    onTap: (value) {},
                    icon: const Icon(SHIcons.fan),
                    label: Text(
                      'Air-conditioning',
                      style: SHTextStyles.normalText,
                    ),
                    value: room.airCondition.isOn,
                  ),
                  _DeviceIconSwitcher(
                    onTap: (value) {},
                    icon: const Icon(SHIcons.music),
                    label: Text(
                      'Music',
                      style: SHTextStyles.normalText,
                    ),
                    value: room.musicInfo.isOn,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeviceIconSwitcher extends StatelessWidget {
  const _DeviceIconSwitcher({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.value,
  });

  final Text label;
  final Icon icon;
  final bool value;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    final color = value ? SHColors.selectedColor : SHColors.textColor;
    return InkWell(
      onTap: () => onTap(!value),
      child: Column(
        children: [
          IconTheme(
            data: IconThemeData(color: color, size: 24.sp),
            child: icon,
          ),
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: context.bodySmall.copyWith(color: color),
            child: label,
          ),
          const SizedBox(height: 4),
          Text(
            value ? 'ON' : 'OFF',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500, color: color, shadows: [
              const Shadow(
                  color: Colors.blueGrey, offset: Offset(0.0, 0.2), blurRadius: 0.2),
            ],fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class _RoomInfoRow extends StatelessWidget {
  const _RoomInfoRow({
    required this.icon,
    required this.label,
    required this.data,
  });

  final Icon icon;
  final Text label;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width32,
        IconTheme(
          data: context.iconTheme.copyWith(size: 15.sp),
          child: icon,
        ),
        width4,
        Expanded(
          child: DefaultTextStyle(
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: data == null ? SHColors.textColor : null,
                shadows: [
                  const Shadow(
                      color: Colors.blueGrey, offset: Offset(0.0, 0.2), blurRadius: 0.2),
                ],
                fontSize: 10.sp),
            child: label,
          ),
        ),
        if (data != null)
          Text(
            data!,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: SHColors.textColor,
                shadows: [
                  const Shadow(
                      color: Colors.blueGrey, offset: Offset(0.0, 0.2), blurRadius: 0.2),
                ],
                fontSize: 12.sp),
          )
        else
          Row(
            children: [
              const BlueLightDot(),
              width4,
              Text(
                'OFF',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: SHColors.textColor,
                    shadows: [
                      const Shadow(
                          color: Colors.blueGrey, offset: Offset(0.0, 0.2), blurRadius: 0.2),
                    ],
                    fontSize: 12.sp),
              ),
            ],
          ),
        width32,
      ],
    );
  }
}
