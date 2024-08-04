import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_advanced_block/bloc/employee_bloc.dart';
import 'package:task7_advanced_block/pages/home_page.dart';
import 'package:task7_advanced_block/repoistory/employee_repoistory.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => EmployeeBloc(EmployeeRepoistory()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
