
/* description: Parses and executes mathematical expressions. */

/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
"+"                   return '+'
<<EOF>>               return 'EOF'
.                     return 'INVALID'

/lex
%{
 var converter= require('./parser.js');
%}

/* operator associations and precedence */

%left '+'

%start expressions

%% /* language grammar */

expressions
    : e EOF
        { console.log(converter.represent($$));}
    ;

e
    : e '+' e
        {$$={leftChild:$1,parent:$2,rightChild:$3}}

    | NUMBER
        {$$ = Number(yytext);};