import 'package:testcase/testcase.dart';
export 'package:testcase/init.dart';
import 'package:analyzer_z/ast.dart';
import 'package:analyzer_z/tokens.dart' as tokens;
import 'package:analyzer_z/src/token.dart';

class TokenizerTest extends TestCase {
  setUp() {}

  tearDown() {}

  void expectParses(List<Token> tokens, Matcher matcher) {
    final node = new Parser(tokens..add(Token.eof)).parse();
    expect(node, matcher);
  }

  @test
  it_turns_a_list_of_tokens_into_a_root_node() {
    expectParses([
      tokens.varKeyword,
      tokens.whitespace,
      const tokens.Symbol('x'),
      tokens.whitespace,
      tokens.equals,
      tokens.whitespace,
      const tokens.Number(3),
    ], equals(
        const RootNode(const NodeList<TopLevelDeclaration>(const <TopLevelDeclaration>[
          const TopLevelVarDeclaration(
              type: const UndeclaredType(),
              name: const Identifier('x'),
              value: const Expression(const NodeList<ExpressionLevelDeclaration>(const <ExpressionLevelDeclaration>[
                const NumberLiteral(3)
              ]))
          )
        ])))
    );
  }
}
