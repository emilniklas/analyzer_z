part of analyzer_z.ast;

class TypedefDeclaration extends TopLevelDeclaration implements FunctionDeclaration {
  final ArgumentList arguments;
  final TypeName returnType;

  const TypedefDeclaration({
    this.arguments,
    this.returnType,
    Identifier name
  }) : super(name: name, children: const NodeList.empty());

  factory TypedefDeclaration._parse(Parser parser) {}

  bool operator ==(other) {
    return other is TypedefDeclaration
        && super == other;
  }
}