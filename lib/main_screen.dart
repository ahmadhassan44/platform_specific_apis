import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_specific_apis/main_cubit.dart';
import 'package:platform_specific_apis/main_states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (BuildContext context, state) {
        if (state is UnknownBatteryLevel) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Battery Level: Unknown'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get Battery Level'),
                  ),
                ],
              ),
            ),
          );
        } else if (state is LoadingBatteryLevel) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get Battery Level'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return  Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Battery Level: ${(state as LoadedBatteryLevel).batteryLevel}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MainCubit>().getBatteryLevel();
                    },
                    child: const Text('Get Battery Level'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
