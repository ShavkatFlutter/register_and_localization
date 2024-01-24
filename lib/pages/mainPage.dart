import 'package:flutter/cupertino.dart';
import 'package:localization1/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override

  bool showLoginPage =true;

  void toggleScreens (){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  Widget build(BuildContext context) {
    if(showLoginPage){
      return RegisterPage(showLoginPage: toggleScreens);
    }
    else {
      return Text("Error");
    }
  }
}
