part of analyzer_z.ast;

class Expression extends Node<ExpressionLevelDeclaration> {
  const Expression(NodeList<ExpressionLevelDeclaration> children)
      : super(children);

  factory Expression._parse(Parser parser) {
    if (parser.next is tokens.Number) {
      parser.move(); // number
      return new Expression(new NodeList<ExpressionLevelDeclaration>([
        new NumberLiteral((parser.current as tokens.Number).value)
      ]));
    }
    if (parser.next is tokens.StringToken) {
      parser.move(); // number
      final tokens.StringToken currentString = parser.current;
      return new Expression(new NodeList<ExpressionLevelDeclaration>([
        new StringLiteral(
            value: currentString.value,
            isMultiline: currentString.isMultiline,
            isRaw: currentString.isRaw,
            isUsingSingleQuotes: currentString.isUsingSingleQuotes
        )
      ]));
    }
    return parser.failExpecting('expression');
  }

  bool operator ==(other) {
    return other is Expression
        && super == other;
  }

  String toString() => children.join(' ');
}
