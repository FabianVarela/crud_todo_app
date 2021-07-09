import 'package:crud_todo_app/repository/category_service.dart';
import 'package:crud_todo_app/repository/todo_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [TodoService, CategoryService],
  customMocks: [
    MockSpec<DateTime>(
      as: #ArgelDateTimeMock,
      returnNullOnMissingStub: true,
    ),
  ],
)
void main() {}
