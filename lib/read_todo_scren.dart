import 'package:flutter/material.dart';
import 'package:sqlite_database/todo.dart';
import 'database_helper.dart';
import 'detailed_screen.dart';

class ReadTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Todos'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: DatabaseHelper().retrieveTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.blue.shade50,
                    title: Text(snapshot.data![index].title!),
                    subtitle: Text(snapshot.data![index].content!),
                    trailing: InkWell(onTap: (){
                      _deleteTodo(Todo(id: snapshot.data![index].id));
                    },child: Icon(Icons.delete,color: Colors.red,)),
                    onTap: () {
                      _navigateToDetail(
                        context,
                        Todo(
                            content: snapshot.data![index].content,
                            title: snapshot.data![index].title),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Oops!");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

_deleteTodo(Todo todo) {
  DatabaseHelper.instance.deleteTodo(todo.id!);
}

_navigateToDetail(BuildContext context, Todo todo) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailTodoScreen(todo: todo)),
  );
}
