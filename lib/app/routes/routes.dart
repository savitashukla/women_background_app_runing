import 'package:flutter/material.dart';
import 'package:o_woman/app/viewmodels/notes/recycle_bin.dart';
import 'package:o_woman/app/views/analytics/cycle_history/cycle_details.dart';
import 'package:o_woman/app/views/analytics/cycle_history/cycle_history.dart';
import 'package:o_woman/app/views/application_screen.dart';
import 'package:o_woman/app/views/auth/login/login.dart';
import 'package:o_woman/app/views/auth/otp/otp_screen.dart';
import 'package:o_woman/app/views/auth/register/register_screen.dart';
import 'package:o_woman/app/views/auth/reset_password/forget_password_otp_screen.dart';
import 'package:o_woman/app/views/calendar/all_year_show.dart';
import 'package:o_woman/app/views/calendar/edit_calendar.dart';
import 'package:o_woman/app/views/community/community_create_polls.dart';
import 'package:o_woman/app/views/community/community_follow/community_follower.dart';
import 'package:o_woman/app/views/community/community_notification.dart';
import 'package:o_woman/app/views/community/edit_profile.dart';
import 'package:o_woman/app/views/community/insight_notification/insight_notification.dart';
import 'package:o_woman/app/views/community/community_create_post_screen.dart';
import 'package:o_woman/app/views/community/community_profile_screen.dart';
import 'package:o_woman/app/views/community/insight_view/insight_view.dart';
import 'package:o_woman/app/views/community/save_insights/save_insights.dart';
import 'package:o_woman/app/views/community/community_home.dart';
import 'package:o_woman/app/views/cycle_track/cycle_track_second_page.dart';
import 'package:o_woman/app/views/dashboard/search_screen.dart';
import 'package:o_woman/app/views/dob_screen.dart';
import 'package:o_woman/app/views/health_query/fertility/fertility_fast.dart';
import 'package:o_woman/app/views/health_query/fertility/fertility_second.dart';
import 'package:o_woman/app/views/health_query/fertility/fertility_third.dart';
import 'package:o_woman/app/views/health_query/general_health/general_health_fast.dart';
import 'package:o_woman/app/views/health_query/general_health/general_health_second.dart';
import 'package:o_woman/app/views/health_query/general_health/general_health_third.dart';
import 'package:o_woman/app/views/health_query/health_query_nutrition/health_query_nutrition_fast.dart';
import 'package:o_woman/app/views/health_query/health_query_nutrition/health_query_nutrition_second.dart';
import 'package:o_woman/app/views/health_query/health_query_nutrition/health_query_nutrition_third.dart';
import 'package:o_woman/app/views/home/cycle_summary.dart';
import 'package:o_woman/app/views/home/water_mag/water_analysis.dart';
import 'package:o_woman/app/views/home/home_healthlifestyle_screen.dart';
import 'package:o_woman/app/views/home/symptoms_mood_screen.dart';
import 'package:o_woman/app/views/home/add_pill_screen.dart';
import 'package:o_woman/app/views/home/water_mag/water_log_management.dart';
import 'package:o_woman/app/views/home/water_mag/weight_analysis/weight_analysis.dart';
import 'package:o_woman/app/views/intro_screen/intro_slider_screen.dart';
import 'package:o_woman/app/views/intro_screen/onboding_screen.dart';
import 'package:o_woman/app/views/new_calandar/view_note/view_note.dart';
import 'package:o_woman/app/views/user_profile/add_contacts_screen.dart';
import 'package:o_woman/app/views/user_profile/be_safe_screen.dart';
import 'package:o_woman/app/views/user_profile/contact_list_screen.dart';
import 'package:o_woman/app/views/user_profile/contact_list_view_screen.dart';
import 'package:o_woman/app/views/user_profile/create_contact_screen.dart';
import 'package:o_woman/app/views/user_profile/history_screen.dart';
import 'package:o_woman/app/views/user_profile/panic_mode_setup_screen.dart';
import 'package:o_woman/app/views/user_profile/profile_edit_screen.dart';
import 'package:o_woman/app/views/user_profile/profile_screen.dart';
import 'package:o_woman/app/views/user_profile/radius_monitoring_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/add_new_notes_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/app_preferences_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/applocktype_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/besafe_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/cycle_reminder_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/data_backup_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/date_time_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/health_tracking_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/health_lifestyle_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/my_notes_empty.dart';
import 'package:o_woman/app/views/user_profile/settings/notifications_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/privacy_security_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/reminders_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/set_access_code_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/settings_main_screen.dart';
import 'package:o_woman/app/views/welcome_page.dart';
import 'package:o_woman/constants/images_url.dart';
import '../views/auth/confirm_password_screen/change_password.dart';
import '../views/auth/reset_password/forgot_password_screen.dart';
import '../views/auth/terrms_and_policy/terms_n_conditions_privacy_policy.dart';
import '../views/auth/login/bio_metric_login.dart';
import '../views/calendar/main_calendar.dart';
import '../views/cycle_track/cycle_track_fast_Screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/health_query/menstrual/menstrual_Second.dart';
import '../views/health_query/menstrual/menstrual_fast.dart';
import '../views/health_query/menstrual/menstrual_third.dart';
import '../views/health_query/screen_having/screen_having_fast.dart';
import '../views/health_query/screen_having/screen_having_second.dart';
import '../views/health_query/screen_having/screen_having_third.dart';
import '../views/intent/fast_intent.dart';
import '../views/splash.dart';
import '../views/splash_main.dart';

