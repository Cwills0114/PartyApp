import 'package:flutter/material.dart';

void createEventForm(BuildContext context) {
  Dialog simpleDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
        height: 600.0,
        width: 300.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 24, 10, 12),
              child: Center(
                  child: Text(
                "Create an Event",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Divider(
              color: Colors.black,
              indent: 15,
              endIndent: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
              child: Container(
                width: 250,
                height: 35,
                child: Theme(
                  data: new ThemeData(
                    hintColor: Colors.grey,
                    primaryColor: Color.fromRGBO(250, 205, 96, 100),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      hintText: "Title",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(12.5),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Container(
                width: 250,
                height: 80,
                child: Theme(
                  data: new ThemeData(
                    hintColor: Colors.grey,
                    primaryColor: Color.fromRGBO(250, 205, 96, 100),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: TextStyle(fontSize: 12.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      hintText: "Description",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(12.5),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Container(
                width: 250,
                height: 35,
                child: Theme(
                  data: new ThemeData(
                    hintColor: Colors.grey,
                    primaryColor: Color.fromRGBO(250, 205, 96, 100),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 12.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      hintText: "Address",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(12.5),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            child: ButtonTheme(
                              buttonColor: Color.fromRGBO(250, 205, 96, 100),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(18.0)),
                              child: RaisedButton(
                                child: Center(
                                  child: Text("Create Account",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600)),
                                ),
                                // onPressed: () async {
                                //   var createAccountBool = await createAccount(userController.text, emailController.text.trim(), passwordController.text, context);
                                //   if(createAccountBool  == true){
                                //     Navigator.push(
                                //       context, MaterialPageRoute(builder: (context) => homePageLayout()),
                                //       );
                                //   }
                                // },
                                onPressed: (){
                                  print("Button Works");
                                },
                              ),
                            )),
          ],
        )),
  );
  showDialog(context: context, builder: (BuildContext context) => simpleDialog);
}

/* 
Title
Description
Address
Start Time
Date

UserToken
Email
*/
