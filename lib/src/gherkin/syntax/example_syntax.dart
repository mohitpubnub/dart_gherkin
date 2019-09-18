import '../runnables/example.dart';
import '../runnables/debug_information.dart';
import '../runnables/runnable.dart';
import './regex_matched_syntax.dart';
import './syntax_matcher.dart';
import './table_line_syntax.dart';

class ExampleSyntax extends RegExMatchedGherkinSyntax {
  @override
  final RegExp pattern = RegExp(r"^\s*Example[s]?:(\s*(.+)\s*)?$",
      multiLine: false, caseSensitive: false);

  @override
  bool get isBlockSyntax => true;

  @override
  bool hasBlockEnded(SyntaxMatcher syntax) => !(syntax is TableLineSyntax);

  @override
  Runnable toRunnable(String line, RunnableDebugInformation debug) {
    final name = (pattern.firstMatch(line).group(1) ?? "").trim();
    final runnable = ExampleRunnable(name, debug);

    return runnable;
  }
}