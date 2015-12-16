part of analyzer_z.ast;

class ClassLevelConstDeclaration extends ClassLevelValueDeclaration {
  const ClassLevelConstDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory ClassLevelConstDeclaration._parse(Parser parser) {}

  bool get isConst => true;

  bool get isLet => false;

  bool get isVar => false;

  bool operator ==(other) {
    return other is ClassLevelConstDeclaration
        && super == other;
  }
}
