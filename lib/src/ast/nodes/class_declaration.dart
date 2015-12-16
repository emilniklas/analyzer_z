part of analyzer_z.ast;

class ClassDeclaration extends TopLevelDeclaration<ClassLevelDeclaration> {
  final bool abstract;

  const ClassDeclaration({
    Identifier name,
    this.abstract: false,
    NodeList<ClassLevelDeclaration> children
  }) : super(name: name, children: children);

  factory ClassDeclaration._parse(Parser parser) {
    final bool isAbstract = () {
      if (parser.next != tokens.abstractKeyword) return false;
      parser.move(); // abstract
      return true;
    }();
    parser.expect(parser.next == tokens.classKeyword, 'class');
    parser.move(); // class
    parser.expect(parser.next is tokens.Symbol, 'Symbol');
    parser.move(); // symbol
    final Identifier name = new Identifier((parser._current as tokens.Symbol).value);
    return new ClassDeclaration(
        name: name,
        abstract: isAbstract,
        children: _parseClassLevel(parser)
    );
  }

  static NodeList<ClassLevelDeclaration> _parseClassLevel(Parser parser) {
    parser.expect(parser.next == tokens.openCurlyBrace, '{');
    parser.move(); // {
    parser.movePastBreaks();
    final list = new NodeList<ClassLevelDeclaration>(() sync* {
      while (parser.next != tokens.closeCurlyBrace) {
        parser.movePastBreaks();
        yield new ClassLevelDeclaration._parse(parser);
        parser.movePastBreaks();
      }
    }().toList());
    parser.expect(parser.next == tokens.closeCurlyBrace, '}');
    parser.move(); // }
    return list;
  }

  bool operator ==(other) {
    return other is ClassDeclaration
        && super == other;
  }
}
