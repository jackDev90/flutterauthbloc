import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blocauth/screens/screens.dart';
import 'package:blocauth/style/theme.dart' as Style;

import '../../bloc/login_bloc/login_bloc.dart';
import '../../pallete.dart';
import '../../repositories/repositories.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  const LoginForm({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLogging = false;

  _onLoginButtonPressed() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: _usernameController.text,
        password: _passwordController.text,
      ),
    );

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        showInSnackBar('Login Failed');
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.3,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor:
                                  const Color.fromARGB(0, 0, 0, 0).withOpacity(
                                0.9,
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                                color: kWhite,
                                size: size.width * 0.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.08,
                        left: size.width * 0.56,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: kBlue,
                            shape: BoxShape.circle,
                            border: Border.all(color: kWhite, width: 2),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.arrowUp,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  const Center(
                    child: Text(
                      'Login to you account',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      // add text input fields here
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'E-mail is required';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Style.Colors.titleColor,
                                  fontWeight: FontWeight.bold),
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email_outlined,
                                    color: Colors.black26),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(30.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Style.Colors.mainColor),
                                    borderRadius: BorderRadius.circular(30.0)),
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                labelText: "E-Mail",
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
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
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
                              controller: _passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
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
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                labelText: "Password",
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
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                  child: const Text(
                                    "Forget password?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ForgotPassword()));
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(
                                    height: 45,
                                    child: state is LoginLoading
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Center(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  SizedBox(
                                                    height: 25.0,
                                                    width: 25.0,
                                                    child:
                                                        CupertinoActivityIndicator(),
                                                  )
                                                ],
                                              ))
                                            ],
                                          )
                                        : RaisedButton(
                                            color: Style.Colors.mainColor,
                                            disabledColor:
                                                Style.Colors.mainColor,
                                            disabledTextColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            onPressed: _onLoginButtonPressed,
                                            child: const Text("LOG IN",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)))),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Style.Colors.grey, fontSize: 17),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 5.0),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => CreateNewAccount(
                                            userRepository: userRepository,
                                          )));
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Style.Colors.mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ))
                          ],
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    }));
  }

  void showInSnackBar(String s) {
    final snackBar = SnackBar(
      content: const Text('Please fix the errors in red before submitting.'),
      backgroundColor: (const Color(0xFFFF0808)),
      action: SnackBarAction(
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
