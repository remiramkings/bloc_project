import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);
  addNewTodo(String todo, DateTime datetime){
    state.add(TodoModel(todo: todo, dateTime: datetime));
    emit(List.from(state));
  }

  removeTodo(int index){
    state.removeAt(index);
    emit(List.from(state));
  }
}