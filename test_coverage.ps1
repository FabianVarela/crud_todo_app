flutter test --concurrency 4 --coverage --test-randomize-ordering-seed random
dart run remove_from_coverage -f coverage/lcov.info -r '\.g\.dart$'
dart run remove_from_coverage -f coverage/lcov.info -r '\.freezed\.dart$'
perl C:\ProgramData\chocolatey\lib\lcov\tools\bin\genhtml -o coverage\html coverage\lcov.info
coverage/html/index.html