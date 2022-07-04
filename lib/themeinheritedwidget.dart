import 'package:flutter/cupertino.dart';

class ThemeInheritedWiget extends InheritedWidget {
  final ValueChanged<bool> onThemeUpdated;
  final bool isThemeDark;

  const ThemeInheritedWiget(
      {required Widget child,
      required this.onThemeUpdated,
      required this.isThemeDark,
      Key? key})
      : super(child: child, key: key);

  void updateTheme() {
    onThemeUpdated(!isThemeDark);
  }

  static ThemeInheritedWiget of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<ThemeInheritedWiget>()!;

  @override
  bool updateShouldNotify(covariant ThemeInheritedWiget oldWidget) =>
      oldWidget.isThemeDark != isThemeDark;
}
