import 'package:dating_app/widgets/bottombar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

actions(BuildContext context,String name,type){
  showDialog(context: context, builder: (context){
    Future.delayed(Duration(seconds: 1),(){
      Navigator.of(context).pop(true);
    });

    return AlertDialog(
      content: buttonWidget(type=='liked'?
          Icons.favorite: type=='rejected'? Icons.
          close:Icons.star,
          type=='liked'
              ? Colors.pink
              : type=='rejected'
              ? Colors.red
              : Colors.blue
      ),

      title: Text('You ${type} ${name} ',
        style: TextStyle(
          color:type=='liked'
              ? Colors.pink
          : type=='rejected'
              ? Colors.red
        : Colors.blue
        ),
        ),
          );
  });
}