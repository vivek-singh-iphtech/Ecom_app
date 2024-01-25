import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({ Key? key }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Container(
        height: 40.0,
        width: 80.0,

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 229, 229),

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('category 1')
        ],)
       ),

        SizedBox(width: 15.0),

          Container(
        height: 40.0,
        width: 80.0,

         decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 229, 229),

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('category 2')
        ],)
       ),

       SizedBox(width: 15.0),

          Container(
        height: 40.0,
        width: 80.0,

         decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 229, 229),

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('category 3')
        ],)
       ),

       SizedBox(width: 15.0),

          Container(
        height: 40.0,
        width: 80.0,

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 229, 229),

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('category 4')
        ],)
       )
      ]),
    );
  }
}