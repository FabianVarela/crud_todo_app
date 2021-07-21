import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigator extends Mock implements NavigatorObserver {}

class MyRouteFake extends Fake implements Route<dynamic> {}

const categoryId = 'ABC123';
const categoryName = 'Test Category';
final categoryEmoji = EmojiParser().get('😀');

Category get category => Category(
      id: categoryId,
      name: categoryName,
      emoji: categoryEmoji,
      todoSize: 0,
    );

const todoId = 'TODO-456';
const todoSubject = 'Test TODO';
final todoFinalDate = DateTime.now().add(const Duration(days: 10));

Todo get todo => Todo(
      categoryId: categoryId,
      id: todoId,
      finalDate: todoFinalDate,
      subject: todoSubject,
      isCompleted: false,
    );
