import 'package:bmi/logic/mainone/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIScreenResult extends StatelessWidget {
  const BMIScreenResult({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('BMI Result'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gender ${appCubit.isMaleSelected ? 'Male' : 'Female'}',
                  style: const TextStyle(fontSize: 25),
                ),
                Text('Age: ${appCubit.age}',
                    style: const TextStyle(fontSize: 25)),
                Text(
                  'BMI Result: ${appCubit.result.round()}',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
