import '../../../../core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/core/theme/sh_text_styles.dart';
import '../../../../core/shared/domain/entities/entities.dart';
import '../../../../core/shared/presentation/widgets/sh_card.dart';
import '../../../../core/shared/presentation/widgets/sh_switcher.dart';

class MusicSwitchers extends StatelessWidget {
  const MusicSwitchers({
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'Music',
                  style: SHTextStyles.normalText2,
                ),
                const Spacer(),
                const Icon(Icons.open_in_new_rounded),
              ],
            ),
            const SizedBox(height: 8),
            SHSwitcher(
              value: room.musicInfo.isOn,
              icon: const Icon(SHIcons.music),
              onChanged: (value) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room.musicInfo.currentSong.title,
              maxLines: 1,
              style: SHTextStyles.normalText2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              room.musicInfo.currentSong.artist,
              style: GoogleFonts.montserrat(
                color: SHColors.selectedColor,
                fontWeight: FontWeight.w500,
                shadows: [
                  const Shadow(
                      color: Colors.blueGrey,
                      offset: Offset(0.0, 0.2),
                      blurRadius: 0.2),
                ],
                fontSize: 12.0,
              ),
            ),
            IconTheme(
              data: const IconThemeData(size: 20, color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Icon(Icons.fast_rewind)),
                  const SizedBox(width: 8),
                  Flexible(
                    child: room.musicInfo.isOn
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                  ),
                  const SizedBox(width: 8),
                  const Flexible(child: Icon(Icons.fast_forward)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}