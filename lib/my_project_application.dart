import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_k/global/helpers/route_helper_for_project.dart';
import 'package:project_k/main.dart';
import 'package:project_k/modules/myproject/auth/blocs/forget_password/forget_password_bloc.dart';
import 'package:project_k/modules/myproject/auth/blocs/login/login_bloc.dart';
import 'package:project_k/modules/myproject/auth/blocs/register/register_bloc.dart';
import 'package:project_k/modules/myproject/auth/repositories/login_repository.dart';
import 'package:project_k/modules/myproject/customers/bloc/customer_bloc.dart';

class MyProjectApplication extends StatelessWidget {
  const MyProjectApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<LoginRepository>(
              create: (context) => LoginRepository(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(repository: LoginRepository()),
              ),
              BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
               BlocProvider<CustomerBloc>(create: (context) => CustomerBloc()),
              BlocProvider<ForgetPasswordBloc>(
                create: (context) => ForgetPasswordBloc(),
              ),
            ],
            child: MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: RouteHelperForProject.onGenerateRoute,
              
            ),
          ),
        );
      },
    );
  }
}
