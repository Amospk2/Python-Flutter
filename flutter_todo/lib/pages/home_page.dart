import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/home_controller.dart';
import 'package:flutter_todo/pages/login_page.dart';

import 'package:flutter_todo/service/http_service_imp.dart';

import '../controller/edit_controller.dart';
import '../models/user_model.dart';
import '../repository/imp/edit_repository_imp.dart';
import '../repository/imp/home_repository_imp.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _homeController =
      HomeController(HomeRepositoryImp(httpService: HttpServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage()));}, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(

          child: Column(
            children: [
              const SizedBox(height: 15,),
              ValueListenableBuilder<List<User>?>(
                valueListenable: _homeController.users!,
                builder: (_, users, __) {
                  return users != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: users.length,
                          itemBuilder: (__, idx) => InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 20,),
                              Text(users[idx].name),
                              const Spacer(),
                              IconButton(icon:const Icon(Icons.edit), onPressed: (){ buildDialod(context, users[idx], _homeController);}),
                              IconButton(icon:const Icon(Icons.delete), onPressed: (){_homeController.deleteUser(users[idx].id);},),
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


buildDialod(BuildContext context, User user, HomeController _homeController)
{
  final EditController _editController = EditController(user: user, nameController: TextEditingController(),
          passwordController: TextEditingController(),
          emailController: TextEditingController(),
          usernameController: TextEditingController(),
          editRepository: EditRepositoryImp(HttpServiceImp()));

  return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Edit You User'),
          content: buildPading(context, _editController),

          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'OK');
                await _editController.update(user.id);
                _homeController.fetch();
                },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}

Padding buildPading(BuildContext context, EditController editController)
{
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
              controller: editController.emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: editController.usernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: editController.nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: editController.passwordController,
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