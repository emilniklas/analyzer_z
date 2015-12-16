part of analyzer_z.ast;

class BlockLevelConstDeclaration extends BlockLevelValueDeclaration {
  const BlockLevelConstDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory BlockLevelConstDeclaration._parse(Parser parser) {}

  bool get isConst => true;

  bool get isLet => false;

  bool get isVar => false;

  bool operator ==(other) {
    return other is BlockLevelConstDeclaration
        && super == other;
  }
}
