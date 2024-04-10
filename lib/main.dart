import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trucks/Common/Theme/theme.dart';
import 'package:trucks/Common/Theme/theme_provider.dart';
import 'package:trucks/Common/Utils/router.dart';
import 'package:trucks/Features/Auth/screens/splash_screen.dart';
import 'package:trucks/Features/Home/repo/notif_service.dart';
import 'package:trucks/Features/Home/repo/push_notif_repo.dart';
import 'package:trucks/Models/user.preferences.dart';
import 'package:trucks/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TruckPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MessageApi.initializeFirebaseMessaging();
  NotificationService.initializeNotificationChannel();
  await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    return MaterialApp(
      title: 'TruckHub',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeState.darkTheme,
      theme: ThemeState.lightTheme,
      themeMode: themeModeState,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
