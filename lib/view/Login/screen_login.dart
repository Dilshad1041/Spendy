import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({
    super.key,
  });

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  bool isFocused = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Lottie.asset('assets/shopping-options.json'),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Email",
                  suffixIcon: const Icon(Icons.email),
                  suffixIconColor: const Color.fromARGB(255, 2, 21, 2),
                  fillColor: const Color.fromARGB(255, 233, 247, 233),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: isFocused
                          ? const Color.fromARGB(255, 0, 13, 1)
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    isFocused =
                        true; // Update isFocused when TextFormField is tapped
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    isFocused =
                        false; // Update isFocused when TextFormField loses focus
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  suffixIconColor: const Color.fromARGB(255, 2, 21, 2),
                  fillColor: const Color.fromARGB(255, 233, 247, 233),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: isFocused
                          ? const Color.fromARGB(255, 0, 13, 1)
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    isFocused =
                        true; // Update isFocused when TextFormField is tapped
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    isFocused =
                        false; // Update isFocused when TextFormField loses focus
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
