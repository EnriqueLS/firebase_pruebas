import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'src/pages/home_page.dart';
import 'src/pages/login_page.dart';

//import 'src/pages/addUsuariosFirestorePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Firebase tarda sobre una hora en refrescar que un usuario esté deshabilitado o no exista
    // Si quiero que refresque el estado al iniciar la aplicación hago el reload siguiente.
    // if (FirebaseAuth.instance.currentUser != null) {
    //   FirebaseAuth.instance.currentUser.reload();
    // }
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          print("data exists");
          return HomePage();
        } else {
          print("data no exists");
          return LoginPage();
        }
      },
    );
  }
}
