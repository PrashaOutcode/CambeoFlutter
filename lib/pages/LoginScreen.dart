import 'package:flutter/material.dart';
import 'package:world_time/request/LoginRequest.dart';
import 'package:world_time/response/LoginResponse.dart';
import 'package:world_time/services/LoginService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _passwordVisible = false;
  Future<LoginResponse> loginResponse;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                "MEDDU",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 60,
              ),
              Card(
                color: Colors.grey[800],
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style:
                        TextStyle(color: Colors.blueAccent, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      formWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget formWidget() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print("forget passwprd clicked");
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: "Email",
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          hintText: "Email Address"),
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String value) {
        this.email = value;
      },
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "password",
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme
                  .of(context)
                  .primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
        ),
        validator: validateEmail,
        onSaved: (String value) {
          this.password = value;
        },
      ),
    );
  }

  Widget submitButton() {
    return TextButton(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
          child: Text('Login',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          loginResponse = login(LoginRequest(email: email, password: password));
          setState(() {
            apiCall();
          });
        }
      },
    );
  }

  Widget apiCall() {
    return Container(
      child: FutureBuilder<LoginResponse>(
        future: loginResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return SpinKitCircle(
            color: Colors.red,
            size: 50.0,
          );
        },
      ),
    );
  }

  String validateEmail(String value) {
    if (!value.trim().contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value
        .trim()
        .length < 6) {
      return 'Password must me at least 6 characters';
    }

    return null;
  }
}
