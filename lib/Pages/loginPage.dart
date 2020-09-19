import 'package:flutter/material.dart';
import 'package:login/Pages/signupPage.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:login/Pages/homePageLayout.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Container(
                  height: 440,
                  width: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/Login_Background.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(40, 0, 0, 0),
                        offset: Offset(0, 2.0),
                        blurRadius: 15.0,
                      )
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text("Welcome",
                            style: _themeData.textTheme
                                .headline5), //TODO: Change / Does not use theme file
                        SizedBox(height: 20),
                        Container(
                            width: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(40, 0, 0, 0),
                                  offset: Offset(0, 2.0),
                                  blurRadius: 3.0,
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Username or Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: PasswordField(
                                    controller: passwordController,
                                    color: Colors.grey,
                                    hasFloatingPlaceholder: true,
                                    errorMessage:
                                        'must contain special character either . * @ # \$',
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 25,
                        ),

                        Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: ButtonTheme(
                              buttonColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(18.0)),
                              child: RaisedButton(
                                child: Center(
                                  child: Text("Login",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600)),
                                ),
                                onPressed: () {
                                  // var loginBool = await loginAccount(emailController.text.trim(), passwordController.text, context);
                                  // if(loginBool  == true){
                                  //   Navigator.push(
                                  //     context, MaterialPageRoute(builder: (context) => homePageLayout()),
                                  //     );
                                  // }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageLayout()),
                                  );
                                },
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Forgot Password");
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Register"); // Link to Register page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          child: Text(
                            "Create An Account",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ]))),
            ],
          ),
        ),
      ),
    );
  }
}
