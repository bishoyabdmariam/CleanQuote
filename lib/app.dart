import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotemaker/Config/locale/app_localizations_setup.dart';
import 'package:quotemaker/Config/routes/app_routes.dart';
import 'package:quotemaker/Config/theme/app_theme.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:quotemaker/Features/splash/presentation/cubit/locale_cubit.dart';
import 'package:quotemaker/injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.sl<LocaleCubit>())],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            /*
      routes: routes,
      initialRoute: Routes.initialRoute,*/
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
