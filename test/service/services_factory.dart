import 'package:crud_todo_app/service/category_service.dart';
import 'package:crud_todo_app/service/todo_service.dart';
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
