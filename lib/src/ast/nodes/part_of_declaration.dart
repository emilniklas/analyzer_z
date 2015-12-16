part of analyzer_z.ast;

class PartOfDeclaration extends TopLevelDeclaration {
  const PartOfDeclaration(Identifier name)
      : super(name: name, children: const NodeList.empty());

  factory PartOfDeclaration._parse(Parser parser) { throw new UnsupportedError('implement PartOfDeclaration'); }

  bool operator ==(other) {
    return other is PartOfDeclaration
        && super == other;
  }
}