import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    this.title = "",
    this.elevation = 0.0,
    this.trailing = const SizedBox(),
    this.leftAlignTitle = false,
    this.border = false,
    this.color,
  }) : super(key: key);

  final String title;
  final double elevation;
  final Widget trailing;
  final bool leftAlignTitle;
  final bool border;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconTheme.of(context)
          .copyWith(color:Colors.black),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      centerTitle: !leftAlignTitle,
      elevation: elevation,
      actions: [trailing],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
