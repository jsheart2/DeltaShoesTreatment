import 'package:dst/screens/register/register_screen.dart';
import 'package:dst/screens/repositories/user_repository.dart';
import 'package:dst/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  const LoginForm({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration:
                  InputDecoration(icon: Icon(Icons.email), labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: "Password"),
              autovalidate: true,
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            GradientButton(
              width: 150,
              height: 45,
              onPressd: () {},
              text: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GradientButton(
              width: 150,
              height: 45,
              onPressd: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return RegisterScreen();
                }));
              },
              text: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
