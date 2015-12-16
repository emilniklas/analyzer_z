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

  Token get _current => _tokens[_cursor];

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

  bool _nextIsBreak() {
    return next is tokens.Break || next == Token.eof;
  }

  bool isAtEnd() {
    return next == Token.eof;
  }

  RootNode parse() {
    return new RootNode._parse(this);
  }

  ClassLevelDeclaration _parseClassLevelDeclaration() {
  }

  bool get nextIsConstLetOrVar =>
      next == tokens.constKeyword ||
          next == tokens.letKeyword ||
          next == tokens.varKeyword;

  ClassLevelValueDeclaration _parseClassLevelValue() {
    if (next == tokens.constKeyword)
      return _parseValueDeclaration((n, t, v) =>
      new ClassLevelConstDeclaration(name: n, type: t, value: v));
    if (next == tokens.letKeyword)
      return _parseValueDeclaration((n, t, v) =>
      new ClassLevelLetDeclaration(name: n, type: t, value: v));
    if (next == tokens.varKeyword)
      return _parseValueDeclaration((n, t, v) =>
      new ClassLevelVarDeclaration(name: n, type: t, value: v));
    return failExpecting('var, let or const');
  }

  /*EnumDeclaration*/
  _parseEnum() {
    throw new UnsupportedError('Enums are not implemented');
  }

  TopLevelValueDeclaration _parseTopLevelValue() {
    if (next == tokens.constKeyword)
      return _parseValueDeclaration((n, t, v) =>
      new TopLevelConstDeclaration(name: n, type: t, value: v));
    if (next == tokens.letKeyword)
      return _parseValueDeclaration((n, t, v) =>
      new TopLevelLetDeclaration(name: n, type: t, value: v));
    if (next == tokens.varKeyword)
      return _parseValueDeclaration((n, t, v) =>
      new TopLevelVarDeclaration(name: n, type: t, value: v));
    return failExpecting('var, let or const');
  }

  _parseValueDeclaration(
      make(Identifier name, TypeName type, Expression value)) {
    move(); // var, let or const
    if (next is! tokens.Symbol)
      failExpecting('symbol');
    move(); // name of var
    final tokens.Symbol symbol = _current;
    final name = new Identifier(symbol.value);
    final TypeName type = (next == tokens.colon)
        ? _parseTypeDeclaration()
        : const UndeclaredType();
    final Expression value = (next == tokens.equals)
        ? _parseAssignment()
        : null;
    if (!_nextIsBreak())
      failExpecting('line break or semicolon');
    return make(name, type, value);
  }

  TypeName _parseTypeDeclaration() {
    move(); // :
    if (next is! tokens.Symbol)
      failExpecting('symbol');
    move(); // Symbol
    return new TypeName((_current as tokens.Symbol).value);
  }

  Expression _parseAssignment() {
    move(); // =
    return _parseExpression();
  }

  Expression _parseExpression() {
    if (next is tokens.Number) {
      move(); // number
      return new Expression(new NodeList<ExpressionLevelDeclaration>([
        new NumberLiteral((_current as tokens.Number).value)
      ]));
    }
    if (next is tokens.StringToken) {
      move(); // number
      final tokens.StringToken current = _current;
      return new Expression(new NodeList<ExpressionLevelDeclaration>([
        new StringLiteral(
            value: current.value,
            isMultiline: current.isMultiline,
            isRaw: current.isRaw,
            isUsingSingleQuotes: current.isUsingSingleQuotes
        )
      ]));
    }
    return failExpecting('expression');
  }
}
