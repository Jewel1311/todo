import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/style/colors.dart';


class AddTask extends StatelessWidget {
  AddTask({super.key});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TodoColors.primaryColor,
          title: Text("Add Task"),
        ),
        body:Container(
          margin: EdgeInsets.fromLTRB(0,8,0,0),
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: textFieldController,
                decoration:InputDecoration(
                  labelText: "Task",
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                    ) 
                ),
              ),
              Container(
                margin:EdgeInsets.fromLTRB(0,8,0,0),
                child:ElevatedButton(  
                onPressed: () async {
                  String value = textFieldController.text;
                  await Supabase.instance.client.from('tasks').insert({'task':value});
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(TodoColors.primaryColor),
                  minimumSize:MaterialStatePropertyAll(
                    Size(double.infinity,50),
                    
                  ),
                shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                      )
                      )
                ),
                child: Text("Add Task", 
                 style: TextStyle( fontSize:18,)
                )
                ),
              )
            ],
          ),
        ),
      );
  }
}