class Routes {
  // Route name constants
  static const String splash = 'splash';
  static const String splashMain = '/';
  static const String login = 'login';
  static const String intent = 'Intent';
  static const String onboardScreen = 'onboardScreen';
  static const String introSliderScreen = 'introSliderScreen';
  static const String otpScreen = 'otpScreen';
  static const String dashBoard = 'dashBoard';
  static const String register = 'register';
  static const String forgotPasswordScreen = 'forgotPasswordScreen';
  static const String changePasswordPage = 'changePasswordPage';
  static const String forgetPasswordOtpScreen = 'forgetPasswordOtpScreen';
  static const String calenderMain = 'calenderMain';
  static const String profileScreen = 'profileScreen'; //A
  static const String profileEditScreen = 'profileEditScreen'; //A
  static const String beSafeScreen = "beSafeScreen"; //A
  static const String contactListScreen = "ContactList"; //A
  static const String panicModeSetupScreen = "panicModeSetupScreen"; //A
  static const String addContactsScreen = "addContactsScreen"; //A
  static const String historyScreen = "historyScreen"; //A
  static const String contactListViewScreen = "contactListViewScreen"; //A
  static const String radiusMonitoringScreen = "radiusMonitoringScreen"; //A
  static const String settingsMainScreen = "settingsMainScreen"; //A
  static const String healthTrackingScreen = "healthTrackingScreen"; //A
  static const String notificationsScreen = "notificationScreen"; //A
  static const String remindersScreen = "remindersScreen"; //A
  static const String privacySecurityScreen = "privacySecurityScreen"; //A
  static const String appPreferencesScreen = "apppreferencesScreen"; //A
  static const String dataBackupScreen = "dataBackupScreen"; //A
  static const String healthLifestyleScreen = "healthLifestyleScreen"; //A
  static const String cycleReminderScreen = "cycleReminderScreen"; //A
  static const String beSafeReminderScreen = "beSafeReminderScreen"; //A
  static const String dateTimeScreen = "dateTimeScreen"; //A
  static const String applockTypeScreen = "applockTypeScreen"; //A
  static const String setAccessCodeScreen = "setAccessCodeScreen"; //A
  static const String symptomsAndMoodScreen = "symptomsAndMoodScreen"; //A
  static const String homeHealthLifestyleScreen =
      "homeHealthLifestyleScreen"; //A
  static const String addPillScreen = "addPillScreen"; //A
  static const String welcomePage = "welcomePage"; //A
  static const String myNotesScreen = "myNotesScreen"; //A
  static const String recycleBin = "recycleBin"; //A
  static const String addNewNotesScreen = "addNewNotesScreen"; //A
  static const String communityHomeScreen = "communityHomeScreen"; //A
  static const String communityCreatePostScreen =
      "communityCreatePostScreen"; //A
  static const String communityProfileScreen = "communityProfileScreen"; //A

