part of analyzer_z.ast;

abstract class BlockLevelValueDeclaration extends BlockLevelDeclaration {
  final TypeName type;
  final Expression value;

  const BlockLevelValueDeclaration({
    this.value,
    this.type,
    Identifier name
  }) : super(name: name, children: const NodeList<Node>.empty());

  factory BlockLevelValueDeclaration._parse(Parser parser) {}

  bool get isConst;

  bool get isLet;

  bool get isVar;

  bool operator ==(other) {
    return other is BlockLevelValueDeclaration
        && other.type == this.type
        && other.isConst == isConst
        && other.isLet == isLet
        && other.isVar == isVar
        && super == other;
  }
}
