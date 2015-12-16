part of analyzer_z.ast;

class ClassLevelDeclaration extends Node {
  final Identifier name;

  const ClassLevelDeclaration({this.name, NodeList<Node> children})
      : super(children);

  factory ClassLevelDeclaration._parse(Parser parser) {
    if (parser.nextIsConstLetOrVar)
      return new ClassLevelValueDeclaration._parse(parser);
    // TODO: implement constructors
    // TODO: implement methods
    return parser.failExpecting('field or method');
  }

  bool operator ==(other) {
    return other is ClassLevelDeclaration
        && other.name == name
        && super == other;
  }
}
