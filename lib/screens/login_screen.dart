import 'package:flutter/material.dart';
import 'package:test_project_flutter/utils/colors.dart';
import 'package:test_project_flutter/widgets/glow_button.dart';
import 'package:test_project_flutter/widgets/gradient_widget.dart';
import 'package:test_project_flutter/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 180),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: "Enter Username/Email",
                    controller: usernameController,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: "Enter Password",
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    suffixIcon: GradientWidget(
                      colors: GoldGradientColor,
                      child: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GlowButton(
                      isEnabled: isButtonEnabled,
                      onPressed: () => print("Login Button Pressed")),
                  const SizedBox(height: 29),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "No Account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GradientWidget(
                        colors: GoldGradientColor,
                        child: const Text(
                          "Register Here",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
