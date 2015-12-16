part of analyzer_z.ast;

class PartDeclaration extends TopLevelDeclaration {
  const PartDeclaration(Identifier name)
      : super(name: name, children: const NodeList.empty());

  factory PartDeclaration._parse(Parser parser) { throw new UnsupportedError('implement PartDeclaration'); }

  bool operator ==(other) {
    return other is PartDeclaration
        && super == other;
  }
}