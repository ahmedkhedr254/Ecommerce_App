import 'package:flutter/material.dart';

class search extends SearchDelegate {
  List x=['a','b','c'];
  List y=['a'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest=query.isEmpty?y:x;
    return ListView.builder(itemBuilder: (context,index){
      return  FlatButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(suggest[index]),

        ),
      );
    },itemCount: suggest.length,);
  }
}
