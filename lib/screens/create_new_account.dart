import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:blocauth/style/theme.dart' as Style;

import '../repositories/repositories.dart';
import 'auth/login_screen.dart';

class CreateNewAccount extends StatefulWidget {
  final UserRepository userRepository;
  const CreateNewAccount({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<CreateNewAccount> createState() =>
      _CreateNewAccountState(userRepository);
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final UserRepository userRepository;
  _CreateNewAccountState(this.userRepository);
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLogging = false;

  _onRegisterButtonPressed() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.3,
                ),
                const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                const Center(
                  child: Text(
                    'Create New Account',
                    style: TextStyle(fontSize: 18.0),
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name is required';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Style.Colors.titleColor,
                                    fontWeight: FontWeight.bold),
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person,
                                      color: Colors.black26),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Style.Colors.mainColor),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  labelText: "First Name",
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
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name is required';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Style.Colors.titleColor,
                                    fontWeight: FontWeight.bold),
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person,
                                      color: Colors.black26),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Style.Colors.mainColor),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  labelText: "Last Name",
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
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
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
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Style.Colors.mainColor),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
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
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
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
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Style.Colors.mainColor),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
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
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  SizedBox(
                                      height: 45,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder()),
                                          onPressed: _onRegisterButtonPressed,
                                          child: (isLogging)
                                              ? const SizedBox(
                                                  height: 20.0,
                                                  width: 20.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 2.5,
                                                  ))
                                              : const Text("Register",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)))),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: const EdgeInsets.only(bottom: 90.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                    color: Style.Colors.grey, fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => LoginScreen(
                                                  userRepository:
                                                      userRepository,
                                                )));
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Style.Colors.mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
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
  }
}
