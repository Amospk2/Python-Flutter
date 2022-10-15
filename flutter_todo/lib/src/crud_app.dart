import 'package:flutter/material.dart';
import 'package:flutter_todo/src/shared/services/client_dio.dart';
import 'package:provider/provider.dart';
import 'features/auth/pages/auth_page.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/home/controller/home_controller.dart';
import 'features/register/controller/register_controller.dart';

class CrudFlutter extends StatelessWidget {
  const CrudFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ClientDio()),
        ChangeNotifierProvider(
            create: (context) =>
                AuthController(client: context.read<ClientDio>())),
        ChangeNotifierProvider(
            create: (context) =>
                HomeController(client: context.read<ClientDio>())),
        ChangeNotifierProvider(
            create: (context) =>
                RegisterController(client: context.read<ClientDio>()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthPage(),
      ),
    );
  }
}
