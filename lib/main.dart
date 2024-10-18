import 'package:flutter/material.dart';
import 'package:p1_flutter_2/model/order_model.dart';
import 'package:p1_flutter_2/view/esqueceuSenha_screen.dart';
import 'package:p1_flutter_2/view/login_screen.dart';
import 'package:p1_flutter_2/view/menu_screen.dart';
import 'package:p1_flutter_2/view/register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderModel(),
      child: MaterialApp(
        title: 'Restaurante',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.redAccent,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.grey[400]),
            headline1: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            headline2: TextStyle(color: Colors.red, fontSize: 20),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.red),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/menu': (context) => MenuScreen(),
          '/forgot_password': (context) => ForgotPasswordScreen(),
        },
      ),
    );
  }
}
