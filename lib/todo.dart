import 'package:bloc_project/models/todo_cubit.dart';
import 'package:bloc_project/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 1, child: TextField(controller: todoController)),
                InkWell(
                  child: Icon(Icons.add_circle_outline_rounded),
                  onTap: () {
                    context.read<TodoCubit>().addNewTodo(todoController.text, DateTime.now());
                  },
                ),
                
              ],
            ),
            Expanded(
              flex: 1,
              child: BlocBuilder<TodoCubit, List<TodoModel>>(
                builder: (context, state) {
                  return TodoList(
                    todos: state,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget{
  List<TodoModel> todos;
  TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              child: Text('${todos[index].todo}'),
            ),
            InkWell(
                  child: Icon(Icons.close,
                  color: Colors.red,
                  ),
                  onTap: (){
                    context.read<TodoCubit>().removeTodo(index);
                  },
                )
          ],
        );
      },
    );
  }

}