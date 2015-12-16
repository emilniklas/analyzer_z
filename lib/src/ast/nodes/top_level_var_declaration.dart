part of analyzer_z.ast;

class TopLevelVarDeclaration extends TopLevelValueDeclaration {
  const TopLevelVarDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory TopLevelVarDeclaration._parse(Parser parser) {}

  bool get isConst => false;

  bool get isLet => false;

  bool get isVar => true;

  bool operator ==(other) {
    return other is TopLevelVarDeclaration
        && super == other;
  }
}