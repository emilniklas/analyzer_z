part of analyzer_z.ast;

class BlockLevelLetDeclaration extends BlockLevelValueDeclaration {
  const BlockLevelLetDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory BlockLevelLetDeclaration._parse(Parser parser) { throw new UnsupportedError('implement BlockLevelLetDeclaration'); }

  bool get isConst => false;

  bool get isLet => true;

  bool get isVar => false;

  bool operator ==(other) {
    return other is BlockLevelLetDeclaration
        && super == other;
  }
}
