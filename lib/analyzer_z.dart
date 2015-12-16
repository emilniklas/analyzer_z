library analyzer_z;

import 'tokens.dart' as tokens;
import 'src/token.dart';
import 'ast.dart';

part 'src/dart_z_tokenizer.dart';
part 'src/tokenizer.dart';

RootNode parseToAst(String source) {
  final tokenizer = new DartZTokenizer();
  final tokens = tokenizer.tokenize(source);
  return new Parser(tokens).parse();
}
