flutter test --coverage
dart run remove_from_coverage -f coverage/lcov.info -r '\.g\.dart$'
dart run remove_from_coverage -f coverage/lcov.info -r '\.freezed\.dart$'
genhtml coverage/lcov.info -o coverage/html -q
open coverage/html/index.html