import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/pages/register_page.dart';
import 'package:travel_in_chiangmai/widgets/main_nav.dart';
import '../blocs/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: 'demo@email.com');
  final TextEditingController passwordController = TextEditingController(text: '1234');
  String? errorMessage;
  bool rememberMe = true; 

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == kDummyEmail && password == kDummyPassword) {
      context.read<AuthCubit>().login(email: email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNav(selectedIndex: 2)),
      );
    } else {
      setState(() {
        errorMessage = 'Invalid email or password';
      });
    }
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        // Background with ClipPath at the top
        Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 370,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Content below the ClipPath
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 290), // Space for the ClipPath

              // "Sign In" Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: formTitleFontSize,
                    fontWeight: textFontWeight,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Login Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      style: const TextStyle(
                        fontSize: normalTextFontSize, 
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                      ),
                    
                    ),
                    const SizedBox(height: normalTextFontSize),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return commonBlackColor;
                            }
                            return Colors.grey;
                          }),
                        ),
                        const Text("Remember Me",
                        style: TextStyle(
                          fontSize: normalTextFontSize, 
                        ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: normalTextFontSize, 
                                fontWeight: textFontWeight,
                              ),
                          ),
                        ),
                      ],
                    ),

                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                      ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBackgroundColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text(
                          "Login", 
                          style: TextStyle(
                            fontSize: normalTextFontSize, 
                            fontWeight: textFontWeight,
                            color: Colors.white
                          )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Don’t have an Account?",
                      style: TextStyle(
                        fontSize: normalTextFontSize, 
                        //fontWeight: textFontWeight,
                        //color: Colors.white
                      )
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterPage()),
                        );  
                      },
                      child: const Text("Sign up", style: TextStyle(color: textLinkColor)),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),

        // AppBar on top of ClipPath
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

}


class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80); // Start path from bottom left

    // First wave
    path.quadraticBezierTo(
      size.width * 0.25, size.height - 120,
      size.width * 0.5, size.height - 80,
    );

    // Second wave
    path.quadraticBezierTo(
      size.width * 0.75, size.height - 40,
      size.width, size.height - 80,
    );

    path.lineTo(size.width, 0); // Top right corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
