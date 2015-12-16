part of analyzer_z.ast;

class NullLiteral extends ExpressionLevelDeclaration {
  const NullLiteral() : super(const NodeList.empty());

  factory NullLiteral._parse(Parser parser) {}

  bool operator ==(other) {
    return other is NullLiteral
        && super == other;
  }
}
