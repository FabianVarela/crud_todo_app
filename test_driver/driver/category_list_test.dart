import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:flutter_driver/flutter_driver.dart' as test_driver;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$CategoryListView test', () {
    late test_driver.FlutterDriver driver;

    setUpAll(() async {
      driver = await test_driver.FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('Verify empty list message', () async {
      final emptyMessage = test_driver.find.text('Empty data, add a category');
      await driver.waitFor(emptyMessage);
    });
  });
}
