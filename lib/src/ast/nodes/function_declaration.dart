part of analyzer_z.ast;

abstract class FunctionDeclaration {
  ArgumentList get arguments;
  TypeName get returnType;
  Identifier get name;

  factory FunctionDeclaration._parse(Parser parser) { throw new UnsupportedError('implement FunctionDeclaration'); }
}
