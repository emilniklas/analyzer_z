part of analyzer_z.ast;

class ClassLevelLetDeclaration extends ClassLevelValueDeclaration {
  const ClassLevelLetDeclaration({
    TypeName type,
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory ClassLevelLetDeclaration._parse(Parser parser) { throw new UnsupportedError('implement ClassLevelLetDeclaration'); }

  bool get isConst => false;

  bool get isLet => true;

  bool get isVar => false;

  bool operator ==(other) {
    return other is ClassLevelLetDeclaration
        && super == other;
  }
}
