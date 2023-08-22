//  ShadeUI, A UI system for JappeOS apps.
//  Copyright (C) 2023  The JappeOS team.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as
//  published by the Free Software Foundation, either version 3 of the
//  License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Creates a ShadeApp (MaterialApp).
///
/// At least one of [home], [routes], [onGenerateRoute], or [builder] must be non-null.
/// If only [routes] is given, it must include an entry for the [Navigator.defaultRouteName] (/),
/// since that is the route used when the application is launched with an intent that
/// specifies an otherwise unsupported route.
///
/// The [MaterialApp] class creates an instance of [WidgetsApp].
///
/// The boolean arguments, [routes], and [navigatorObservers], must not be null.
///
/// Theme cannot currently be modified via this class; see [Provider] and [ShadeTheme] to
/// change/listen to theme properties in runtime.
class ShadeApp extends StatelessWidget {
  final ShadeCustomThemeProperties? customThemeProperties;
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, Widget Function(BuildContext)> routes;
  final String? initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;
  final Route<dynamic>? Function(RouteSettings)? onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final Widget Function(BuildContext, Widget?)? builder;
  final String title;
  final String Function(BuildContext)? onGenerateTitle;
  final Color? color;
  final Duration themeAnimationDuration;
  final Curve themeAnimationCurve;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;

  const ShadeApp(
      {Key? key,
      this.customThemeProperties,
      this.navigatorKey,
      this.scaffoldMessengerKey,
      this.home,
      this.routes = const <String, WidgetBuilder>{},
      this.initialRoute,
      this.onGenerateRoute,
      this.onGenerateInitialRoutes,
      this.onUnknownRoute,
      this.navigatorObservers = const <NavigatorObserver>[],
      this.builder,
      this.title = '',
      this.onGenerateTitle,
      this.color,
      this.themeAnimationDuration = kThemeAnimationDuration,
      this.themeAnimationCurve = Curves.linear,
      this.locale,
      this.localizationsDelegates,
      this.localeListResolutionCallback,
      this.localeResolutionCallback,
      this.supportedLocales = const <Locale>[Locale('en', 'US')],
      this.debugShowMaterialGrid = false,
      this.showPerformanceOverlay = false,
      this.checkerboardRasterCacheImages = false,
      this.checkerboardOffscreenLayers = false,
      this.showSemanticsDebugger = false,
      this.debugShowCheckedModeBanner = true,
      this.shortcuts,
      this.actions,
      this.restorationScopeId,
      this.scrollBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => customThemeProperties ?? ShadeCustomThemeProperties.setDefault(),
        builder: (context, child) {
          var themeProvider = Provider.of<ShadeCustomThemeProperties>(context);
          return MaterialApp(
            theme: ShadeTheme.light(themeProvider, Theme.of(context).colorScheme),
            darkTheme: ShadeTheme.dark(themeProvider, Theme.of(context).colorScheme),
            home: home,
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            themeMode: themeProvider.themeMode,
            themeAnimationDuration: themeAnimationDuration,
            themeAnimationCurve: themeAnimationCurve,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            actions: actions,
            restorationScopeId: restorationScopeId,
            scrollBehavior: scrollBehavior,
          );
        });
  }
}

/// Manages customised theme properties that modify the look of the UI.
///
/// * **Use this class in UI:**
///
/// The following example shows a way to listen to theme changes
/// (mostly used in custom widgets), and a way to set theme
/// properties runtime and notify all listeners.
///
/// ```dart
/// var themeProvider = Provider.of<ShadeCustomThemeProperties>(context);
///
/// //...
///
/// // To listen
/// /*...*/themeProvider.accent;
/// // To set
/// /*...*/themeProvider.accent = ShadeThemeAccent.blue;
/// ```
class ShadeCustomThemeProperties extends ChangeNotifier {
  ThemeMode? _themeMode;
  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;
  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  ShadeThemeAccent? _accent;
  ShadeThemeAccent get accent => _accent ?? ShadeThemeAccent.blue;
  set accent(ShadeThemeAccent accent) {
    _accent = accent;
    notifyListeners();
  }

  ShadeCustomThemeProperties(this._themeMode, this._accent);

  factory ShadeCustomThemeProperties.setDefault() => ShadeCustomThemeProperties(null, null);
}

