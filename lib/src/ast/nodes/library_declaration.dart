part of analyzer_z.ast;

class LibraryDeclaration extends TopLevelDeclaration {
  const LibraryDeclaration(Identifier name)
      : super(name: name, children: const NodeList.empty());

  factory LibraryDeclaration._parse(Parser parser) { throw new UnsupportedError('implement LibraryDeclaration'); }

  bool operator ==(other) {
    return other is LibraryDeclaration
        && super == other;
  }
}

