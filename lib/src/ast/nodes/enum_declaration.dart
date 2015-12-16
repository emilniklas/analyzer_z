part of analyzer_z.ast;

class EnumDeclaration extends TopLevelDeclaration<EnumCaseDeclaration> {
  final NodeList<EnumCaseDeclaration> cases;

  const EnumDeclaration({
    Identifier name,
    NodeList<EnumCaseDeclaration> cases: const NodeList<EnumCaseDeclaration>.empty()
  }) : cases = cases,
        super(name: name, children: cases);

  factory EnumDeclaration._parse(Parser parser) {}

  bool operator ==(other) {
    return other is EnumDeclaration
        && super == other;
  }
}