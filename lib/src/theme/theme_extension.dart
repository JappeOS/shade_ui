import 'package:shade_ui/shade_ui.dart';

/// Theme extension for [BuildContext]
extension ThemeExtension on BuildContext {
  /// Get the theme data
  ThemeData get theme => Theme.of(this);

  /// Get component theme
  T? componentTheme<T>() => ComponentTheme.maybeOf<T>(this);
}
