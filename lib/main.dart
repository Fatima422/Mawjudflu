import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';
import 'screens/Splash.dart';
import 'screens/dashboard.dart';
import 'screens/dashboard_screen.dart';

//FirebaseUse user = _auth.currentUser();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('-------------------------');
  DateFormat('EEEE').format(DateTime.now());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final _auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // User?  user = FirebaseAuth.instance.currentUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAWJUD APP',
      debugShowCheckedModeBanner: false,
      home: _auth.currentUser == null ? SplashScreen() : DashboardScreen22T(),
    );
  }
}
