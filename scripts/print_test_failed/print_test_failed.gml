function print_test_failed(_message,
                           _long_message,
                           _script,
                           _line,
                           _stacktrace) {
  show_error(string([_message, _long_message, _script, _line, _stacktrace]), true);
}