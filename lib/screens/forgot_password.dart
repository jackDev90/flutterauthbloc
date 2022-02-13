import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pallete.dart';
import '../widgets/rounded_button.dart';
import 'package:blocauth/style/theme.dart' as Style;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: const Text(
              'Forgot Password',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          width: size.width * 0.8,
                          child: const Text(
                            'Enter your email we will send instruction to reset your password',
                            style:
                                TextStyle(color: Colors.black, fontSize: 22.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Style.Colors.titleColor,
                              fontWeight: FontWeight.bold),
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.black26,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(30.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Style.Colors.mainColor),
                                borderRadius: BorderRadius.circular(30.0)),
                            contentPadding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            labelText: "E-mail",
                            hintStyle: const TextStyle(
                                fontSize: 12.0,
                                color: Style.Colors.grey,
                                fontWeight: FontWeight.w500),
                            labelStyle: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          autocorrect: false,
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const RoundedButton(buttonName: 'Send')
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
