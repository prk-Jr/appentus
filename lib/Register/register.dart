import 'dart:io';

import 'package:appentus/Utils/current_user.dart';
import 'package:appentus/Utils/utils.dart';
import 'package:appentus/imports.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  static const route = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  bool validate = false;

  checkValidator(String value) {
    if (value.isNotEmpty) setState(() {});
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
                  "Sign UP",
                  style: TextStyle(
                      // color: Color(0xff0d6efd),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    final images = await Utils().pickFiles();
                    if (images.isNotEmpty)
                      setState(() {
                        imagePath = images.first.path;
                      });
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        )),
                    child: imagePath != null
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(imagePath.toString()),
                                    )),
                                borderRadius: BorderRadius.circular(
                                  8,
                                )))
                        : Icon(
                            Icons.camera_alt_outlined,
                            size: 45,
                            color: validate ? Colors.red : Colors.grey.shade700,
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Utils.underlineTextField(
                    labelText: "Enter Your Name",
                    controller: nameController,
                    hintText: "John Doe",
                    validate: validate,
                    onSubmitted: checkValidator),
                SizedBox(
                  height: 10,
                ),
                Utils.underlineTextField(
                    labelText: "Enter Your Email",
                    controller: emailController,
                    hintText: "John@doe.com",
                    validate: validate,
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
                Utils.underlineTextField(
                    labelText: "Enter Your Mobile Number",
                    controller: numberController,
                    validate: validate,
                    onSubmitted: checkValidator,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false)),
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
                                nameController.text.trim().isEmpty ||
                                numberController.text.trim().isEmpty ||
                                passwordController.text.trim().isEmpty ||
                                imagePath == null) {
                              return setState(() {
                                validate = true;
                              });
                            } else {
                              setState(() {
                                name = nameController.text.trim();
                              });
                              SharedPreferences.getInstance()
                                  .then((preference) {
                                preference.setString(
                                    "name", nameController.text.trim());
                                preference.setString(
                                    "image", imagePath ?? 'null');
                              });
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HomePage.route, (route) => false);
                            }
                          },
                          child: Text("Register")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
