part of analyzer_z.ast;

class Parser {
  final List<Token> _tokens;
  int _cursor = -1;

  factory Parser(List<Token> tokenList) {
    if (tokenList.length < 1 || tokenList.last != Token.eof)
      throw new Exception('Token list doesn\'t end with EOF');
    final cleanTokens = tokenList
        .where((t) => t != tokens.whitespace)
    ;
    return new Parser._(new List.unmodifiable(cleanTokens));
  }

  Parser._(this._tokens);

  Token get next => _tokens[_cursor + 1];

  Token get current => _tokens[_cursor];

  void move() {
    _cursor++;
  }

  void movePastBreaks() {
    while (next is tokens.Break)
      move();
  }

  failExpecting(String expected) {
    throw new Exception(
        'Unexpected token ${next}: expected $expected');
  }

  expect(bool condition, String expected) {
    if (!condition)
      failExpecting(expected);
  }

  bool get isAtEndOfStatement {
    return next is tokens.Break || next == Token.eof;
  }

  bool get isAtEndOfFile {
    return next == Token.eof;
  }

  RootNode parse() {
    return new RootNode._parse(this);
  }

  bool get nextIsConstLetOrVar =>
      next == tokens.constKeyword ||
          next == tokens.letKeyword ||
          next == tokens.varKeyword;

  TypeName parseTypeAnnotation() {
    move(); // :
    if (next is! tokens.Symbol)
      failExpecting('symbol');
    move(); // Symbol
    return new TypeName((current as tokens.Symbol).value);
  }

  Expression parseAssignment() {
    move(); // =
    return new Expression._parse(this);
  }
}
