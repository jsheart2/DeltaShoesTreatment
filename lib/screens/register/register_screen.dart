import 'package:dst/screens/register/register_form.dart';
import 'package:dst/widgets/curved_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 50),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue, Colors.blue.withOpacity(0.4)],
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xff6a515e),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 250),
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
