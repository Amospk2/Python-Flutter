import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/login_controller.dart';
import 'package:flutter_todo/pages/register_page.dart';
import 'package:flutter_todo/service/dio_service_imp.dart';
import '../repository/imp/login_repository_imp.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController = LoginController(
      nomeController: TextEditingController(),
      senhaController: TextEditingController(),
      loginRepositoryImp: LoginRepositoryImp(dioService: DioServiceImp()));

  final snackBar = const SnackBar(
    content: Text('Falha ao realizar login!'),
    duration: Duration(seconds: 5),
  );

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
              controller: _loginController.nomeController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _loginController.senhaController,
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
                TextButton(
                    onPressed: () => _loginController.auth().then((value) {
                          if (value) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }),
                    child: const Text("Entrar")),
                Spacer(),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RegisterPage(),
                            fullscreenDialog: true)),
                    child: const Text("Registrar-se")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
