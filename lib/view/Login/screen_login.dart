import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spendy/controller/login_service.dart';
import 'package:spendy/core/auth_validation.dart';
import 'package:spendy/core/form_error.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  bool isFocused = false;
  bool _obscureText = true;
  bool? dialogeState = false;
  final List<String?> errors = [];
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
        dialogeState = true;
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
        dialogeState = false;
      });
    }
  }

  showErrorDialog(BuildContext context, String title) {
    if (errors.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  FormError(errors: errors),
                ],
              ),
            ),
            backgroundColor: Colors.red,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  _launchURL() async {
    const url = 'https://spendy-u3oz.onrender.com/signup';
    print('Launching URL: $url');
    try {
      if (await canLaunch(url)) {
        print('Launching...');
        await launch(url);
        print('Launched successfully');
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Future<void> _login() async {
    loginUser(
      email: emailController.text,
      password: passwordController.text,
      context: context,
      setLoading: (bool loading) {
        setState(() {
          _isLoading = loading;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the children vertically
                      children: [
                        Lottie.asset(
                          'assets/shopping-options.json',
                          height: 250,
                          width: 250,
                        ),
                        const SizedBox(height: 20),
                        Image.asset("assets/spendyLogo.png"),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Email",
                            suffixIcon: const Icon(Icons.email),
                            suffixIconColor:
                                const Color.fromARGB(255, 2, 21, 2),
                          ),
                          onTap: () {
                            setState(() {
                              isFocused = true;
                            });
                          },
                          onEditingComplete: () {
                            setState(() {
                              isFocused = false;
                            });
                          },
                          onSaved: (newValue) => newValue,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kEmailNullError);
                            } else if (emailValidatorRegExp.hasMatch(value)) {
                              removeError(error: kInvalidEmailError);
                            }
                            return;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kEmailNullError);
                              return "";
                            } else if (!emailValidatorRegExp.hasMatch(value)) {
                              addError(error: kInvalidEmailError);
                              return "";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            suffixIconColor:
                                const Color.fromARGB(255, 2, 21, 2),
                          ),
                          onTap: () {
                            setState(() {
                              isFocused = true;
                            });
                          },
                          onEditingComplete: () {
                            setState(() {
                              isFocused = false;
                            });
                          },
                          onSaved: (newValue) => newValue,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kPassNullError);
                            } else if (value.length < 8) {
                              removeError(error: kShortPassError);
                            }
                            return;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kPassNullError);
                              return "";
                            } else if (value.length < 8) {
                              addError(error: kShortPassError);
                              return "";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _login();
                              errors.clear();
                            }
                            if (errors.isNotEmpty) {
                              showErrorDialog(context, "Registration Failed");
                            }
                            emailController.clear();
                            passwordController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 10, 30, 10),
                            fixedSize: const Size(400, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't you have and accout?"),
                            const SizedBox(
                              width: 2,
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchURL();
                                },
                                child: const Text('Sign Up'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
