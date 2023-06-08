import 'package:bloc_project/home.dart';
import 'package:bloc_project/models/client_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
        providers: [
          BlocProvider<ClientInfoCubit>(
            create: (context) => ClientInfoCubit(),
          ),
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
