part of analyzer_z.ast;

class ClassLevelVarDeclaration extends ClassLevelValueDeclaration {
  const ClassLevelVarDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory ClassLevelVarDeclaration._parse(Parser parser) {}

  bool get isConst => false;

  bool get isLet => false;

  bool get isVar => true;

  bool operator ==(other) {
    return other is ClassLevelVarDeclaration
        && super == other;
  }
}
