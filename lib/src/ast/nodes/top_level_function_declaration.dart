part of analyzer_z.ast;

class TopLevelFunctionDeclaration extends TopLevelDeclaration<BlockLevelDeclaration> implements FunctionDeclaration {
  final ArgumentList arguments;
  final TypeName returnType;

  const TopLevelFunctionDeclaration({
    Identifier name,
    ArgumentList arguments,
    this.returnType
  }) : arguments = arguments,
        super(name: name, children: arguments);

  factory TopLevelFunctionDeclaration._parse(Parser parser) { throw new UnsupportedError('implement TopLevelFunctionDeclaration'); }

  bool operator ==(other) {
    return other is TopLevelFunctionDeclaration
        && super == other;
  }
}