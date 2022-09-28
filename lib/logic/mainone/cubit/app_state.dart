part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppChangingToMale extends AppState {}

class AppChangingToFemale extends AppState {}

class AppTogglingSliderValue extends AppState {}

class AppMinusAge extends AppState {}

class AppPlusAge extends AppState {}

class AppMinusWeight extends AppState {}

class AppPlusWeight extends AppState {}

class AppSettingResult extends AppState {}
