import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_k/global/helpers/route_helper.dart';
import 'package:project_k/global/helpers/secure_session_helper.dart';
import 'package:project_k/modules/auth/blocs/forget_password/forget_password_bloc.dart';
import 'package:project_k/modules/auth/blocs/login/login_bloc.dart';
import 'package:project_k/modules/auth/blocs/register/register_bloc.dart';
import 'package:project_k/modules/auth/repositories/login_repository.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  // SessionHelper().init();
  SecureSessionHelper().init();
  runApp(MyApplication()); //
}

GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

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
              BlocProvider<RegisterBloc>(
                create: (context) => RegisterBloc(),
              ),
               BlocProvider<ForgetPasswordBloc>(
                create: (context) => ForgetPasswordBloc(),
              ),
            ],
            child: MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: RouteHelper.onGenerateRoute,
              // home: SplashScreen(),
            ),
          ),
        );
      },
    );
  }
}
