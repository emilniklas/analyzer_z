part of analyzer_z.ast;

class TopLevelConstDeclaration extends TopLevelValueDeclaration {
  const TopLevelConstDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory TopLevelConstDeclaration._parse(Parser parser) {}

  bool get isConst => true;

  bool get isLet => false;

  bool get isVar => false;

  bool operator ==(other) {
    return other is TopLevelConstDeclaration
        && super == other;
  }
}