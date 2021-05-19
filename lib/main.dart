import 'package:dst/blocs/authentication_blocs/authentication_bloc.dart';
import 'package:dst/blocs/authentication_blocs/authentication_state.dart';
import 'package:dst/blocs/simple_bloc_observer.dart';
import 'package:dst/screens/home_screen.dart';
import 'package:dst/screens/login/login_screen.dart';
import 'package:dst/screens/repositories/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MyApp(userRepository: userRepository,),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
    builder: (context, snapshot) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delta Shoes Treatment',
      theme: ThemeData(
        primaryColor: Color(0xff6a515e),
        cursorColor: Color(0xff6a515e),
      ),
      home: BlocBuilder(builder: (context, state) {
        if (state is AuthenticationFailure) {
          return LoginScreen();
        }
        if (state is AuthenticationSuccess){
          return HomeScreen(
          );
        }

        return Scaffold(
          appBar: AppBar(),
          body: Container(
              child: Center(child: Text("Loading")),
          ),
        );
      },
      ),
    );
  });
  }
}