part of analyzer_z;

typedef Token TokenFactory(Match match);

abstract class Tokenizer {
  List<Token> tokenize(String source) {
    return new List.unmodifiable(_tokenize('', [], source));
  }

  Iterable<Token> _tokenize(String head, Iterable<Token> iterable, String source) {
    if (source == '') return _append(iterable, Token.eof);
    for (final matcher in matchers.keys) {
      final regexp = new RegExp(matcher);
      if (regexp.hasMatch(source)) {
        final match = regexp.firstMatch(source);
        final head = match[0];
        final tail = source.substring(head.length);
        final factory = matchers[matcher];
        final newIterable = _append(iterable, factory(match));
        return _tokenize(head, newIterable, tail);
      }
    }
    final lineSplitter = new RegExp(r'\r?\n');
    final lines = head.split(lineSplitter);
    final lineNumber = lines.length;
    final columnNumber = lines.last.length;
    throw new Exception('Invalid token at $lineNumber:$columnNumber');
  }

  Iterable<Token> _append(Iterable<Token> tokens, Token token) {
    return tokens.toList()
      ..add(token);
  }

  Map<String, TokenFactory> get matchers;
}

