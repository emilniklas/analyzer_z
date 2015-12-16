part of analyzer_z.ast;

class ExpressionLevelDeclaration extends Node {
  const ExpressionLevelDeclaration(NodeList<Node> children)
      : super(children);

  factory ExpressionLevelDeclaration._parse(Parser parser) {}

  bool operator ==(other) {
    return other is ExpressionLevelDeclaration
        && super == other;
  }
}
