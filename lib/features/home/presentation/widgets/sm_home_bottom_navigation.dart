import 'package:flutter/material.dart';
import '../../../../core/theme/sh_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SmHomeBottomNavigationBar extends StatelessWidget {
  const SmHomeBottomNavigationBar(
      {super.key, required this.roomSelectorNotifier});

  final ValueNotifier<int> roomSelectorNotifier;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(25),
        child: ValueListenableBuilder<int>(
          valueListenable: roomSelectorNotifier,
          builder: (_, value, child) => AnimatedOpacity(
            opacity: value != -1 ? 0 : 1,
            duration: kThemeAnimationDuration,
            child: AnimatedContainer(
              duration: kThemeAnimationDuration,
              transform:
                  Matrix4.translationValues(0, value != 0 ? 30.0 : 0.0, 0),
              child: child,
            ),
          ),
          child: BottomNavigationBar(
            unselectedLabelStyle: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 12),
            selectedLabelStyle: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 12),
            fixedColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(SHIcons.lock),
                ),
                label: 'UNLOCK',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(SHIcons.home),
                ),
                label: 'MAIN',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(SHIcons.settings),
                ),
                label: 'SETTINGS',
              ),
            ],
          ),
        ),
      );
}
