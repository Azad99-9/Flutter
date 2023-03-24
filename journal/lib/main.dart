import 'package:flutter/material.dart';
import 'package:journal/pages/home.dart';
import 'package:journal/blocs/authentication_bloc.dart';
import 'package:journal/blocs/authentication_bloc_provider.dart';
import 'package:journal/blocs/home_bloc.dart';
import 'package:journal/blocs/home_bloc_provider.dart';
import 'package:journal/services/authentication.dart';
import 'package:journal/services/db_firestore.dart';
import 'package:journal/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthenticationService? _authenticationService =
        AuthenticationService();
    final AuthenticationBloc? _authenticationBloc =
        AuthenticationBloc(_authenticationService!);
    return AuthenticationBlocProvider(
        child: StreamBuilder(
          initialData: null,
          stream: _authenticationBloc?.user,
          builder: (context, snapshot) {
            print(AuthenticationBlocProvider.of(context));
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.lightGreen,
                  child: CircularProgressIndicator(),
                ),
              );
            else if (snapshot.hasData) {
              return HomeBlocProvider(
                child: _buildMaterialApp(
                  MyHomePage(),
                ),
                uid: snapshot.data,
                homeBloc:
                    HomeBloc(DbFireStoreService(), _authenticationService),
              );
            } else {
              return _buildMaterialApp(Login());
            }
          },
        ),
        authenticationBloc: _authenticationBloc!);
  }

  MaterialApp _buildMaterialApp(Widget homePage) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.lightGreen,
          canvasColor: Colors.lightGreen.shade50,
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.lightGreen)),
      home: homePage,
    );
  }
}
