// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:bmi/logic/mainone/cubit/app_cubit.dart';
import 'package:flutter/material.dart';

import 'package:bmi/presentation/screens/bmiresult_screen.dart';
import 'package:bmi/presentation/widgets/ageweight.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/gender.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('BMI Calculator')),
          body: Column(children: [
            // The expanded widget which contains the gender part
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        appCubit.selectMale();
                      },
                      child: Gender(
                        sex: 'MALE',
                        sexImage: 'assets/images/male.png',
                        isMaleSelected: appCubit.isMaleSelected,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      appCubit.selectFemale();
                    },
                    child: Gender(
                      sex: 'FEMALE',
                      sexImage: 'assets/images/female.png',
                      isMaleSelected: !appCubit.isMaleSelected,
                    ),
                  ))
                ],
              ),
            )),
            // the expanded widget which contains the height slider
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${appCubit.sliderValue.round()}',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('CM',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Slider(
                        min: 80,
                        max: 220,
                        value: appCubit.sliderValue,
                        onChanged: (value) {
                          appCubit.toggleSlider(value);
                        }),
                  ],
                ),
              ),
            )),
            // the expanded widget which contains the age part
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                        child: AgeWeight(
                      title: 'Age',
                      value: appCubit.age,
                      func1: () {
                        appCubit.minusAge();
                      },
                      func2: () {
                        appCubit.plusAge();
                      },
                      herotag1: 'age-',
                      herotag2: 'age+',
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AgeWeight(
                        title: 'Weight',
                        value: appCubit.weight,
                        func1: () {
                          appCubit.minusWeight();
                        },
                        func2: () {
                          appCubit.plusWeight();
                        },
                        herotag1: 'weight-',
                        herotag2: 'weight+',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // the container which contains the material button responsible for calculating
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  appCubit.setResult(
                      appCubit.weight / pow((appCubit.sliderValue / 100), 2));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                                value: appCubit,
                                child: BMIScreenResult(),
                              )));
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
