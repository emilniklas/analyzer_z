part of analyzer_z.ast;

abstract class TopLevelValueDeclaration extends TopLevelDeclaration {
  final TypeName type;
  final Expression value;

  const TopLevelValueDeclaration({
    this.value,
    this.type,
    Identifier name
  }) : super(name: name, children: const NodeList<Node>.empty());

  factory TopLevelValueDeclaration._parse(Parser parser) { throw new UnsupportedError('implement TopLevelValueDeclaration'); }

  bool get isConst;

  bool get isLet;

  bool get isVar;

  bool operator ==(other) {
    return other is TopLevelValueDeclaration
        && other.type == this.type
        && other.isConst == isConst
        && other.isLet == isLet
        && other.isVar == isVar
        && super == other;
  }

  String toString() {
    final mutability = isConst
        ? 'const '
        : isLet
        ? 'let '
        : isVar
        ? 'var '
        : '';
    final typeString = type is UndeclaredType
        ? ''
        : ': $type';
    final expressionString = value == null
        ? ''
        : ' = $value';
    return '$mutability$name$typeString$expressionString';
  }
}