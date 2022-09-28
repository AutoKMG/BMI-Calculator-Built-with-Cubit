import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool isMaleSelected = true;
  double sliderValue = 175.0;
  int age = 19;
  int weight = 52;
  late double result;

  static AppCubit get(context) => BlocProvider.of(context);

  void selectMale() {
    isMaleSelected = true;
    emit(AppChangingToMale());
  }

  void selectFemale() {
    isMaleSelected = false;
    emit(AppChangingToFemale());
  }

  void toggleSlider(double value) {
    sliderValue = value;
    emit(AppTogglingSliderValue());
  }

  void minusAge() {
    age--;
    emit(AppMinusAge());
  }

  void plusAge() {
    age++;
    emit(AppPlusAge());
  }

  void minusWeight() {
    weight--;
    emit(AppMinusWeight());
  }

  void plusWeight() {
    weight++;
    emit(AppPlusWeight());
  }

  void setResult(double result) {
    this.result = result;
    emit(AppSettingResult());
  }
}
