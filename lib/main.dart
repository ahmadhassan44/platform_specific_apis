import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_specific_apis/main_cubit.dart';
import 'package:platform_specific_apis/main_screen.dart';

class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: const MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        home: MainScreen()
      ),
    );
  }
}
void main(){
  runApp(const MyApp());
}
