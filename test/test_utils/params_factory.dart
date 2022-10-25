import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:dart_emoji/dart_emoji.dart';

const categoryId = 'ABC123';
const categoryName = 'Test Category';
final categoryEmoji = EmojiParser().get('😀');

Category get initialCategory => Category(
      name: categoryName,
      emoji: categoryEmoji,
    );

Category get category => Category(
      id: categoryId,
      name: categoryName,
      emoji: categoryEmoji,
    );

const todoId = 'TODO-456';
const todoSubject = 'Test TODO';

final now = DateTime.now();

/// Exclude microseconds because lose precision by json deserialization
final todoInitialDate = DateTime(
  now.year,
  now.month,
  now.day,
  now.hour,
  now.minute,
  now.second,
  now.millisecond,
);

final todoFinalDate = todoInitialDate.add(const Duration(days: 10));
final todoExpiredDate = todoInitialDate.add(const Duration(days: -1));
final todoTodayDate = todoInitialDate.add(const Duration(minutes: 30));

Todo get initialTodo => Todo(
      subject: todoSubject,
      finalDate: todoInitialDate,
      categoryId: categoryId,
    );

Todo get existingTodo => Todo(
      id: todoId,
      subject: todoSubject,
      finalDate: todoFinalDate,
      categoryId: categoryId,
    );

Todo get expiredTodo => Todo(
      id: todoId,
      subject: todoSubject,
      finalDate: todoExpiredDate,
      categoryId: categoryId,
    );

Todo get todayTodo => Todo(
      id: todoId,
      subject: todoSubject,
      finalDate: todoTodayDate,
      categoryId: categoryId,
    );
