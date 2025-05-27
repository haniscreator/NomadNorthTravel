import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_in_chiangmai/widgets/main_nav.dart';
import '../../blocs/auth_cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: 'demo');
  final TextEditingController passwordController = TextEditingController(text: '12345');

  final String hardcodedEmail = 'demo';
  final String hardcodedPassword = '12345';

  String? errorMessage;

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == hardcodedEmail && password == hardcodedPassword) {
      // Save user login state
      context.read<AuthCubit>().login(email: email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNav(selectedIndex: 2,)),
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
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Login to your account", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            if (errorMessage != null)
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
