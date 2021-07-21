import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

/// Routes

class MockNavigator extends Mock implements NavigatorObserver {}

class MyRouteFake extends Fake implements Route<dynamic> {}

/// ViewModels

class MockCategoryViewModel extends Mock implements ICategoryViewModel {}
