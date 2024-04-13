import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AppCustomBar extends StatelessWidget implements PreferredSizeWidget {
  const AppCustomBar(
      {this.actions,
      this.systemOverlayStyle,
      this.backgroundColor,
      super.key,
      this.automaticallyImplyLeading = true,
      this.leading,
      this.title,
      this.onBackPressed});
  final List<Widget>? actions;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? backgroundColor;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final Widget? leading;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: automaticallyImplyLeading,
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: backgroundColor,
        actions: actions,
        title: title,
        leading: !automaticallyImplyLeading
            ? null
            : leading ??
                IconButton(
                  onPressed: onBackPressed ??
                      () {
                        context.pop();
                      },
                  icon: const Icon(Icons.back_hand),
                ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
