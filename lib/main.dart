import 'package:bmi/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/mainone/cubit/app_cubit.dart';

void main() => runApp(const BmiApp());

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calulcator',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AppCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
