import 'package:flutter/material.dart';
import 'package:prov/Screen/HomeScreen.dart';
import 'package:prov/services/auth_service.dart';
import 'package:prov/views/first_view.dart';
import 'package:prov/views/home_view.dart';
import 'package:prov/views/sign_up_view.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(FireBaseApp());
}

class FireBaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "FireBaseApp",
        theme: ThemeData(
          fontFamily: 'CaviarDreams',
            primarySwatch: Colors.cyan,
            canvasColor: Colors.cyan[50]
        ),
        debugShowCheckedModeBanner: false,
        home: HomeController(),

        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
        },

      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeView() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
class Provider extends InheritedWidget {
  final AuthService auth;
  Provider({Key key, Widget child, this.auth}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  static Provider of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(Provider) as Provider);
}