  static const String cycleTrackFastScreen = 'cycleTrackFastScreen';
  static const String cycleTrackSecondPage = 'cycleTrackSecondPage';
  static const String menstrualFastScreen = 'menstrualFastScreen';
  static const String menstrualSecondScreen = 'menstrualSecondScreen';
  static const String menstrualThirdScreen = 'menstrualThirdScreen';
  static const String fertilityFast = 'fertilityFast';
  static const String fertilitySecond = 'fertilitySecond';
  static const String fertilityThird = 'fertilityThird';

  static const String healthQueryNutritionFast = 'healthQueryNutritionFast';
  static const String healthQueryNutritionSecond = 'healthQueryNutritionSecond';
  static const String healthQueryNutritionThird = 'healthQueryNutritionThird';

  static const String generalHealthFast = 'generalHealthFast';
  static const String generalHealthSecond = 'generalHealthSecond';
  static const String generalHealthThird = 'generalHealthThird';

  static const String screenHavingFast = 'screenHavingFast';
  static const String screenHavingSecond = 'screenHavingSecond';
  static const String screenHavingThird = 'screenHavingThird';
  static const String editCalendarMain = 'editCalendarMain';
  static const String waterLogManagement = 'waterLogManagement';
  static const String waterAnalytics = 'waterAnalytics';
  static const String weightAnalysis = 'weightAnalysis';
  static const String calanderViewNote = 'calanderViewNote';
  static const String createContact = 'createContact';
  static const String saveInsights = 'saveInsights';
  static const String viewInsights = 'viewInsights';
  static const String searchPage = 'searchPage';
  static const String insightNotification = 'insightNotification';
  static const String communityEditProfile = 'communityEditProfile';
  static const String communityCreatePolls = 'communityCreatePolls';
  static const String followerscreen = 'followerscreen';
  static const String securityBioM = 'SecurityBioM';
  static const String privacyPolicy = 'privacyPolicy';
  static const String communityNotification = 'communityNotification';
  static const String termsNConditionsPrivacy = 'TermsNConditionsPrivacy';
  static const String cycleSummary = 'cycleSummary';
  static const String dobScreen = "dobScreen";
  static const String applicationScreen = "applicationScreen";
  static const String cycleDetailsScreen = "cycleDetailsScreen";
  static const String cycleHistoryScreen = "cycleHistoryScreen";
  static const String allYearCalendar = "allYearCalendar";


  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Route<dynamic> getRoutes(RouteSettings setting) {
    switch (setting.name) {
      case splashMain:
        return MaterialPageRoute(builder: (context) => const SplashMain());
      case securityBioM:
        return MaterialPageRoute(builder: (context) => const SecurityBioM());
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case introSliderScreen:
        return MaterialPageRoute(
            builder: (context) => const IntroSliderScreen());
      case cycleTrackFastScreen:
        return MaterialPageRoute(
            builder: (context) => const CycleTrackFastScreen());
      case cycleTrackSecondPage:
        return withoutAnimation(const CycleTrackSecondPage());

      case menstrualFastScreen:
        return withoutAnimation(const MenstrualFastScreen());
      case menstrualSecondScreen:
        return withoutAnimation(const MenstrualSecondScreen());
      case menstrualThirdScreen:
        return withoutAnimation(const MenstrualThirdScreen());

      case fertilityFast:
        return withoutAnimation(const FertilityFastScreen());
      case fertilitySecond:
        return withoutAnimation(const FertilitySecondScreen());
      case fertilityThird:
        return withoutAnimation(const FertilityThirdScreen());

//healthQueryNutritionFast
      case healthQueryNutritionFast:
        return withoutAnimation(const HealthQueryNutritionFast());
      case healthQueryNutritionSecond:
        return withoutAnimation(const HealthQueryNutritionSecond());
      case healthQueryNutritionThird:
        return withoutAnimation(const HealthQueryNutritionThird());
// generalHealthFast
      case generalHealthFast:
        return withoutAnimation(const GeneralHealthFast());
      case generalHealthSecond:
        return withoutAnimation(const GeneralHealthSecond());
      case generalHealthThird:
        return withoutAnimation(const GeneralHealthThird());

      case screenHavingFast:
        return withoutAnimation(const ScreenHavingFast());
      case screenHavingSecond:
        return withoutAnimation(const ScreenHavingSecond());
      case screenHavingThird:
        return withoutAnimation(const ScreenHavingThird());

      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case intent:
        return MaterialPageRoute(builder: (context) => const FastIntent());
      case onboardScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case otpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                OTPScreenView(email: setting.arguments as String));
      case dashBoard:
        return slideTransition(const DashboardScreen());
      case cycleSummary:
        return withoutAnimation(const CycleSummary());

      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case changePasswordPage:
        return MaterialPageRoute(
            builder: (context) =>
                ChangePasswordPage(email: setting.arguments as String));
      case forgetPasswordOtpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ForgetPasswordOtpScreen(email: setting.arguments as String));
      case forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case calenderMain:
        return MaterialPageRoute(builder: (context) => const CalenderMain());

