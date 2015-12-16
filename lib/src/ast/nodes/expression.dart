part of analyzer_z.ast;

class Expression extends Node<ExpressionLevelDeclaration> {
  const Expression(NodeList<ExpressionLevelDeclaration> children)
      : super(children);

  factory Expression._parse(Parser parser) {}

  bool operator ==(other) {
    return other is Expression
        && super == other;
  }

  String toString() => children.join(' ');
}
