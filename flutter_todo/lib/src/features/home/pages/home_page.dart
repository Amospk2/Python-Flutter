import 'package:flutter/material.dart';
import 'package:flutter_todo/src/features/auth/pages/auth_page.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final HomeController homeController;

  @override
  void initState() {
    super.initState();

    homeController = context.read<HomeController>();
    homeController.fetch();
    homeController.addListener(() {
      if (homeController.state == APIResponseType.error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error Found!'),
          duration: Duration(seconds: 2),
        ));
      } else if (homeController.state == APIResponseType.sucess) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sucesso!'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const AuthPage()));}, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SizedBox(

          child: Column(
            children: [
              const SizedBox(height: 15,),
              Consumer<HomeController>(
                builder: (context, controller, child) {
                  return controller.state == APIResponseType.loading ? CircularProgressIndicator() : SizedBox();
                }
              ),
              Consumer<HomeController>(
                builder: (context, controller, child) {
                  return controller.users != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.users.length,
                          itemBuilder: (__, idx) => InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 20,),
                              Text(controller.users[idx].name),
                              const Spacer(),
                              IconButton(icon:const Icon(Icons.edit), onPressed: (){ buildDialod(context, controller.users[idx]);}),
                              IconButton(icon:const Icon(Icons.delete), onPressed: (){homeController.deleteUser(controller.users[idx].id);},),
                              const SizedBox(width: 20, height: 10,),
                            ],),
                            
                             

                          ),
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ],
          )
          ),
    );
  }
}


buildDialod(BuildContext context, User user)
{
  final controller = context.read<HomeController>();



  return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Edit You User'),
          content: buildPading(context, user),

          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'OK');
                await controller.update(user.id);
                controller.fetch();
                },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}

Padding buildPading(BuildContext context, User user)
{

  final controller = context.read<HomeController>();
  final TextEditingController emailController = TextEditingController(text: user.email);
  final TextEditingController passController = TextEditingController(text: user.password);
  final TextEditingController nameController = TextEditingController(text: user.name);
  final TextEditingController usernameController = TextEditingController(text: user.username);

  controller.editUserInputs["email"] = user.email;
  controller.editUserInputs["password"] = user.password;
  controller.editUserInputs["name"] = user.name;
  controller.editUserInputs["username"] = user.username;


  return Padding(
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
              controller: emailController,
              onChanged: ((value) => controller.editUserInputs["email"] = value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: usernameController,
              onChanged: ((value) => controller.editUserInputs["username"] = value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              onChanged: ((value) => controller.editUserInputs["name"] = value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passController,
              onChanged: ((value) => controller.editUserInputs["password"] = value),
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
}