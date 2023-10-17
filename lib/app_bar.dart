import 'package:flutter/material.dart';
import 'package:todo/style/colors.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TodoAppBar({super.key});


  // this code is used only if we are passing title from the custom appbar

  // final String title;

  // TodoAppBar({super.key, 
  //   required this.title
  // });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: TodoColors.primaryColor,
          title: Text("Todo App"),
          leading: IconButton(onPressed: (){
            // Navigator().pop();
          }, 
          icon: Icon(Icons.arrow_left)
          ),
        );
  }
}