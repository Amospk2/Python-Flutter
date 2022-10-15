import 'package:flutter/material.dart';
import 'package:flutter_todo/src/features/auth/pages/auth_page.dart';
import 'package:provider/provider.dart';
import '../controller/register_controller.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late final RegisterController registerController;

  @override
  void initState() {
    super.initState();

    registerController = context.read<RegisterController>();


    registerController.addListener(() {
      if (registerController.state == APIResponseType.error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error Found!'),
          duration: Duration(seconds: 2),
        ));
      } else if (registerController.state == APIResponseType.sucess) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sucesso!'),
          duration: Duration(seconds: 2),
        ));
        Navigator.pop(context);
        
      }
    });
  }

  

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
              onChanged: (((value) => registerController.createUserInputs['email'] = value)),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (((value) => registerController.createUserInputs['username'] = value)),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (((value) => registerController.createUserInputs['name'] = value)),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (((value) => registerController.createUserInputs['password'] = value)),
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => registerController.create(),
                child: const Text("Registra-se")),
          ],
        ),
      ),
    );
  }
}

