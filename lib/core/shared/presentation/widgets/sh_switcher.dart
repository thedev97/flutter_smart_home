import '../../../core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_common/ui_common.dart';
import 'package:google_fonts/google_fonts.dart';

class SHSwitcher extends StatelessWidget {
  const SHSwitcher({
    required this.value,
    required this.onChanged,
    this.icon,
    super.key,
  });

  final bool value;
  final Icon? icon;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(
                color: value ? SHColors.selectedColor : Colors.white38,
              ),
              child: icon!,
            ),
            const SizedBox(width: 8),
          ],
          CupertinoSwitch(
            trackColor: SHColors.trackColor,
            activeColor: SHColors.trackColor,
            thumbColor: value ? null : Colors.white60,
            value: value,
            onChanged: onChanged,
          ),
          const SizedBox(width: 8),
          Text(
            value ? 'ON' : 'OFF',
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: value ? SHColors.selectedColor : Colors.white38,
            ),
          )
        ],
      ),
    );
  }
}
