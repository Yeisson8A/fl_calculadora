import 'package:fl_calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CalculatorBloc())], 
      child: const MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black
      )
    );
  }
}
