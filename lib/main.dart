import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungproject/states/home.dart';
import 'package:ungproject/states/my_service.dart';

final Map<String, WidgetBuilder> map = {
  '/home': (context) => const Home(),
  '/myService': (context) => const MyService(),
};

String? initial;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) async {
      print('Initial Success');

      var result = await FirebaseAuth.instance.currentUser;
      if (result == null) {
        print('SignOut Status');
        initial = '/home';
        runApp(
          MyApp(),
        );
      } else {
        print('SignIn Status');
        initial = '/myService';
        runApp(
          MyApp(),
        );
      }
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initial,
    );
  }
}
