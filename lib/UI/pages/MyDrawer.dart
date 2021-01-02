import 'package:ecommerce/UI/pages/Login.dart';
import 'package:ecommerce/bloc/auth/logout/logout_bloc.dart';
import 'package:ecommerce/bloc/laptop/laptop_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_event.dart';
import 'package:ecommerce/bloc/tablet/tablet_bloc.dart';
import 'package:ecommerce/bloc/tablet/tablet_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading.dart';

class MyDrawer extends StatelessWidget {
  BuildContext  myContext;
  MyDrawer(this.myContext);
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is Loggingout) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Loading()),
          );
        } else if (state is Logedout) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context,"login");
        } else if (state is LoggingoutError) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(content: Text("something went wrong"),);
              });
        }
      },
      child: Container(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
               Image.asset('images/img.png'),
              SizedBox(height: MediaQuery.of(context).size.height*5/100,),
              Row(children: [
                Icon(Icons.event_note_sharp),
                SizedBox(width: 5,),
                Text("Sales",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],),
              SizedBox(height: MediaQuery.of(context).size.height*1/100,),
              Container(width: MediaQuery.of(context).size.width,height: 2,color: Colors.black54,),
              ListTile(

                title: Text('View My Orders'),
                onTap: () {}
              ),
              Container(width: MediaQuery.of(context).size.width,height: 2,color: Colors.black54,),

              SizedBox(height: MediaQuery.of(context).size.height*5/100,),
              Row(children: [
                Icon(Icons.category),
                SizedBox(width: 5,),
                Text("categories",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

              ],),
              SizedBox(height: MediaQuery.of(context).size.height*1/100,),
              Container(width: MediaQuery.of(context).size.width,height: 2,color: Colors.black54,),
              ListTile(

                title: Text('Mobiles'),
                onTap: () {
                 BlocProvider.of<MobileBloc>(context).add(GetAllMobiles());
                 Navigator.pushNamed(context,'allmobiles');
                },
              ),

              Container(width: MediaQuery.of(context).size.width,height: 2,color: Colors.black54,),
              ListTile(
                title: Text('Tablets'),
                onTap: () {
                  BlocProvider.of<TabletBloc>(context).add(GetAllTablets());
                  Navigator.pushNamed(context,'alltablets');
                },
              ),
              Container(width: MediaQuery.of(context).size.width,height: 2,color: Colors.black54,),
              ListTile(
                title: Text('Laptops'),
                onTap: () {
                  BlocProvider.of<LaptopBloc>(context).add(GetAllLaptops());
                  Navigator.pushNamed(context,'alllaptops');
                },
              ),
              Container(width: MediaQuery.of(context).size.width,height: 2,color: Colors.black54,),

                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      BlocProvider.of<LogoutBloc>(context).add(logout());
                    },
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
