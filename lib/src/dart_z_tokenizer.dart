part of analyzer_z;

class DartZTokenizer extends Tokenizer {
  Map<String, TokenFactory> get matchers => {
    r'^\s*(\r?\n|;)': (Match $) => $[1] == ';'
        ? tokens.semicolon
        : tokens.lineBreak,

    r'^\s+': (_) => tokens.whitespace,

    '^(abstract|continue|false|new|this|as|default|final|null|throw|assert|'
    'deferred|finally|operator|true|async|do|for|part|try|dynamic|get|'
    'rethrow|typedef|await|else|if|return|var|break|enum|implements|set|'
    'void|case|export|import|static|while|catch|external|in|super|with|'
    r'class|extends|is|switch|yield|const|factory|library)\b': (Match $) => new tokens.Keyword($[1]),

    r'^(?:(\/\/\/?)(.*)|\/\*([^]*?)\*\/)': (Match $) {
      if ($[1] == '///') return new tokens.DocComment($[2]);
      if ($[1] == '//') return new tokens.LineComment($[2]);
      return new tokens.MultilineComment($[3]);
    },

    r'''^(r?)(['"])(?:(\2)\2([^]*?)\2\2|(.*?))\2''': (Match $) {
      final isRaw = $[1] == 'r';
      final isSingleQuote = $[2] == "'";
      final isMultiline = $[3] == $[2];
      final value = isMultiline ? $[4] : $[5];
      return new tokens.StringToken(
          value: value,
          isMultiline: isMultiline,
          isUsingSingleQuotes: isSingleQuote,
          isRaw: isRaw
      );
    },

    r'^[A-Za-z_$][A-Za-z_$0-9]*': (Match $) => new tokens.Symbol($[0]),

    r'^(\d\.?\d*|\.\d+)': (Match $) => new tokens.Number(num.parse($[0])),

    r'''^(r?)(?:('{3}|"{3})([^]*?)\2|(['"])(.*?)\4)''': (Match $) {
      final isRaw = $[1] == 'r';
      final isMultiline = $[4] == '';
      final usingSingleQuotes = isMultiline
          ? $[2] == "'''"
          : $[4] == "'";
      return new tokens.StringToken(
          value: isMultiline ? $[3] : $[5],
          isUsingSingleQuotes: usingSingleQuotes,
          isMultiline: isMultiline,
          isRaw: isRaw
      );
    },

    r'^\.': (_) => tokens.period,
    r'^\,': (_) => tokens.comma,
    r'^\:': (_) => tokens.colon,
    r'^\{': (_) => tokens.openCurlyBrace,
    r'^\}': (_) => tokens.closeCurlyBrace,
    r'^\(': (_) => tokens.openParenthesis,
    r'^\)': (_) => tokens.closeParenthesis,
    r'^\[': (_) => tokens.openBracket,
    r'^\]': (_) => tokens.closeBracket,
    r'^\<': (_) => tokens.openAngleBracket,
    r'^\>': (_) => tokens.closeAngleBracket,
    r'^\#': (_) => tokens.hash,
    r'^\!': (_) => tokens.bang,
    r'^\?': (_) => tokens.questionMark,
    r'^\/': (_) => tokens.slash,
    r'^\\': (_) => tokens.backslash,
    r'^\&': (_) => tokens.ampersand,
    r'^\|': (_) => tokens.pipe,
    r'^\~': (_) => tokens.tilde,
    r'^\%': (_) => tokens.percentSign,
    r'^\+': (_) => tokens.plus,
    r'^\=': (_) => tokens.equals,
    r'^\-': (_) => tokens.dash,
    r'^\"': (_) => tokens.doubleQuote,
    r"^\'": (_) => tokens.singleQuote,
  };
}
