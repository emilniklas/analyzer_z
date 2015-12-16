import 'package:testcase/testcase.dart';
export 'package:testcase/init.dart';
import 'package:analyzer_z/analyzer_z.dart';
import 'package:analyzer_z/src/token.dart';

class TokenizerTest extends TestCase {
  Tokenizer tokenizer;

  setUp() {
    tokenizer = new TestTokenizer();
  }

  tearDown() {}

  void expectTokens(String source, List<Token> expectedTokens) {
    expect(tokenizer.tokenize(source), expectedTokens);
  }

  @test
  it_turns_a_source_string_into_a_list_of_tokens() {
    expectTokens('', [Token.eof]);
  }

  @test
  it_uses_matchers_to_tokenize_the_source() {
    expectTokens('.', [TestTokenizer.period, Token.eof]);
    expectTokens('..', [TestTokenizer.period, TestTokenizer.period, Token.eof]);
    expectTokens('.:.', [TestTokenizer.period, TestTokenizer.colon, TestTokenizer.period, Token.eof]);
  }
}

class TestTokenizer extends Tokenizer {
  static const Token period = const Token(#PERIOD);
  static const Token colon = const Token(#COLON);

  Map<String, TokenFactory> get matchers => {
    r'^\.': (Match $) => period,
    r'^:': (Match $) => colon,
  };
}