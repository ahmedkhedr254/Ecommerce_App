import 'package:ecommerce/UI/pages/MyDrawer.dart';
import 'package:ecommerce/UI/utilities/search.dart';
import 'package:ecommerce/UI/utilities/homePageUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(child: CircularProgressIndicator())
    );
  }

}

