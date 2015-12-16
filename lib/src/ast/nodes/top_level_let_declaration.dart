part of analyzer_z.ast;

class TopLevelLetDeclaration extends TopLevelValueDeclaration {
  const TopLevelLetDeclaration({
    TypeName type: const UndeclaredType(),
    Identifier name,
    Expression value
  }) : super(type: type, name: name, value: value);

  factory TopLevelLetDeclaration._parse(Parser parser) { throw new UnsupportedError('implement TopLevelLetDeclaration'); }

  bool get isConst => false;

  bool get isLet => true;

  bool get isVar => false;

  bool operator ==(other) {
    return other is TopLevelLetDeclaration
        && super == other;
  }
}