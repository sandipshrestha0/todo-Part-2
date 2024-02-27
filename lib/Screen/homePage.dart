import 'package:flutter/material.dart';


import 'package:todol_part2/Constant/colors.dart';

import '../Widget/todo_items.dart';
import '../model/todo.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final todosList = ToDo.todoList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBFColor,
              size: 30,
            ),
            Center(
              child: Text("Todo"),
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    'https://www.adobe.com/express/feature/image/media_16ad2258cac6171d66942b13b8cd4839f0b6be6f3.png?width=750&format=png&optimize=medium'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Text(
                      "All ToDo...",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ToDo todoo in todosList)
                    TodoItems(
                      todo: todoo,
                    ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}


Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 234, 230, 230),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: tdGray),
      ),
    ),
  );
}