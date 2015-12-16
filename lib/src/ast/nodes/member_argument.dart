part of analyzer_z.ast;

class MemberArgument extends Argument {
  const MemberArgument({Identifier name}) : super(name: name);

  factory MemberArgument._parse(Parser parser) { throw new UnsupportedError('implement MemberArgument'); }

  bool operator ==(other) {
    return other is MemberArgument
        && super == other;
  }
}
