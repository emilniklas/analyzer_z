part of analyzer_z.ast;

class TopLevelDeclaration<C extends Node> extends Node<C> {
  final Identifier name;

  const TopLevelDeclaration({this.name, NodeList<C> children})
      : super(children);

  factory TopLevelDeclaration._parse(Parser parser) {
    if (parser.next == tokens.classKeyword
        || parser.next == tokens.abstractKeyword)
      return new ClassDeclaration._parse(parser) as TopLevelDeclaration<C>;

    if (parser.next == tokens.enumKeyword)
      return new EnumDeclaration._parse(parser) as TopLevelDeclaration<C>;

    if (parser.next == tokens.constKeyword
        || parser.next == tokens.letKeyword
        || parser.next == tokens.varKeyword)
      return new TopLevelValueDeclaration._parse(parser);


    return parser.failExpecting('class, enum or value declaration');
  }

  bool operator ==(other) {
    return other is TopLevelDeclaration
        && other.name == name
        && super == other;
  }

  String toString() => '$name';
}
