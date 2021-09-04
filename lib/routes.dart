import 'imports.dart';

Route<dynamic>? generatedRoute(RouteSettings settings) {
  final setting = settings.name;
  // ignore: unused_local_variable
  Map<String, dynamic>? args =
      settings.arguments == null ? Map() : Map.from(settings.arguments as Map);

  switch (setting) {
    case Splash.route:
      return MaterialPageRoute(builder: (_) => Splash());
    case HomePage.route:
      return MaterialPageRoute(
          builder: (_) => HomePage(
                data: args,
              ));
    case Login.route:
      return MaterialPageRoute(builder: (_) => Login());
    case Register.route:
      return MaterialPageRoute(builder: (_) => Register());
    case Authors.route:
      return MaterialPageRoute(builder: (_) => Authors());

    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      });
  }
}
