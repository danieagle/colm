/*
 * @LANG: indep
 * @PROHIBIT_LANGUAGES: ruby ocaml
 */

int top;
int stack[32];

int target;

%%{
	machine goto;

	unused := 'unused';

	one := 'one' @{
		print_str "one\n";
		fret;
	};

	two := 'two' @{
		print_str "two\n";
		fret;
	};

	main := (
			'1' @{ target = fentry(one); fcall *target; }
		|	'2' @{ target = fentry(two); fcall *target; }
		|	'\n'
	)*;
}%%

##### INPUT #####
"1one2two1one\n"
##### OUTPUT #####
one
two
one
ACCEPT
