import 'dart:async';

import 'package:appentus/Utils/current_user.dart';
import 'package:appentus/imports.dart';
import 'package:appentus/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPENTUS',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
          )),
      onGenerateRoute: generatedRoute,
      initialRoute: Splash.route,
    );
  }
}

class Splash extends StatefulWidget {
  static const route = "/";
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      if (name == null)
        Navigator.pushNamedAndRemoveUntil(
            context, Login.route, (route) => false);
      else
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.route, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        alignment: Alignment.bottomCenter,
        height: size.height * 0.75,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(150),
              bottomRight: const Radius.circular(150),
            )),
        child: Container(
          height: size.height * 0.45,
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/LOGO.png"),
            ],
          ),
        ),
      ),
    );
  }
}
