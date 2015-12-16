part of analyzer_z.ast;

class Constructor extends ClassLevelDeclaration implements FunctionDeclaration {
  final ArgumentList arguments;
  final bool isConst;

  const Constructor({
    this.arguments,
    Identifier name,
    this.isConst: false,
    NodeList<Node> children
  }) : super(name: name, children: children);

  factory Constructor._parse(Parser parser) {}

  TypeName get returnType => null;

  bool operator ==(other) {
    return other is Constructor
        && other.isConst == isConst
        && super == other;
  }
}
