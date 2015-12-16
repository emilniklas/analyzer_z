part of analyzer_z.ast;

abstract class ClassLevelValueDeclaration extends ClassLevelDeclaration {
  final TypeName type;
  final Expression value;

  const ClassLevelValueDeclaration({
    this.value,
    this.type,
    Identifier name
  }) : super(name: name, children: const NodeList<Node>.empty());

  factory ClassLevelValueDeclaration._parse(Parser parser) {}

  bool get isConst;

  bool get isLet;

  bool get isVar;

  bool operator ==(other) {
    return other is ClassLevelValueDeclaration
        && other.type == this.type
        && other.isConst == isConst
        && other.isLet == isLet
        && other.isVar == isVar
        && super == other;
  }
}
