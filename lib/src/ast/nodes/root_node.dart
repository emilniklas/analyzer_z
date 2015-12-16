part of analyzer_z.ast;

class RootNode extends Node<TopLevelDeclaration> {
  const RootNode(NodeList<TopLevelDeclaration> children) : super(children);

  const RootNode.empty() : super(const NodeList<TopLevelDeclaration>.empty());

  factory RootNode._parse(Parser parser) {
    final topLevel = <TopLevelDeclaration>[];
    while (!parser.isAtEndOfFile) {
      if (parser.next is tokens.Break) {
        parser.movePastBreaks();
        continue;
      }
      final beforeParseHashCode = parser.next.hashCode;
      topLevel.add(new TopLevelDeclaration._parse(parser));
      if (parser.next.hashCode == beforeParseHashCode)
        throw new Exception('Token "${parser.next}" did not get parsed');
    }
    return new RootNode(new NodeList<TopLevelDeclaration>(topLevel));
  }

  String toString() => children.join('\n');
}