      case profileScreen:
        return slideTransition(ProfileScreen());

      case profileEditScreen:
        return MaterialPageRoute(
            builder: (context) => const ProfileEditScreen()); //A
      case beSafeScreen:
        return MaterialPageRoute(
            builder: (context) => const BeSafeScreen()); //A
      case contactListScreen:
        return MaterialPageRoute(
            builder: (context) => const ContactListScreen());
      case editCalendarMain:
        return MaterialPageRoute(builder: (context) => EditCalendar());

      case panicModeSetupScreen:
        return MaterialPageRoute(
            builder: (context) => const PanicModeSetupScreen()); //A
      case addContactsScreen:
        return MaterialPageRoute(builder: (context) => AddContactsScreen()); //A
      case historyScreen:
        return MaterialPageRoute(
            builder: (context) => const HistoryScreen()); //A
      case radiusMonitoringScreen:
        return MaterialPageRoute(
            builder: (context) => const RadiusMonitoringScreen()); //A
      case contactListViewScreen:
        return MaterialPageRoute(
            builder: (context) => const ContactListViewScreen()); //A
      case settingsMainScreen:
        return MaterialPageRoute(
            builder: (context) => const SettingsMainScreen()); //A
      case healthTrackingScreen:
        return MaterialPageRoute(
            builder: (context) => const HealthTrackingScreen()); //A
      case notificationsScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationsScreen()); //A
      case remindersScreen:
        return MaterialPageRoute(
            builder: (context) => const RemindersScreen()); //A
      case privacySecurityScreen:
        return MaterialPageRoute(
            builder: (context) => const PrivacySecurityScreen()); //A
      case appPreferencesScreen:
        return MaterialPageRoute(
            builder: (context) => const AppPreferencesScreen()); //A
      case dataBackupScreen:
        return MaterialPageRoute(
            builder: (context) => const DataBackupScreen()); //A
      case healthLifestyleScreen:
        return MaterialPageRoute(
            builder: (context) => const HealthLifestyleScreen()); //A
      case cycleReminderScreen:
        return MaterialPageRoute(
            builder: (context) => const CycleReminderScreen()); //A
      case beSafeReminderScreen:
        return MaterialPageRoute(
            builder: (context) => const BeSafeReminderScreen()); //A
      case dateTimeScreen:
        return MaterialPageRoute(
            builder: (context) => const DateTimeScreen()); //A
      case applockTypeScreen:
        return MaterialPageRoute(builder: (context) => AppLockTypeScreen());
      case waterLogManagement:
        return MaterialPageRoute(builder: (context) => WaterLogManagement());
      case waterAnalytics:
        return MaterialPageRoute(builder: (context) => WaterAnalysis());
      case weightAnalysis:
        return MaterialPageRoute(builder: (context) => WeightAnalysis());
      case calanderViewNote:
        return MaterialPageRoute(builder: (context) => CalanderViewNote());
      case setAccessCodeScreen:
        return MaterialPageRoute(
            builder: (context) => const SetAccessCodeScreen()); //A
      case symptomsAndMoodScreen:
        return MaterialPageRoute(
            builder: (context) => SymptomsAndMoodScreen()); //A
      case homeHealthLifestyleScreen:
        return MaterialPageRoute(
            builder: (context) => const HomeHealthLifestyleScreen()); //A
      case addPillScreen:
        return MaterialPageRoute(
            builder: (context) => const AddPillScreen()); //A
      case welcomePage:
        return MaterialPageRoute(builder: (context) => const WelcomePage()); //A
      case myNotesScreen:
        return MaterialPageRoute(
            builder: (context) => const MyNotesScreen()); //A
      case recycleBin:
        return MaterialPageRoute(builder: (context) => const RecycleBin());
      case addNewNotesScreen:
        return MaterialPageRoute(
            builder: (context) => const AddNewNotesScreen()); //A
      case cycleHistoryScreen:
        return MaterialPageRoute(
            builder: (context) => const CycleHistoryScreen()); //A

      case saveInsights:
        return MaterialPageRoute(builder: (context) => SaveInsights()); //A

      case followerscreen:
        return MaterialPageRoute(builder: (context) => FollowerScreen());

      case viewInsights:
        return MaterialPageRoute(builder: (context) => ViewInsight());

      case communityHomeScreen:
        return MaterialPageRoute(
            builder: (context) => const CommunityHomeScreen()); //A

      case insightNotification:
        return MaterialPageRoute(builder: (context) => InsightNotification());

      case communityCreatePostScreen:
        return MaterialPageRoute(
            builder: (context) => const CommunityCreatePost()); //A

      case searchPage:
        return MaterialPageRoute(builder: (context) => SearchPage()); //A

      case createContact:
        return MaterialPageRoute(builder: (context) => CreateContact()); //A
      //communityEditProfile
      case communityEditProfile:
        return MaterialPageRoute(builder: (context) => CommunityEditProfile());
      case communityProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const CommunityProfileScreen()); //A
      case communityNotification:
        return MaterialPageRoute(builder: (context) => CommunityNotification());
      case applicationScreen:
        return MaterialPageRoute(builder: (context) => ApplicationScreen());
      //communityWelcome
      case communityCreatePolls:
        return MaterialPageRoute(builder: (context) => CommunityCreatePolls());
      //communityCreatePolls
      case dobScreen:
        return MaterialPageRoute(builder: (context) => DOBScreen());
      case cycleDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => const CycleDetailsScreen());
      case allYearCalendar:
        return MaterialPageRoute(
            builder: (context) =>  AllYearCalendar());
      case privacyPolicy:
        return MaterialPageRoute(
            builder: (context) => const TermsNConditionsPrivacy(
                  appBarTitle: "Privacy Policy",
                  iconName: ImagesUrl.appLogo,
                ));
      // return MaterialPageRoute(builder: (context) => const PrivacyPolicy());
      case termsNConditionsPrivacy:
        return MaterialPageRoute(
            builder: (context) => const TermsNConditionsPrivacy(
                  appBarTitle: "Terms & Conditions",
                  iconName: ImagesUrl.appLogo,
                ));

      default:
        throw const FormatException('Route not found! Check routes again');
    }
  }

  static PageRouteBuilder buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static PageRouteBuilder withoutAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Return an empty transition to disable animation
        return child;
      },
    );
  }

  static PageRouteBuilder slideTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
