part of analyzer_z.ast;

class Argument extends BlockLevelValueDeclaration {
  const Argument({
    Identifier name,
    TypeName type
  }) : super(name: name, type: type);

  factory Argument._parse(Parser parser) {}

  bool get isConst => false;

  bool get isLet => true;

  bool get isVar => false;

  bool get isPositional => false;

  bool get isNamed => false;

  bool get defaultValue => null;

  bool operator ==(other) {
    return other is Argument
        && isConst == other.isConst
        && isLet == other.isLet
        && isVar == other.isVar
        && isPositional == other.isPositional
        && isNamed == other.isNamed
        && defaultValue == other.defaultValue
        && super == other;
  }
}
