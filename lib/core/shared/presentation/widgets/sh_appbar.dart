import 'package:flutter/material.dart';
import '../../../theme/sh_icons.dart';

class ShAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShAppBar({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: AppBar(
          leading: Hero(
            tag: "app-bar-icon-1",
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(SHIcons.menu),
              ),
            ),
          ),
          actions: [
            Hero(
              tag: "app-bar-icon-2",
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(SHIcons.search),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
  );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
