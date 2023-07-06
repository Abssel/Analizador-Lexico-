import java_cup.runtime.Symbol;

%%
%class PythonLexer
%unicode
%line
%column
%cup

%{
  // Aquí puedes agregar código adicional si lo necesitas
%}

%whitespace {
  // Define los caracteres de espacio en blanco
  [ \t\r\n]+
}

%state STRING

// Definición de tokens
%token <String> IDENTIFIER
%token <String> INTEGER_LITERAL
%token <String> FLOAT_LITERAL
%token <String> STRING_LITERAL
%token <String> KEYWORD
%token <String> OPERATOR
%token <String> PUNCTUATION

// Expresiones regulares para reconocer tokens
DIGIT = [0-9]
LETTER = [a-zA-Z_]
IDENTIFIER = {LETTER}({LETTER}|{DIGIT})*
INTEGER_LITERAL = {DIGIT}+
FLOAT_LITERAL = {DIGIT}+"."{DIGIT}+
STRING_LITERAL = \"([^\"\\]|\\.)*\"
KEYWORD = "if" | "else" | "while" | "for" | "def" | "return"
OPERATOR = "+" | "-" | "*" | "/" | "=" | "<" | ">" | "==" | "!="
PUNCTUATION = "[" | "]" | "(" | ")" | "{" | "}" | "," | ":" | ";"

// Reglas para reconocer tokens
<YYINITIAL> {
  {IDENTIFIER} { return new Symbol(sym.IDENTIFIER, yytext()); }
  {INTEGER_LITERAL} { return new Symbol(sym.INTEGER_LITERAL, yytext()); }
  {FLOAT_LITERAL} { return new Symbol(sym.FLOAT_LITERAL, yytext()); }
  {KEYWORD} { return new Symbol(sym.KEYWORD, yytext()); }
  {OPERATOR} { return new Symbol(sym.OPERATOR, yytext()); }
  {PUNCTUATION} { return new Symbol(sym.PUNCTUATION, yytext()); }
  \" { yybegin(STRING); }
}

<STRING> {
  [^\\"]+ { /* Do nothing */ }
  \\\\\" { /* Do nothing */ }
  \\\" { yybegin(YYINITIAL); return new Symbol(sym.STRING_LITERAL, yytext()); }
  \\n { /* Do nothing */ }
}

// Manejo de errores
<YYINITIAL> {
  . { throw new RuntimeException("Caracter inesperado: " + yytext()); }
}

%%

// Aquí puedes agregar métodos y código adicional si lo necesitas