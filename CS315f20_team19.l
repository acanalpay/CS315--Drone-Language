
FLY fly
LAND  land
BEGIN2 begin
END end
IF  if
ELSE  else
WHILE while
FOR for
INPUT input
OUTPUT  output
RETURN return
LETTER       [A-Za-z]
DIGIT [0-9]
SIGN [+-]
ALPHANUMERIC	 ({LETTER}|{DIGIT})
INTEGER {SIGN}?{DIGIT}+
DOUBLE {SIGN}?{DIGIT}*(\.)?{DIGIT}+
BOOL  false|true
BOOLEAN boolean
LCB \{
RCB \}
LSB \[
RSB \]
LP \(
RP \)
COMMA \,
PLUS \+
MINUS  \-
MULTIPLICATION  \*
DIVISION  \/
MOD \%
INC_OR \|
INC_AND \&
OR  \|\|
AND \&\&
XOR \^
EQUAL \=\=
LESSTHAN   \<
GREATERTHAN   \>
LTE   \<=
GTE   \>=
NOT   \!
NOT_EQUAL \!\=
SPACE   [ ]
DOT \.
ASSIGNMENT_OP \=
VOID void

SEMICOLON \;
ENDLINE \n

MOVE  move
GET_ALTITUDE  altitude
GET_TEMPERATURE temperature
SNAP snap
GET_ACCELERATION acceleration
GET_TIME time
GET_CONNECTION connection
CAMERA_ON camera_on
CAMERA_OFF camera_off

IDENTIFIER {LETTER}({ALPHANUMERIC}|_)*
COMMENT \/\*.*\*\/
EMPTY (\"\")?(\(\))?(\{\})?




%option yylineno
%%
{BOOLEAN} return BOOLEAN;
{BEGIN2} return BEGIN2;
{FLY} return FLY;
{LAND} return LAND;
{END} return END;
{IF} return IF;
{ELSE} return ELSE;
{WHILE} return WHILE;
{FOR} return FOR;
{INPUT} return INPUT;
{OUTPUT} return OUTPUT;
{RETURN} return RETURN;
{LCB} return LCB;
{RCB} return RCB;
{LSB} return LSB;
{RSB} return RSB;
{COMMA} return COMMA;
{PLUS} return PLUS;
{MINUS} return MINUS;
{MULTIPLICATION} return MULTIPLICATION;
{DIVISION} return DIVISION;
{MOD} return MOD;
{OR} return OR;
{AND} return AND;
{INC_AND} return INC_AND;
{INC_OR} return INC_OR;
{XOR} return XOR;
{EQUAL} return EQUAL;
{LESSTHAN} return LESSTHAN;
{GREATERTHAN} return GREATERTHAN;
{LTE} return LTE;
{GTE} return GTE;
{NOT} return NOT;
{NOT_EQUAL} return NOT_EQUAL;
{DOT} return DOT;
{LP} return LP;
{RP} return RP;
{ASSIGNMENT_OP} return ASSIGNMENT_OP;
{SEMICOLON} return SEMICOLON;
{ENDLINE} ;
{INTEGER} return INTEGER;
{DOUBLE} return DOUBLE;
{VOID} return VOID;
{COMMENT} return COMMENT;
{MOVE}  return MOVE;
{GET_ALTITUDE}  return GET_ALTITUDE;
{GET_TEMPERATURE}  return GET_TEMPERATURE;
{SNAP}  return SNAP;
{GET_ACCELERATION}  return GET_ACCELERATION;
{GET_TIME}  return GET_TIME;
{GET_CONNECTION}  return GET_CONNECTION;
{CAMERA_ON} return CAMERA_ON;
{CAMERA_OFF} return CAMERA_OFF;

{IDENTIFIER} return IDENTIFIER;
%%
int yywrap(){return 1;}
