import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_project/constant/app_constant.dart';
import 'package:simple_project/constant/routes.dart';
import 'package:simple_project/core/app/route_generator.dart';
import 'package:simple_project/core/app/theme.dart';
import 'package:simple_project/core/env/env.dart';
import 'package:simple_project/modules/main/bloc/main_cubit.dart';
import 'package:simple_project/modules/main/ui/main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (context) => MainCubit()..initCubit(),
          child: MainPage(),
        ),
        // BlocProvider<ContactCubit>(
        //   create: (context) => ContactCubit()..initCubit(),
        //   child: ContactPage(),
        // ),
        // BlocProvider<ProfileCubit>(
        //   create: (context) => ProfileCubit()..initCubit(),
        //   child: ProfilePage(),
        // ),
        // BlocProvider<AuthCubit>(
        //   create: (context) => AuthCubit()..initCubit(),
        //   child: AuthPage(),
        // ),
      ],
      child: MaterialApp(
        theme: basicTheme,
        builder: FToastBuilder(),
        navigatorKey: AppConstant.navigatorKey,
        debugShowCheckedModeBanner: Env.isDevelopment,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: Routes.landing,
      ),
    );
  }
}
