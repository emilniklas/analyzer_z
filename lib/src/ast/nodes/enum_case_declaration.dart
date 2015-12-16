part of analyzer_z.ast;

class EnumCaseDeclaration extends Node {
  final Identifier name;

  const EnumCaseDeclaration(this.name) : super.empty();

  factory EnumCaseDeclaration._parse(Parser parser) {}

  bool operator ==(other) {
    return other is EnumCaseDeclaration
        && other.name == name
        && super == other;
  }
}
