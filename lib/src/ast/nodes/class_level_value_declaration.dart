part of analyzer_z.ast;

abstract class ClassLevelValueDeclaration extends ClassLevelDeclaration {
  final TypeName type;
  final Expression value;

  const ClassLevelValueDeclaration({
    this.value,
    this.type,
    Identifier name
  }) : super(name: name, children: const NodeList<Node>.empty());

  factory ClassLevelValueDeclaration._parse(Parser parser) {
    if (parser.next == tokens.constKeyword)
      return _parseValueDeclaration(parser, (n, t, v) =>
      new ClassLevelConstDeclaration(name: n, type: t, value: v));
    if (parser.next == tokens.letKeyword)
      return _parseValueDeclaration(parser, (n, t, v) =>
      new ClassLevelLetDeclaration(name: n, type: t, value: v));
    if (parser.next == tokens.varKeyword)
      return _parseValueDeclaration(parser, (n, t, v) =>
      new ClassLevelVarDeclaration(name: n, type: t, value: v));
    return parser.failExpecting('var, let or const');
  }

  static ClassLevelValueDeclaration _parseValueDeclaration(Parser parser,
      make(Identifier name, TypeName type, Expression value)) {
    parser.move(); // var, let or const
    if (parser.next is! tokens.Symbol)
      parser.failExpecting('symbol');
    parser.move(); // name of var
    final tokens.Symbol symbol = parser.current;
    final name = new Identifier(symbol.value);
    final TypeName type = (parser.next == tokens.colon)
        ? parser.parseTypeAnnotation()
        : const UndeclaredType();
    final Expression value = (parser.next == tokens.equals)
        ? parser.parseAssignment()
        : null;
    if (!parser.isAtEndOfStatement)
      parser.failExpecting('line break or semicolon');
    return make(name, type, value);
  }

  bool get isConst;

  bool get isLet;

  bool get isVar;

  bool operator ==(other) {
    return other is ClassLevelValueDeclaration
        && other.type == this.type
        && other.isConst == isConst
        && other.isLet == isLet
        && other.isVar == isVar
        && super == other;
  }
}
