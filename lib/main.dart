import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_project/component/bloc/base_cubit_delegate.dart';
import 'package:simple_project/core/app/app.dart';
import 'package:simple_project/core/app/palette.dart';
import 'package:simple_project/core/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BaseCubitDelegate();
  Env.envValue = EnvValue.DEVELOPMENT;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Palette.black,
    systemNavigationBarColor: Palette.black,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async => runApp(App()));
}
