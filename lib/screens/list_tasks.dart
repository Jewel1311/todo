import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../style/colors.dart';




class ListTasks extends StatelessWidget {
  ListTasks({super.key});

  final tasks = Supabase.instance.client.from('tasks').stream(primaryKey:['id']).order('id');

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: TodoColors.primaryColor,
          title: Text("Todo App"),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addtask');
          },
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(
            Size(0, 60)
          ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            )
            ),
              backgroundColor: MaterialStatePropertyAll(
              TodoColors.primaryColor,
              )
              ),
          child:Icon(
              Icons.add,
              size: 32,
              ),
        ),
        body: StreamBuilder(
          stream: tasks, 
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              final task = snapshot.data!;
              
              return ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index){
                  return Container(
                  margin: const EdgeInsets.all(8.0), // Add some margin to create space around the list items
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // Set the background color of the Container
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 189, 189, 189),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                    child: ListTile(
                      title: Text(task[index]['task'],
                      style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle:task[index]['completed']? 
                      Text("Completed",
                      style:TextStyle(
                        color: Color.fromARGB(255, 2, 187, 14)),
                       )
                      : Text("Pending",
                      style:TextStyle(
                        color: Color.fromARGB(255, 187, 168, 2)),
                       ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () async {
                            await supabase.from('tasks').update({'completed':true}).match({'id':task[index]['id']});
                          }, 
                          icon: Icon(Icons.check)
                          ),
                          IconButton(onPressed: () async {
                            Navigator.pushNamed(context, '/edittask', arguments: {
                              'taskId' : task[index]['id'],
                              'task': task[index]['task']
                            });
                          }, icon: Icon(Icons.edit
                          
                          )),
                          IconButton(onPressed: () async {
                            await supabase.from('tasks').delete().match({'id':task[index]['id']});
                          }, icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      
                    ),
                  );
                });
            }
            return Container();
          })
      );
  }
}