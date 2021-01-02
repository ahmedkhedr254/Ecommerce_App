import 'package:ecommerce/UI/pages/homePage.dart';
import 'package:ecommerce/UI/utilities/constants.dart';
import 'package:ecommerce/bloc/auth/login/login_bloc.dart';
import 'package:ecommerce/bloc/laptop/laptop_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_event.dart';
import 'package:ecommerce/bloc/tablet/tablet_bloc.dart';
import 'package:ecommerce/bloc/tablet/tablet_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _LoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print("fefefe");
          BlocProvider.of<LoginBloc>(context).add(
              login(emailController.value.text, passwordController.value.text));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is Loggingin) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Loading()),
          );
        } else if (state is Logedin) {
          BlocProvider.of<LaptopBloc>(context).add(GetLastLaptops());
          BlocProvider.of<MobileBloc>(context).add(GetLastMobiles());
          BlocProvider.of<TabletBloc>(context).add(GetLastTablets());
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, "home");
        } else if (state is LogginginError) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("something went wrong"),
                );
              });
        }
      },
      child: LayoutBuilder(
        builder: (context, conistrain) {
          double height = conistrain.maxHeight;
          double width = conistrain.maxWidth;
          return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              )),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 10 / 100,
                ),
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 10 / 100,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        Text(
                          'Email',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: this.emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintStyle: kHintTextStyle,
                                hintText: 'enter your email',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: height * 6 / 100,
                        ),
                        Text(
                          'password',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: this.passwordController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: kHintTextStyle,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        _LoginBtn(context),
                        Container(
                          child: FlatButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, "register");
                            },
                            child: Text(
                              'create new account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          alignment: Alignment.center,
                        )
                      ],
                    )),
              ));
        },
      ),
    ));
  }
}

/*
Scaffold(
          appBar: AppBar(title: Text('ecommerce'),),
          body: BlocBuilder<MobileBloc,MobileState>(
            builder: (context,state){
              if(state is MobileLoading){
                return CircularProgressIndicator();
              }
              else if (state is MobileLoaded){
                return Center(
                  child: ListView(
                    children: state.mobiles.map((e) => Text(e.name.toString())).toList(),
                  ),
                );
              }
              else{
                return Center(child:CircularProgressIndicator());
              }
            },
          ),
        ) ,
 */
