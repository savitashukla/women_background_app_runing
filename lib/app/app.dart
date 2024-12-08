import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/routes/routes.dart';

import '../constants/app_colors.dart';
import '../utils/logger_utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      AppLogger.i("Application State => resumed");
    } else if (state == AppLifecycleState.detached) {
      AppLogger.i("Application State => detached");
    } else if (state == AppLifecycleState.inactive) {
      AppLogger.i("Application State => inactive");
    } else if (state == AppLifecycleState.paused) {
      AppLogger.i("Application State => paused");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Builder(
      builder: (context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.colorPrimary,
              colorScheme:
                  const ColorScheme.light(primary: AppColors.colorPrimary),
              splashColor: AppColors.colorPrimary,
              fontFamily: 'Poppins',
            ),
            navigatorKey: navigatorKey,
            onGenerateRoute: (RouteSettings setting) {
              return Routes.getRoutes(setting);
            },
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child!);
            });
      },
    );
  }

  final navigationKey = GlobalKey<NavigatorState>();
}
