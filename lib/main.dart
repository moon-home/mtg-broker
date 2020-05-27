import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/bloc/TickerProvider.dart';
import 'package:test2/screens/authCheck_wrapper.dart';
import 'package:test2/screens/login_screen.dart';
import 'package:test2/screens/search_screen.dart';
import 'package:test2/screens/welcome_screen.dart';
import 'package:test2/services/Database.dart';
import 'screens/setting_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'bloc/TickerProvider.dart';
import 'screens/bottomNavigation_screen.dart';
import 'services/Auth.dart';
import 'models/User.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      //create: (context)=> TickersProvider(),
      providers: [
        ChangeNotifierProvider<TickersProvider>.value(value: TickersProvider(),),
        ChangeNotifierProvider<DatabaseService>.value(value: DatabaseService(),),
        StreamProvider<User>.value(value: AuthService().user),
        StreamProvider<QuerySnapshot>.value(value: DatabaseService().allUserInvest),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MTG Broker',
        theme: ThemeData(
          primaryColor: Color(0xFF5A104E),
          accentColor: Color(0xFFEEE7ED),
          primarySwatch: Colors.grey,
          buttonTheme: ButtonThemeData(buttonColor: Color(0xFF5A104E),)
        ),
        home: WelcomeScreen(),
        routes: {
          //AuthCheckWrapper.id: (context)=>AuthCheckWrapper(),
          BottomNavigationScreen.id: (context)=>BottomNavigationScreen(),
          PortfolioScreen.id: (context)=>PortfolioScreen(),
          SearchScreen.id: (context)=>SearchScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SettingScreen.id: (context) => SettingScreen(),
        },
      ),
    );
  }
}