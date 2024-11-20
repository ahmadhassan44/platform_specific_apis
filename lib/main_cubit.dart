
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_states.dart';

class MainCubit extends Cubit<MainScreenState> {
  MainCubit() : super(UnknownBatteryLevel());

  void onGetBatteryLevel() {
    emit(LoadingBatteryLevel());
  }
  void onBatteryLevelLoaded(String batteryLevel) {
    emit(LoadedBatteryLevel(batteryLevel));
  }
  void getBatteryLevel() async {
    emit(LoadingBatteryLevel());
    const platform = MethodChannel('samples.flutter.dev/battery');
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    emit(LoadedBatteryLevel(batteryLevel));
  }

}