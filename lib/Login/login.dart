import 'package:appentus/imports.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  static const route = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool validate = false;
  checkValidator(String value) {
    if (value.isNotEmpty && value.length < 2) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to Appentus",
                  style: TextStyle(
                      color: Color(0xff0d6efd),
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      // color: Color(0xff0d6efd),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Utils.underlineTextField(
                    labelText: "Enter Your Email",
                    controller: emailController,
                    validate: validate,
                    hintText: "John@doe.com",
                    onSubmitted: checkValidator,
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 10,
                ),
                Utils.underlineTextField(
                    obscureText: true,
                    labelText: "Enter Your Password",
                    controller: passwordController,
                    validate: validate,
                    onSubmitted: checkValidator,
                    keyboardType: TextInputType.visiblePassword),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                              color: Color(0xff0d6efd),
                            )),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              color: Color(0xff0d6efd),
                            )),
                          ),
                          onPressed: () {
                            if (emailController.text.trim().isEmpty ||
                                passwordController.text.trim().isEmpty) {
                              return setState(() {
                                validate = true;
                              });
                            } else
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomePage.route,
                                (route) => false,
                                arguments: {
                                  "email": emailController.text,
                                },
                              );
                          },
                          child: Text("Submit")),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Or"),
                ),
                Expanded(child: Divider()),
              ],
            ),
          ),
          TextButton(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                color: Color(0xff0d6efd),
              ))),
              onPressed: () {
                Navigator.pushNamed(context, Register.route);
              },
              child: Text("New User? Sign Up here!"))
        ],
      ),
    );
  }
}
