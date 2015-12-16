part of analyzer_z.ast;

class BlockLevelDeclaration extends Node {
  final Identifier name;

  const BlockLevelDeclaration({this.name, NodeList<Node> children})
      : super(children);

  factory BlockLevelDeclaration._parse(Parser parser) {}

  bool operator ==(other) {
    return other is BlockLevelDeclaration
        && other.name == name
        && super == other;
  }
}
