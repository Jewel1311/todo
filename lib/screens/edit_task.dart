import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/style/colors.dart';


class EditTask extends StatelessWidget {
  EditTask({super.key});

  final TextEditingController textFieldController = TextEditingController();
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    textFieldController.text = args['task'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: TodoColors.primaryColor,
          title: Text("Edit Task"),
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
                  await Supabase.instance.client.from('tasks').update({'task':value}).match({'id':args['taskId']});
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
                child: Text("Update Task", 
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