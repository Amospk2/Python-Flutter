import 'package:flutter/material.dart';
import 'package:flutter_todo/src/features/home/pages/home_page.dart';
import 'package:flutter_todo/src/features/register/pages/register_page.dart';
import 'package:provider/provider.dart';
import '../components/auth_button.dart';
import '../controller/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthController controller;

  @override
  void initState() {
    super.initState();

    controller = context.read<AuthController>();
    controller.addListener(() {
      if (controller.state == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Falha ao realizar login!'),
          duration: Duration(seconds: 1),
        ));
      } else if (controller.state == AuthState.sucess) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 226, 255),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login Page",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: ((value) => controller.authInputs["username"] = value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: ((value) => controller.authInputs["password"] = value),
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Senha"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AuthButton(),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const RegisterPage()));
                    },
                    child: const Text("Register"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
