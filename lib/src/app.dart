import 'package:flutter/material.dart';
import 'package:todolist/src/core/constants/ux_color_scheme.dart';
import 'package:todolist/src/core/theme/theme_config.dart';
import 'package:todolist/src/features/dashboard/pages/dashboard_screen.dart';
import 'package:todolist/src/features/login/pages/login_screen.dart';
import 'package:todolist/src/features/registation/pages/registration_screen.dart';
import 'package:todolist/src/features/splash/pages/splash_screen.dart';
import 'package:todolist/src/localization/app_localizations.dart';
import 'package:todolist/src/settings/settings_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          locale: const Locale('id', "ID"),
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales // English, no country code
          ,

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) => S.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          themeMode: ThemeMode.light,
          theme: QTheme.lightTheme
            ..copyWith(
              extensions: <ThemeExtension<dynamic>>[
                CustomColors.light,
              ],
            ),
          darkTheme: QTheme.darkTheme,
          // themeMode: settingsController.themeMode,
          home: const SplashScreen(),

          // home: const ProfileUser(),
          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
        );
      },
    );
  }
}
