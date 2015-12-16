part of analyzer_z.ast;

class BlockLevelVarDeclaration extends BlockLevelValueDeclaration {
  const BlockLevelVarDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory BlockLevelVarDeclaration._parse(Parser parser) {}

  bool get isConst => false;

  bool get isLet => false;

  bool get isVar => true;

  bool operator ==(other) {
    return other is BlockLevelVarDeclaration
        && super == other;
  }
}
