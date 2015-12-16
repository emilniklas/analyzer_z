part of analyzer_z.ast;

class TypeName extends Identifier {
  const TypeName(String value) : super(value);

  factory TypeName._parse(Parser parser) { throw new UnsupportedError('implement TypeName'); }

  bool operator ==(other) {
    return other is TypeName
        && super == other;
  }
}