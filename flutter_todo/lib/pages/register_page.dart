import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/login_page.dart';
import 'package:flutter_todo/service/dio_service_imp.dart';
import '../controller/register_controller.dart';
import '../repository/imp/register_repository_imp.dart';

class RegisterPage extends StatelessWidget {

  RegisterPage({ Key? key}) : super(key: key);
  final RegisterController registerController = RegisterController(
      nameController: TextEditingController(),
      passwordController: TextEditingController(),
      emailController: TextEditingController(),
      usernameController: TextEditingController(),
      registerRepository: RegisterRepositoryImp(DioServiceImp()));

  final snackBar = const SnackBar(
    content: Text('Falha ao realizar cadastro!'),
    duration: Duration(seconds: 5),
  );

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 220, 226, 255),
      body: 
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Register Page",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: registerController.emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: registerController.usernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: registerController.nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: registerController.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => registerController.register().then((value) {
                      if (value) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }),
                child: const Text("Registra-se")),
          ],
        ),
      ),
    );
  }
}

