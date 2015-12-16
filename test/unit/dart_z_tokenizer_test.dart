import 'package:testcase/testcase.dart';
export 'package:testcase/init.dart';
import 'package:analyzer_z/analyzer_z.dart';
import 'package:analyzer_z/src/token.dart';
import 'package:analyzer_z/tokens.dart' as tokens;

class DartZTokenizerTest extends TestCase {
  Tokenizer tokenizer;

  setUp() {
    tokenizer = new DartZTokenizer();
  }

  tearDown() {}

  void expectTokens(String source, List<Token> expectedTokens) {
    expect(tokenizer.tokenize(source), expectedTokens..add(Token.eof));
  }

  @test
  all_tokens() {
    expectTokens(' ', [tokens.whitespace]);
    expectTokens('\n', [tokens.lineBreak]);
    expectTokens('\r\n', [tokens.lineBreak]);
    expectTokens(';', [tokens.semicolon]);
    expectTokens('.', [tokens.period]);
    expectTokens(',', [tokens.comma]);
    expectTokens(':', [tokens.colon]);
    expectTokens('=', [tokens.equals]);
    expectTokens('+', [tokens.plus]);
    expectTokens('-', [tokens.dash]);
    expectTokens('"', [tokens.doubleQuote]);
    expectTokens("'", [tokens.singleQuote]);
    expectTokens('{', [tokens.openCurlyBrace]);
    expectTokens('}', [tokens.closeCurlyBrace]);
    expectTokens('(', [tokens.openParenthesis]);
    expectTokens(')', [tokens.closeParenthesis]);
    expectTokens('[', [tokens.openBracket]);
    expectTokens(']', [tokens.closeBracket]);
    expectTokens('<', [tokens.openAngleBracket]);
    expectTokens('>', [tokens.closeAngleBracket]);
    expectTokens('#', [tokens.hash]);
    expectTokens('!', [tokens.bang]);
    expectTokens('?', [tokens.questionMark]);
    expectTokens('/', [tokens.slash]);
    expectTokens('\\', [tokens.backslash]);
    expectTokens('&', [tokens.ampersand]);
    expectTokens('|', [tokens.pipe]);
    expectTokens('~', [tokens.tilde]);
    expectTokens('%', [tokens.percentSign]);

    expectTokens("'s'", [const tokens.StringToken(value: 's', isUsingSingleQuotes: true, isRaw: false, isMultiline: false)]);
    expectTokens('"s"', [const tokens.StringToken(value: 's', isUsingSingleQuotes: false, isRaw: false, isMultiline: false)]);
    expectTokens("r's'", [const tokens.StringToken(value: 's', isUsingSingleQuotes: true, isRaw: true, isMultiline: false)]);
    expectTokens('r"s"', [const tokens.StringToken(value: 's', isUsingSingleQuotes: false, isRaw: true, isMultiline: false)]);
    expectTokens("'''s'''", [const tokens.StringToken(value: 's', isUsingSingleQuotes: true, isRaw: false, isMultiline: true)]);
    expectTokens('"""s"""', [const tokens.StringToken(value: 's', isUsingSingleQuotes: false, isRaw: false, isMultiline: true)]);
    expectTokens("r'''s'''", [const tokens.StringToken(value: 's', isUsingSingleQuotes: true, isRaw: true, isMultiline: true)]);
    expectTokens('r"""s"""', [const tokens.StringToken(value: 's', isUsingSingleQuotes: false, isRaw: true, isMultiline: true)]);

    expectTokens('//c', [const tokens.LineComment('c')]);
    expectTokens('///c', [const tokens.DocComment('c')]);
    expectTokens('/*c*/', [const tokens.MultilineComment('c')]);

    expectTokens('1', [const tokens.Number(1)]);
    expectTokens('1.3', [const tokens.Number(1.3)]);
    expectTokens('.3', [const tokens.Number(0.3)]);

    expectTokens('abc', [const tokens.Symbol('abc')]);

    expectTokens('class', [tokens.classKeyword]);
    expectTokens('abstract', [tokens.abstractKeyword]);
    expectTokens('continue', [tokens.continueKeyword]);
    expectTokens('false', [tokens.falseKeyword]);
    expectTokens('new', [tokens.newKeyword]);
    expectTokens('this', [tokens.thisKeyword]);
    expectTokens('as', [tokens.asKeyword]);
    expectTokens('default', [tokens.defaultKeyword]);
    expectTokens('let', [tokens.letKeyword]);
    expectTokens('null', [tokens.nullKeyword]);
    expectTokens('throw', [tokens.throwKeyword]);
    expectTokens('assert', [tokens.assertKeyword]);
    expectTokens('deferred', [tokens.deferredKeyword]);
    expectTokens('finally', [tokens.finallyKeyword]);
    expectTokens('operator', [tokens.operatorKeyword]);
    expectTokens('true', [tokens.trueKeyword]);
    expectTokens('async', [tokens.asyncKeyword]);
    expectTokens('do', [tokens.doKeyword]);
    expectTokens('for', [tokens.forKeyword]);
    expectTokens('part', [tokens.partKeyword]);
    expectTokens('try', [tokens.tryKeyword]);
    expectTokens('dynamic', [tokens.dynamicKeyword]);
    expectTokens('get', [tokens.getKeyword]);
    expectTokens('rethrow', [tokens.rethrowKeyword]);
    expectTokens('typedef', [tokens.typedefKeyword]);
    expectTokens('await', [tokens.awaitKeyword]);
    expectTokens('else', [tokens.elseKeyword]);
    expectTokens('if', [tokens.ifKeyword]);
    expectTokens('return', [tokens.returnKeyword]);
    expectTokens('var', [tokens.varKeyword]);
    expectTokens('break', [tokens.breakKeyword]);
    expectTokens('enum', [tokens.enumKeyword]);
    expectTokens('implements', [tokens.implementsKeyword]);
    expectTokens('set', [tokens.setKeyword]);
    expectTokens('void', [tokens.voidKeyword]);
    expectTokens('case', [tokens.caseKeyword]);
    expectTokens('export', [tokens.exportKeyword]);
    expectTokens('import', [tokens.importKeyword]);
    expectTokens('static', [tokens.staticKeyword]);
    expectTokens('while', [tokens.whileKeyword]);
    expectTokens('catch', [tokens.catchKeyword]);
    expectTokens('external', [tokens.externalKeyword]);
    expectTokens('in', [tokens.inKeyword]);
    expectTokens('super', [tokens.superKeyword]);
    expectTokens('with', [tokens.withKeyword]);
    expectTokens('class', [tokens.classKeyword]);
    expectTokens('extends', [tokens.extendsKeyword]);
    expectTokens('is', [tokens.isKeyword]);
    expectTokens('switch', [tokens.switchKeyword]);
    expectTokens('yield', [tokens.yieldKeyword]);
    expectTokens('const', [tokens.constKeyword]);
    expectTokens('factory', [tokens.factoryKeyword]);
    expectTokens('library', [tokens.libraryKeyword]);
  }
}