/// Contains theme related properties.'
/// From ShadeUI.
class ShadeTheme {
  /// Returns the version of the input color as a color that can be used on a transparent/blurred background.
  static Color clr_OnTranspVersion(Color color) => color.withOpacity(clr_OnTranspOpacity);

  /// The opacity of a color on a blurred/transparent background.
  static const double clr_OnTranspOpacity = 0.5;

  /// Get the second variant of the "Theme.of(ctx).**colorScheme.background**" color.
  static Color clr_SchemeBackgroundVariant2(BuildContext ctx) {
    Color originalBg = Theme.of(ctx).colorScheme.background;

    return Theme.of(ctx).brightness == Brightness.light
        ? Color.fromARGB(255, originalBg.red - 17, originalBg.green - 17, originalBg.blue - 17)
        : Color.fromARGB(255, originalBg.red + 17, originalBg.green + 17, originalBg.blue + 17);
  }

  /// The maximum height that "single line" controls like a button can take up.
  static double get spec_MaxControlHeight => 35.0;

  //
  // +-----------------------------+
  //

  static const _kDefaultBorderRad = 7.0;
  static const _buttonPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15.5);

  /// Light theme data to assign to [MaterialApp]s 'theme' param.
  static ThemeData light(ShadeCustomThemeProperties t, ColorScheme cs) {
    return _buildTheme(t, Brightness.light, cs);
  }

  /// Dark theme data to assign to [MaterialApp]s 'darkTheme' param.
  static ThemeData dark(ShadeCustomThemeProperties t, ColorScheme cs) {
    return _buildTheme(t, Brightness.dark, cs);
  }

  /// Builds the base theme using the input parameters.
  ///
  /// Only the input parameters can change between the dark and
  /// the light themes.
  static ThemeData _buildTheme(ShadeCustomThemeProperties t, Brightness brightness, ColorScheme colorScheme) {
    ButtonStyle commonButtonStyle = ButtonStyle(
      padding: const MaterialStatePropertyAll(_buttonPadding),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(_kDefaultBorderRad))),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorSchemeSeed: t.accent.clr,

      // Buttons

      buttonTheme: const ButtonThemeData(height: 35),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onSecondaryContainer,
          elevation: 0,
          shadowColor: Colors.transparent,
        ).merge(commonButtonStyle),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
          backgroundColor: colorScheme.onSurface.withOpacity(0.1),
          surfaceTintColor: colorScheme.onSurface.withOpacity(0.1),
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
          shadowColor: Colors.transparent,
        ).merge(commonButtonStyle),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
        ).merge(commonButtonStyle),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          iconColor: colorScheme.primary,
          foregroundColor: colorScheme.primary,
        ).merge(commonButtonStyle),
      ),

      segmentedButtonTheme: const SegmentedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(_buttonPadding),
        ),
      ),

      // Text Input

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: (56 - 35) / 2 - 1),
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kDefaultBorderRad),
        ),
      ),

      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        menuStyle: MenuStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(_kDefaultBorderRad)))),
      ),

      // Slider

      sliderTheme: SliderThemeData(
        trackHeight: 6,
        overlayShape: RoundSliderOverlayShape(overlayRadius: spec_MaxControlHeight / 2),
      ),

      // Switch

      switchTheme: SwitchThemeData(
        splashRadius: spec_MaxControlHeight / 2,
      ),
    );
  }
}

/// Contains accent colors used in the UI.
class ShadeThemeAccent {
  /// The [Color] of this [ShadeThemeAccent] instance.
  final Color clr;
  const ShadeThemeAccent(this.clr);

  static const ShadeThemeAccent blue = ShadeThemeAccent(Colors.blueAccent);
  static const ShadeThemeAccent red = ShadeThemeAccent(Colors.redAccent);
  static const ShadeThemeAccent yellow = ShadeThemeAccent(Colors.yellowAccent);
  static const ShadeThemeAccent green = ShadeThemeAccent(Colors.greenAccent);
  static const ShadeThemeAccent orange = ShadeThemeAccent(Colors.orangeAccent);
  static const ShadeThemeAccent pink = ShadeThemeAccent(Colors.pinkAccent);
  static const ShadeThemeAccent indigo = ShadeThemeAccent(Colors.indigoAccent);
}
