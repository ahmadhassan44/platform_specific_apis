abstract class MainScreenState {}

class UnknownBatteryLevel extends MainScreenState {}

class LoadingBatteryLevel extends MainScreenState {}

class LoadedBatteryLevel extends MainScreenState {
  final String batteryLevel;

  LoadedBatteryLevel(this.batteryLevel);
}
