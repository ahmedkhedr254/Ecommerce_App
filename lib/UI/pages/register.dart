import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ecommerce/UI/utilities/constants.dart';
import 'package:ecommerce/UI/utilities/search.dart';
import 'package:ecommerce/bloc/auth/register/register_bloc.dart';
import 'package:ecommerce/bloc/laptop/laptop_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_event.dart';
import 'package:ecommerce/bloc/tablet/tablet_bloc.dart';
import 'package:ecommerce/bloc/tablet/tablet_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'loading.dart';

class Register extends StatelessWidget {
  final BirthdayController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final HomeIdController = TextEditingController();

  _buildDateTF() {
    final format = DateFormat("yyyy-MM-dd");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Birthday',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: DateTimeField(
            format: format,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              hintText: 'Enter your Publishing Date',
              hintStyle: kHintTextStyle,
            ),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime.now());
            },
            controller: BirthdayController,
          ),
        ),
      ],
    );
  }

  Widget _signupBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          BlocProvider.of<RegisterBloc>(context).add(RegisterEvent( nameController.value.text,
              emailController.value.text,
              passwordController.value.text,
              phoneController.value.text,
              countryController.value.text,
              cityController.value.text,
              streetController.value.text,
              HomeIdController.value.text,
              BirthdayController.value.text));

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
    return Scaffold(body: BlocListener<RegisterBloc,RegisterState>(
      listener: (context,state){
        if (state is Registering) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Loading()),
          );
        } else if (state is Registed) {
          BlocProvider.of<LaptopBloc>(context).add(GetLastLaptops());
          BlocProvider.of<MobileBloc>(context).add(GetLastMobiles());
          BlocProvider.of<TabletBloc>(context).add(GetLastTablets());
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, "home");
        } else if (state is RegisteringError) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("something went wrong"),
                );
              });
        }
        else if (state is UserExist){
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("usert already exist"),
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
                          'name',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: nameController,
                            decoration: InputDecoration(
                                hintStyle: kHintTextStyle,
                                hintText: 'enter your name',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                )),
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
                            controller: emailController,
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
                            controller: passwordController,
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
                        Text(
                          'phone',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: phoneController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter your phone',
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
                        Text(
                          'country',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: countryController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter your country',
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
                        Text(
                          'city',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: cityController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter your city',
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
                        Text(
                          'street',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: streetController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter your street',
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
                        Text(
                          'home Number',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: height * 2 / 100,
                        ),
                        Container(
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: HomeIdController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter your home Number',
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

                        _buildDateTF(),
                        _signupBtn(context),

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
