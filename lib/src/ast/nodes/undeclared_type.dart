part of analyzer_z.ast;

class UndeclaredType extends TypeName {
  const UndeclaredType() : super(null);

  factory UndeclaredType._parse(Parser parser) { throw new UnsupportedError('implement UndeclaredType'); }

  bool operator ==(other) {
    return other is UndeclaredType
        && super == other;
  }
}
