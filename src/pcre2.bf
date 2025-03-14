/*************************************************
*       Perl-Compatible Regular Expressions      *
*************************************************/

/* This is the public header file for the PCRE library, second API, to be
#included by applications that call PCRE2 functions.

		Copyright (c) 2016-2024 University of Cambridge

-----------------------------------------------------------------------------
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

	* Redistributions of source code must retain the above copyright notice,
	this list of conditions and the following disclaimer.

	* Redistributions in binary form must reproduce the above copyright
	notice, this list of conditions and the following disclaimer in the
	documentation and/or other materials provided with the distribution.

	* Neither the name of the University of Cambridge nor the names of its
	contributors may be used to endorse or promote products derived from
	this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
-----------------------------------------------------------------------------
*/

using System;
using System.Interop;

namespace pcre2;

public static class pcre2
{
	//const c_int PCRE2_CODE_UNIT_WIDTH = 8;

	typealias uint8_t = uint8;
	typealias uint16_t = uint16;
	typealias uint32_t = uint32;
	typealias uint64_t = uint64;
	typealias int8_t = int8;
	typealias int16_t = int16;
	typealias int32_t = int32;
	typealias int64_t = int64;
	typealias size_t = uint;

	/* The current PCRE version information. */

	// #define PCRE2_MAJOR           =10
	// #define PCRE2_MINOR           =46
	// #define PCRE2_PRERELEASE      -DEV
	// #define PCRE2_DATE            =2024-06-09

	/* The following option bits can be passed to pcre2_compile(), pcre2_match(),
	or pcre2_dfa_match(). PCRE2_NO_UTF_CHECK affects only the function to which it
	is passed. Put these bits at the most significant end of the options word so
	others can be added next to them */

	const c_uint PCRE2_ANCHORED            = 0x80000000u;
	const c_uint PCRE2_NO_UTF_CHECK        = 0x40000000u;
	const c_uint PCRE2_ENDANCHORED         = 0x20000000u;

	/* The following option bits can be passed only to pcre2_compile(). However,
	they may affect compilation, JIT compilation, and/or interpretive execution.
	The following tags indicate which:

	C   alters what is compiled by pcre2_compile()
	J   alters what is compiled by pcre2_jit_compile()
	M   is inspected during pcre2_match() execution
	D   is inspected during pcre2_dfa_match() execution
	*/

	const c_uint PCRE2_ALLOW_EMPTY_CLASS   = 0x00000001u; /* C       */
	const c_uint PCRE2_ALT_BSUX            = 0x00000002u; /* C       */
	const c_uint PCRE2_AUTO_CALLOUT        = 0x00000004u; /* C       */
	const c_uint PCRE2_CASELESS            = 0x00000008u; /* C       */
	const c_uint PCRE2_DOLLAR_ENDONLY      = 0x00000010u; /*   J M D */
	const c_uint PCRE2_DOTALL              = 0x00000020u; /* C       */
	const c_uint PCRE2_DUPNAMES            = 0x00000040u; /* C       */
	const c_uint PCRE2_EXTENDED            = 0x00000080u; /* C       */
	const c_uint PCRE2_FIRSTLINE           = 0x00000100u; /*   J M D */
	const c_uint PCRE2_MATCH_UNSET_BACKREF = 0x00000200u; /* C J M   */
	const c_uint PCRE2_MULTILINE           = 0x00000400u; /* C       */
	const c_uint PCRE2_NEVER_UCP           = 0x00000800u; /* C       */
	const c_uint PCRE2_NEVER_UTF           = 0x00001000u; /* C       */
	const c_uint PCRE2_NO_AUTO_CAPTURE     = 0x00002000u; /* C       */
	const c_uint PCRE2_NO_AUTO_POSSESS     = 0x00004000u; /* C       */
	const c_uint PCRE2_NO_DOTSTAR_ANCHOR   = 0x00008000u; /* C       */
	const c_uint PCRE2_NO_START_OPTIMIZE   = 0x00010000u; /*   J M D */
	const c_uint PCRE2_UCP                 = 0x00020000u; /* C J M D */
	const c_uint PCRE2_UNGREEDY            = 0x00040000u; /* C       */
	const c_uint PCRE2_UTF                 = 0x00080000u; /* C J M D */
	const c_uint PCRE2_NEVER_BACKSLASH_C   = 0x00100000u; /* C       */
	const c_uint PCRE2_ALT_CIRCUMFLEX      = 0x00200000u; /*   J M D */
	const c_uint PCRE2_ALT_VERBNAMES       = 0x00400000u; /* C       */
	const c_uint PCRE2_USE_OFFSET_LIMIT    = 0x00800000u; /*   J M D */
	const c_uint PCRE2_EXTENDED_MORE       = 0x01000000u; /* C       */
	const c_uint PCRE2_LITERAL             = 0x02000000u; /* C       */
	const c_uint PCRE2_MATCH_INVALID_UTF   = 0x04000000u; /*   J M D */
	const c_uint PCRE2_ALT_EXTENDED_CLASS  = 0x08000000u; /* C       */

	/* An additional compile options word is available in the compile context. */

	const c_uint PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES  = 0x00000001u; /* C */
	const c_uint PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL    = 0x00000002u; /* C */
	const c_uint PCRE2_EXTRA_MATCH_WORD               = 0x00000004u; /* C */
	const c_uint PCRE2_EXTRA_MATCH_LINE               = 0x00000008u; /* C */
	const c_uint PCRE2_EXTRA_ESCAPED_CR_IS_LF         = 0x00000010u; /* C */
	const c_uint PCRE2_EXTRA_ALT_BSUX                 = 0x00000020u; /* C */
	const c_uint PCRE2_EXTRA_ALLOW_LOOKAROUND_BSK     = 0x00000040u; /* C */
	const c_uint PCRE2_EXTRA_CASELESS_RESTRICT        = 0x00000080u; /* C */
	const c_uint PCRE2_EXTRA_ASCII_BSD                = 0x00000100u; /* C */
	const c_uint PCRE2_EXTRA_ASCII_BSS                = 0x00000200u; /* C */
	const c_uint PCRE2_EXTRA_ASCII_BSW                = 0x00000400u; /* C */
	const c_uint PCRE2_EXTRA_ASCII_POSIX              = 0x00000800u; /* C */
	const c_uint PCRE2_EXTRA_ASCII_DIGIT              = 0x00001000u; /* C */
	const c_uint PCRE2_EXTRA_PYTHON_OCTAL             = 0x00002000u; /* C */
	const c_uint PCRE2_EXTRA_NO_BS0                   = 0x00004000u; /* C */
	const c_uint PCRE2_EXTRA_NEVER_CALLOUT            = 0x00008000u; /* C */
	const c_uint PCRE2_EXTRA_TURKISH_CASING           = 0x00010000u; /* C */

	/* These are for pcre2_jit_compile(). */

	const c_uint PCRE2_JIT_COMPLETE        = 0x00000001u; /* For full matching */
	const c_uint PCRE2_JIT_PARTIAL_SOFT    = 0x00000002u;
	const c_uint PCRE2_JIT_PARTIAL_HARD    = 0x00000004u;
	const c_uint PCRE2_JIT_INVALID_UTF     = 0x00000100u;
	const c_uint PCRE2_JIT_TEST_ALLOC      = 0x00000200u;

	/* These are for pcre2_match(), pcre2_dfa_match(), pcre2_jit_match(), and
	pcre2_substitute(). Some are allowed only for one of the functions, and in
	these cases it is noted below. Note that PCRE2_ANCHORED, PCRE2_ENDANCHORED and
	PCRE2_NO_UTF_CHECK can also be passed to these functions (though
	pcre2_jit_match() ignores the latter since it bypasses all sanity checks). */

	const c_uint PCRE2_NOTBOL                      = 0x00000001u;
	const c_uint PCRE2_NOTEOL                      = 0x00000002u;
	const c_uint PCRE2_NOTEMPTY                    = 0x00000004u; /* ) These two must be = kept */
	const c_uint PCRE2_NOTEMPTY_ATSTART            = 0x00000008u; /* ) adjacent to each other= . */
	const c_uint PCRE2_PARTIAL_SOFT                = 0x00000010u;
	const c_uint PCRE2_PARTIAL_HARD                = 0x00000020u;
	const c_uint PCRE2_DFA_RESTART                 = 0x00000040u; /* pcre2_dfa_match() = only */
	const c_uint PCRE2_DFA_SHORTEST                = 0x00000080u; /* pcre2_dfa_match() = only */
	const c_uint PCRE2_SUBSTITUTE_GLOBAL           = 0x00000100u; /* pcre2_substitute() = only */
	const c_uint PCRE2_SUBSTITUTE_EXTENDED         = 0x00000200u; /* pcre2_substitute() = only */
	const c_uint PCRE2_SUBSTITUTE_UNSET_EMPTY      = 0x00000400u; /* pcre2_substitute() = only */
	const c_uint PCRE2_SUBSTITUTE_UNKNOWN_UNSET    = 0x00000800u; /* pcre2_substitute() = only */
	const c_uint PCRE2_SUBSTITUTE_OVERFLOW_LENGTH  = 0x00001000u; /* pcre2_substitute() = only */
	const c_uint PCRE2_NO_JIT                      = 0x00002000u; /* not for pcre2_dfa_match= () */
	const c_uint PCRE2_COPY_MATCHED_SUBJECT        = 0x00004000u;
	const c_uint PCRE2_SUBSTITUTE_LITERAL          = 0x00008000u; /* pcre2_substitute() = only */
	const c_uint PCRE2_SUBSTITUTE_MATCHED          = 0x00010000u; /* pcre2_substitute() = only */
	const c_uint PCRE2_SUBSTITUTE_REPLACEMENT_ONLY = 0x00020000u; /* pcre2_substitute() = only */
	const c_uint PCRE2_DISABLE_RECURSELOOP_CHECK   = 0x00040000u; /* not for pcre2_dfa_match() or pcre2_jit_match= () */

	/* Options for pcre2_pattern_convert(). */

	const c_uint PCRE2_CONVERT_UTF                    = 0x00000001u;
	const c_uint PCRE2_CONVERT_NO_UTF_CHECK           = 0x00000002u;
	const c_uint PCRE2_CONVERT_POSIX_BASIC            = 0x00000004u;
	const c_uint PCRE2_CONVERT_POSIX_EXTENDED         = 0x00000008u;
	const c_uint PCRE2_CONVERT_GLOB                   = 0x00000010u;
	const c_uint PCRE2_CONVERT_GLOB_NO_WILD_SEPARATOR = 0x00000030u;
	const c_uint PCRE2_CONVERT_GLOB_NO_STARSTAR       = 0x00000050u;

	/* Newline andR settings, for use in compile contexts. The newline values
	must be kept in step with values set in config.h and both sets must all be
	greater than zero. */

	const c_int PCRE2_NEWLINE_CR          = 1;
	const c_int PCRE2_NEWLINE_LF          = 2;
	const c_int PCRE2_NEWLINE_CRLF        = 3;
	const c_int PCRE2_NEWLINE_ANY         = 4;
	const c_int PCRE2_NEWLINE_ANYCRLF     = 5;
	const c_int PCRE2_NEWLINE_NUL         = 6;

	const c_int PCRE2_BSR_UNICODE         = 1;
	const c_int PCRE2_BSR_ANYCRLF         = 2;

	/* Error codes for pcre2_compile(). Some of these are also used by
	pcre2_pattern_convert(). */

	const c_int PCRE2_ERROR_END_BACKSLASH                  = 101;
	const c_int PCRE2_ERROR_END_BACKSLASH_C                = 102;
	const c_int PCRE2_ERROR_UNKNOWN_ESCAPE                 = 103;
	const c_int PCRE2_ERROR_QUANTIFIER_OUT_OF_ORDER        = 104;
	const c_int PCRE2_ERROR_QUANTIFIER_TOO_BIG             = 105;
	const c_int PCRE2_ERROR_MISSING_SQUARE_BRACKET         = 106;
	const c_int PCRE2_ERROR_ESCAPE_INVALID_IN_CLASS        = 107;
	const c_int PCRE2_ERROR_CLASS_RANGE_ORDER              = 108;
	const c_int PCRE2_ERROR_QUANTIFIER_INVALID             = 109;
	const c_int PCRE2_ERROR_INTERNAL_UNEXPECTED_REPEAT     = 110;
	const c_int PCRE2_ERROR_INVALID_AFTER_PARENS_QUERY     = 111;
	const c_int PCRE2_ERROR_POSIX_CLASS_NOT_IN_CLASS       = 112;
	const c_int PCRE2_ERROR_POSIX_NO_SUPPORT_COLLATING     = 113;
	const c_int PCRE2_ERROR_MISSING_CLOSING_PARENTHESIS    = 114;
	const c_int PCRE2_ERROR_BAD_SUBPATTERN_REFERENCE       = 115;
	const c_int PCRE2_ERROR_NULL_PATTERN                   = 116;
	const c_int PCRE2_ERROR_BAD_OPTIONS                    = 117;
	const c_int PCRE2_ERROR_MISSING_COMMENT_CLOSING        = 118;
	const c_int PCRE2_ERROR_PARENTHESES_NEST_TOO_DEEP      = 119;
	const c_int PCRE2_ERROR_PATTERN_TOO_LARGE              = 120;
	const c_int PCRE2_ERROR_HEAP_FAILED                    = 121;
	const c_int PCRE2_ERROR_UNMATCHED_CLOSING_PARENTHESIS  = 122;
	const c_int PCRE2_ERROR_INTERNAL_CODE_OVERFLOW         = 123;
	const c_int PCRE2_ERROR_MISSING_CONDITION_CLOSING      = 124;
	const c_int PCRE2_ERROR_LOOKBEHIND_NOT_FIXED_LENGTH    = 125;
	const c_int PCRE2_ERROR_ZERO_RELATIVE_REFERENCE        = 126;
	const c_int PCRE2_ERROR_TOO_MANY_CONDITION_BRANCHES    = 127;
	const c_int PCRE2_ERROR_CONDITION_ASSERTION_EXPECTED   = 128;
	const c_int PCRE2_ERROR_BAD_RELATIVE_REFERENCE         = 129;
	const c_int PCRE2_ERROR_UNKNOWN_POSIX_CLASS            = 130;
	const c_int PCRE2_ERROR_INTERNAL_STUDY_ERROR           = 131;
	const c_int PCRE2_ERROR_UNICODE_NOT_SUPPORTED          = 132;
	const c_int PCRE2_ERROR_PARENTHESES_STACK_CHECK        = 133;
	const c_int PCRE2_ERROR_CODE_POINT_TOO_BIG             = 134;
	const c_int PCRE2_ERROR_LOOKBEHIND_TOO_COMPLICATED     = 135;
	const c_int PCRE2_ERROR_LOOKBEHIND_INVALID_BACKSLASH_C = 136;
	const c_int PCRE2_ERROR_UNSUPPORTED_ESCAPE_SEQUENCE    = 137;
	const c_int PCRE2_ERROR_CALLOUT_NUMBER_TOO_BIG         = 138;
	const c_int PCRE2_ERROR_MISSING_CALLOUT_CLOSING        = 139;
	const c_int PCRE2_ERROR_ESCAPE_INVALID_IN_VERB         = 140;
	const c_int PCRE2_ERROR_UNRECOGNIZED_AFTER_QUERY_P     = 141;
	const c_int PCRE2_ERROR_MISSING_NAME_TERMINATOR        = 142;
	const c_int PCRE2_ERROR_DUPLICATE_SUBPATTERN_NAME      = 143;
	const c_int PCRE2_ERROR_INVALID_SUBPATTERN_NAME        = 144;
	const c_int PCRE2_ERROR_UNICODE_PROPERTIES_UNAVAILABLE = 145;
	const c_int PCRE2_ERROR_MALFORMED_UNICODE_PROPERTY     = 146;
	const c_int PCRE2_ERROR_UNKNOWN_UNICODE_PROPERTY       = 147;
	const c_int PCRE2_ERROR_SUBPATTERN_NAME_TOO_LONG       = 148;
	const c_int PCRE2_ERROR_TOO_MANY_NAMED_SUBPATTERNS     = 149;
	const c_int PCRE2_ERROR_CLASS_INVALID_RANGE            = 150;
	const c_int PCRE2_ERROR_OCTAL_BYTE_TOO_BIG             = 151;
	const c_int PCRE2_ERROR_INTERNAL_OVERRAN_WORKSPACE     = 152;
	const c_int PCRE2_ERROR_INTERNAL_MISSING_SUBPATTERN    = 153;
	const c_int PCRE2_ERROR_DEFINE_TOO_MANY_BRANCHES       = 154;
	const c_int PCRE2_ERROR_BACKSLASH_O_MISSING_BRACE      = 155;
	const c_int PCRE2_ERROR_INTERNAL_UNKNOWN_NEWLINE       = 156;
	const c_int PCRE2_ERROR_BACKSLASH_G_SYNTAX             = 157;
	const c_int PCRE2_ERROR_PARENS_QUERY_R_MISSING_CLOSING = 158;
	/* Error 159 is obsolete and should now never occur */
	const c_int PCRE2_ERROR_VERB_ARGUMENT_NOT_ALLOWED      = 159;
	const c_int PCRE2_ERROR_VERB_UNKNOWN                   = 160;
	const c_int PCRE2_ERROR_SUBPATTERN_NUMBER_TOO_BIG      = 161;
	const c_int PCRE2_ERROR_SUBPATTERN_NAME_EXPECTED       = 162;
	const c_int PCRE2_ERROR_INTERNAL_PARSED_OVERFLOW       = 163;
	const c_int PCRE2_ERROR_INVALID_OCTAL                  = 164;
	const c_int PCRE2_ERROR_SUBPATTERN_NAMES_MISMATCH      = 165;
	const c_int PCRE2_ERROR_MARK_MISSING_ARGUMENT          = 166;
	const c_int PCRE2_ERROR_INVALID_HEXADECIMAL            = 167;
	const c_int PCRE2_ERROR_BACKSLASH_C_SYNTAX             = 168;
	const c_int PCRE2_ERROR_BACKSLASH_K_SYNTAX             = 169;
	const c_int PCRE2_ERROR_INTERNAL_BAD_CODE_LOOKBEHINDS  = 170;
	const c_int PCRE2_ERROR_BACKSLASH_N_IN_CLASS           = 171;
	const c_int PCRE2_ERROR_CALLOUT_STRING_TOO_LONG        = 172;
	const c_int PCRE2_ERROR_UNICODE_DISALLOWED_CODE_POINT  = 173;
	const c_int PCRE2_ERROR_UTF_IS_DISABLED                = 174;
	const c_int PCRE2_ERROR_UCP_IS_DISABLED                = 175;
	const c_int PCRE2_ERROR_VERB_NAME_TOO_LONG             = 176;
	const c_int PCRE2_ERROR_BACKSLASH_U_CODE_POINT_TOO_BIG = 177;
	const c_int PCRE2_ERROR_MISSING_OCTAL_OR_HEX_DIGITS    = 178;
	const c_int PCRE2_ERROR_VERSION_CONDITION_SYNTAX       = 179;
	const c_int PCRE2_ERROR_INTERNAL_BAD_CODE_AUTO_POSSESS = 180;
	const c_int PCRE2_ERROR_CALLOUT_NO_STRING_DELIMITER    = 181;
	const c_int PCRE2_ERROR_CALLOUT_BAD_STRING_DELIMITER   = 182;
	const c_int PCRE2_ERROR_BACKSLASH_C_CALLER_DISABLED    = 183;
	const c_int PCRE2_ERROR_QUERY_BARJX_NEST_TOO_DEEP      = 184;
	const c_int PCRE2_ERROR_BACKSLASH_C_LIBRARY_DISABLED   = 185;
	const c_int PCRE2_ERROR_PATTERN_TOO_COMPLICATED        = 186;
	const c_int PCRE2_ERROR_LOOKBEHIND_TOO_LONG            = 187;
	const c_int PCRE2_ERROR_PATTERN_STRING_TOO_LONG        = 188;
	const c_int PCRE2_ERROR_INTERNAL_BAD_CODE              = 189;
	const c_int PCRE2_ERROR_INTERNAL_BAD_CODE_IN_SKIP      = 190;
	const c_int PCRE2_ERROR_NO_SURROGATES_IN_UTF16         = 191;
	const c_int PCRE2_ERROR_BAD_LITERAL_OPTIONS            = 192;
	const c_int PCRE2_ERROR_SUPPORTED_ONLY_IN_UNICODE      = 193;
	const c_int PCRE2_ERROR_INVALID_HYPHEN_IN_OPTIONS      = 194;
	const c_int PCRE2_ERROR_ALPHA_ASSERTION_UNKNOWN        = 195;
	const c_int PCRE2_ERROR_SCRIPT_RUN_NOT_AVAILABLE       = 196;
	const c_int PCRE2_ERROR_TOO_MANY_CAPTURES              = 197;
	const c_int PCRE2_ERROR_MISSING_OCTAL_DIGIT            = 198;
	const c_int PCRE2_ERROR_BACKSLASH_K_IN_LOOKAROUND      = 199;
	const c_int PCRE2_ERROR_MAX_VAR_LOOKBEHIND_EXCEEDED    = 200;
	const c_int PCRE2_ERROR_PATTERN_COMPILED_SIZE_TOO_BIG  = 201;
	const c_int PCRE2_ERROR_OVERSIZE_PYTHON_OCTAL          = 202;
	const c_int PCRE2_ERROR_CALLOUT_CALLER_DISABLED        = 203;
	const c_int PCRE2_ERROR_EXTRA_CASING_REQUIRES_UNICODE  = 204;
	const c_int PCRE2_ERROR_TURKISH_CASING_REQUIRES_UTF    = 205;
	const c_int PCRE2_ERROR_EXTRA_CASING_INCOMPATIBLE      = 206;
	const c_int PCRE2_ERROR_ECLASS_NEST_TOO_DEEP           = 207;
	const c_int PCRE2_ERROR_ECLASS_INVALID_OPERATOR        = 208;
	const c_int PCRE2_ERROR_ECLASS_UNEXPECTED_OPERATOR     = 209;
	const c_int PCRE2_ERROR_ECLASS_EXPECTED_OPERAND        = 210;
	const c_int PCRE2_ERROR_ECLASS_MIXED_OPERATORS         = 211;
	const c_int PCRE2_ERROR_ECLASS_HINT_SQUARE_BRACKET     = 212;
	const c_int PCRE2_ERROR_PERL_ECLASS_UNEXPECTED_EXPR    = 213;
	const c_int PCRE2_ERROR_PERL_ECLASS_EMPTY_EXPR         = 214;
	const c_int PCRE2_ERROR_PERL_ECLASS_MISSING_CLOSE      = 215;
	const c_int PCRE2_ERROR_PERL_ECLASS_UNEXPECTED_CHAR    = 216;

	/* "Expected" matching error codes: no match and partial match. */

	const c_int PCRE2_ERROR_NOMATCH          = (-1);
	const c_int PCRE2_ERROR_PARTIAL          = (-2);

	/* Error codes for UTF-8 validity checks */

	const c_int PCRE2_ERROR_UTF8_ERR1        = (-3);
	const c_int PCRE2_ERROR_UTF8_ERR2        = (-4);
	const c_int PCRE2_ERROR_UTF8_ERR3        = (-5);
	const c_int PCRE2_ERROR_UTF8_ERR4        = (-6);
	const c_int PCRE2_ERROR_UTF8_ERR5        = (-7);
	const c_int PCRE2_ERROR_UTF8_ERR6        = (-8);
	const c_int PCRE2_ERROR_UTF8_ERR7        = (-9);
	const c_int PCRE2_ERROR_UTF8_ERR8       = (-10);
	const c_int PCRE2_ERROR_UTF8_ERR9       = (-11);
	const c_int PCRE2_ERROR_UTF8_ERR10      = (-12);
	const c_int PCRE2_ERROR_UTF8_ERR11      = (-13);
	const c_int PCRE2_ERROR_UTF8_ERR12      = (-14);
	const c_int PCRE2_ERROR_UTF8_ERR13      = (-15);
	const c_int PCRE2_ERROR_UTF8_ERR14      = (-16);
	const c_int PCRE2_ERROR_UTF8_ERR15      = (-17);
	const c_int PCRE2_ERROR_UTF8_ERR16      = (-18);
	const c_int PCRE2_ERROR_UTF8_ERR17      = (-19);
	const c_int PCRE2_ERROR_UTF8_ERR18      = (-20);
	const c_int PCRE2_ERROR_UTF8_ERR19      = (-21);
	const c_int PCRE2_ERROR_UTF8_ERR20      = (-22);
	const c_int PCRE2_ERROR_UTF8_ERR21      = (-23);

	/* Error codes for UTF-16 validity checks */

	const c_int PCRE2_ERROR_UTF16_ERR1      = (-24);
	const c_int PCRE2_ERROR_UTF16_ERR2      = (-25);
	const c_int PCRE2_ERROR_UTF16_ERR3      = (-26);

	/* Error codes for UTF-32 validity checks */

	const c_int PCRE2_ERROR_UTF32_ERR1      = (-27);
	const c_int PCRE2_ERROR_UTF32_ERR2      = (-28);

	/* Miscellaneous error codes for pcre2[_dfa]_match(), substring extraction
	functions, context functions, and serializing functions. They are in numerical
	order. Originally they were in alphabetical order too, but now that PCRE2 is
	released, the numbers must not be changed. */

	const c_int PCRE2_ERROR_BADDATA           = (-29);
	const c_int PCRE2_ERROR_MIXEDTABLES       = (-30); /* Name was changed */
	const c_int PCRE2_ERROR_BADMAGIC          = (-31);
	const c_int PCRE2_ERROR_BADMODE           = (-32);
	const c_int PCRE2_ERROR_BADOFFSET         = (-33);
	const c_int PCRE2_ERROR_BADOPTION         = (-34);
	const c_int PCRE2_ERROR_BADREPLACEMENT    = (-35);
	const c_int PCRE2_ERROR_BADUTFOFFSET      = (-36);
	const c_int PCRE2_ERROR_CALLOUT           = (-37); /* Never used by PCRE2 itself */
	const c_int PCRE2_ERROR_DFA_BADRESTART    = (-38);
	const c_int PCRE2_ERROR_DFA_RECURSE       = (-39);
	const c_int PCRE2_ERROR_DFA_UCOND         = (-40);
	const c_int PCRE2_ERROR_DFA_UFUNC         = (-41);
	const c_int PCRE2_ERROR_DFA_UITEM         = (-42);
	const c_int PCRE2_ERROR_DFA_WSSIZE        = (-43);
	const c_int PCRE2_ERROR_INTERNAL          = (-44);
	const c_int PCRE2_ERROR_JIT_BADOPTION     = (-45);
	const c_int PCRE2_ERROR_JIT_STACKLIMIT    = (-46);
	const c_int PCRE2_ERROR_MATCHLIMIT        = (-47);
	const c_int PCRE2_ERROR_NOMEMORY          = (-48);
	const c_int PCRE2_ERROR_NOSUBSTRING       = (-49);
	const c_int PCRE2_ERROR_NOUNIQUESUBSTRING = (-50);
	const c_int PCRE2_ERROR_NULL              = (-51);
	const c_int PCRE2_ERROR_RECURSELOOP       = (-52);
	const c_int PCRE2_ERROR_DEPTHLIMIT        = (-53);
	const c_int PCRE2_ERROR_RECURSIONLIMIT    = (-53); /* Obsolete synonym */
	const c_int PCRE2_ERROR_UNAVAILABLE       = (-54);
	const c_int PCRE2_ERROR_UNSET             = (-55);
	const c_int PCRE2_ERROR_BADOFFSETLIMIT    = (-56);
	const c_int PCRE2_ERROR_BADREPESCAPE      = (-57);
	const c_int PCRE2_ERROR_REPMISSINGBRACE   = (-58);
	const c_int PCRE2_ERROR_BADSUBSTITUTION   = (-59);
	const c_int PCRE2_ERROR_BADSUBSPATTERN    = (-60);
	const c_int PCRE2_ERROR_TOOMANYREPLACE    = (-61);
	const c_int PCRE2_ERROR_BADSERIALIZEDDATA = (-62);
	const c_int PCRE2_ERROR_HEAPLIMIT         = (-63);
	const c_int PCRE2_ERROR_CONVERT_SYNTAX    = (-64);
	const c_int PCRE2_ERROR_INTERNAL_DUPMATCH = (-65);
	const c_int PCRE2_ERROR_DFA_UINVALID_UTF  = (-66);
	const c_int PCRE2_ERROR_INVALIDOFFSET     = (-67);
	const c_int PCRE2_ERROR_JIT_UNSUPPORTED   = (-68);
	const c_int PCRE2_ERROR_REPLACECASE       = (-69);
	const c_int PCRE2_ERROR_TOOLARGEREPLACE   = (-70);


	/* Request types for pcre2_pattern_info() */

	const c_int PCRE2_INFO_ALLOPTIONS            = 0;
	const c_int PCRE2_INFO_ARGOPTIONS            = 1;
	const c_int PCRE2_INFO_BACKREFMAX            = 2;
	const c_int PCRE2_INFO_BSR                   = 3;
	const c_int PCRE2_INFO_CAPTURECOUNT          = 4;
	const c_int PCRE2_INFO_FIRSTCODEUNIT         = 5;
	const c_int PCRE2_INFO_FIRSTCODETYPE         = 6;
	const c_int PCRE2_INFO_FIRSTBITMAP           = 7;
	const c_int PCRE2_INFO_HASCRORLF             = 8;
	const c_int PCRE2_INFO_JCHANGED              = 9;
	const c_int PCRE2_INFO_JITSIZE              = 10;
	const c_int PCRE2_INFO_LASTCODEUNIT         = 11;
	const c_int PCRE2_INFO_LASTCODETYPE         = 12;
	const c_int PCRE2_INFO_MATCHEMPTY           = 13;
	const c_int PCRE2_INFO_MATCHLIMIT           = 14;
	const c_int PCRE2_INFO_MAXLOOKBEHIND        = 15;
	const c_int PCRE2_INFO_MINLENGTH            = 16;
	const c_int PCRE2_INFO_NAMECOUNT            = 17;
	const c_int PCRE2_INFO_NAMEENTRYSIZE        = 18;
	const c_int PCRE2_INFO_NAMETABLE            = 19;
	const c_int PCRE2_INFO_NEWLINE              = 20;
	const c_int PCRE2_INFO_DEPTHLIMIT           = 21;
	const c_int PCRE2_INFO_RECURSIONLIMIT       = 21; /* Obsolete synonym */
	const c_int PCRE2_INFO_SIZE                 = 22;
	const c_int PCRE2_INFO_HASBACKSLASHC        = 23;
	const c_int PCRE2_INFO_FRAMESIZE            = 24;
	const c_int PCRE2_INFO_HEAPLIMIT            = 25;
	const c_int PCRE2_INFO_EXTRAOPTIONS         = 26;

	/* Request types for pcre2_config(). */

	const c_int PCRE2_CONFIG_BSR                     = 0;
	const c_int PCRE2_CONFIG_JIT                     = 1;
	const c_int PCRE2_CONFIG_JITTARGET               = 2;
	const c_int PCRE2_CONFIG_LINKSIZE                = 3;
	const c_int PCRE2_CONFIG_MATCHLIMIT              = 4;
	const c_int PCRE2_CONFIG_NEWLINE                 = 5;
	const c_int PCRE2_CONFIG_PARENSLIMIT             = 6;
	const c_int PCRE2_CONFIG_DEPTHLIMIT              = 7;
	const c_int PCRE2_CONFIG_RECURSIONLIMIT          = 7; /* Obsolete synonym */
	const c_int PCRE2_CONFIG_STACKRECURSE            = 8; /* Obsolete */
	const c_int PCRE2_CONFIG_UNICODE                 = 9;
	const c_int PCRE2_CONFIG_UNICODE_VERSION        = 10;
	const c_int PCRE2_CONFIG_VERSION                = 11;
	const c_int PCRE2_CONFIG_HEAPLIMIT              = 12;
	const c_int PCRE2_CONFIG_NEVER_BACKSLASH_C      = 13;
	const c_int PCRE2_CONFIG_COMPILED_WIDTHS        = 14;
	const c_int PCRE2_CONFIG_TABLES_LENGTH          = 15;

	/* Optimization directives for pcre2_set_optimize().
	For binary compatibility, only add to this list; do not renumber. */

	const c_int PCRE2_OPTIMIZATION_NONE    = 0;
	const c_int PCRE2_OPTIMIZATION_FULL    = 1;

	const c_int PCRE2_AUTO_POSSESS         = 64;
	const c_int PCRE2_AUTO_POSSESS_OFF     = 65;
	const c_int PCRE2_DOTSTAR_ANCHOR       = 66;
	const c_int PCRE2_DOTSTAR_ANCHOR_OFF   = 67;
	const c_int PCRE2_START_OPTIMIZE       = 68;
	const c_int PCRE2_START_OPTIMIZE_OFF   = 69;

	/* Types used in pcre2_set_substitute_case_callout().

	PCRE2_SUBSTITUTE_CASE_LOWER and PCRE2_SUBSTITUTE_CASE_UPPER are passed to the
	callout to indicate that the case of the entire callout input should be
	case-transformed. PCRE2_SUBSTITUTE_CASE_TITLE_FIRST is passed to indicate that
	only the first character or glyph should be transformed to Unicode titlecase,
	and the rest to lowercase. */

	const c_int PCRE2_SUBSTITUTE_CASE_LOWER        = 1;
	const c_int PCRE2_SUBSTITUTE_CASE_UPPER        = 2;
	const c_int PCRE2_SUBSTITUTE_CASE_TITLE_FIRST  = 3;

	/* Types for code units in patterns and subject strings. */

	public typealias PCRE2_UCHAR8 = uint8_t;
	public typealias PCRE2_UCHAR16 = uint16_t;
	public typealias PCRE2_UCHAR32 = uint32_t;

	public typealias PCRE2_SPTR8 = PCRE2_UCHAR8*;
	public typealias PCRE2_SPTR16 = PCRE2_UCHAR16*;
	public typealias PCRE2_SPTR32 = PCRE2_UCHAR32*;

	/* The PCRE2_SIZE type is used for all string lengths and offsets in PCRE2,
	including pattern offsets for errors and subject offsets after a match. We
	define special values to indicate zero-terminated strings and unset offsets in
	the offset vector (ovector). */

	public typealias PCRE2_SIZE            = size_t;
	//const PCRE2_SIZE_MAX        = SIZE_MAX;

	public const uint64 PCRE2_ZERO_TERMINATED = (~(PCRE2_SIZE)0);
	// #define PCRE2_UNSET           (~(PCRE2_SIZE)0)

	/* Generic types for opaque structures and JIT callback functions. These
	declarations are defined in a macro that is expanded for each width later. */

	// #define PCRE2_TYPES_LIST
	// struct pcre2_real_general_context;
	public struct pcre2_general_context;
	//
	// struct pcre2_real_compile_context;
	public struct pcre2_compile_context;
	//
	// struct pcre2_real_match_context;
	public struct pcre2_match_context;
	//
	// struct pcre2_real_convert_context;
	public struct pcre2_convert_context;
	//
	// struct pcre2_real_code;
	public struct pcre2_code;
	//
	// struct pcre2_real_match_data;
	public struct pcre2_match_data;
	//
	// struct pcre2_real_jit_stack;
	public struct pcre2_jit_stack;
	//
	// typedef pcre2_jit_stack *(*pcre2_jit_callback)(void*);


	/* The structures for passing out data via callout functions. We use structures
	so that new fields can be added on the end in future versions, without changing
	the API of the function, thereby allowing old clients to work without
	modification. Define the generic versions in a macro; the width-specific
	versions are generated from this macro below. */

	/* Flags for the callout_flags field. These are cleared after a callout. */

	// #define PCRE2_CALLOUT_STARTMATCH    0x00000001u  /* Set for each bumpalong */
	// #define PCRE2_CALLOUT_BACKTRACK     0x00000002u  /* Set after a backtrack */

	public struct pcre2_callout_block
	{
		uint32_t      version; /* Identifies version of block */
		/* ------------------------ Version 0 ------------------------------- */
		uint32_t      callout_number; /* Number compiled into pattern */
		uint32_t      capture_top; /* Max current capture */
		uint32_t      capture_last; /* Most recently closed capture */
		PCRE2_SIZE   * offset_vector; /* The offset vector */
		PCRE2_SPTR    mark; /* Pointer to current mark or NULL */
		PCRE2_SPTR    subject; /* The subject being matched */
		PCRE2_SIZE    subject_length; /* The length of the subject */
		PCRE2_SIZE    start_match; /* Offset to start of this match attempt */
		PCRE2_SIZE    current_position; /* Where we currently are in the subject */
		PCRE2_SIZE    pattern_position; /* Offset to next item in the pattern */
		PCRE2_SIZE    next_item_length; /* Length of next item in the pattern */
		/* ------------------- Added for Version 1 -------------------------- */
		PCRE2_SIZE    callout_string_offset; /* Offset to string within pattern */
		PCRE2_SIZE    callout_string_length; /* Length of string compiled into pattern */
		PCRE2_SPTR    callout_string; /* String compiled into pattern */
		/* ------------------- Added for Version 2 -------------------------- */
		uint32_t      callout_flags; /* See above for list */
		/* ------------------------------------------------------------------ */
	}

	public struct pcre2_callout_enumerate_block
	{
		uint32_t      version; /* Identifies version of block */
		/* ------------------------ Version 0 ------------------------------- */
		PCRE2_SIZE    pattern_position; /* Offset to next item in the pattern */
		PCRE2_SIZE    next_item_length; /* Length of next item in the pattern */
		uint32_t      callout_number; /* Number compiled into pattern */
		PCRE2_SIZE    callout_string_offset; /* Offset to string within pattern */
		PCRE2_SIZE    callout_string_length; /* Length of string compiled into pattern */
		PCRE2_SPTR    callout_string; /* String compiled into pattern */
		/* ------------------------------------------------------------------ */
	}

	public struct pcre2_substitute_callout_block
	{
		uint32_t      	version; /* Identifies version of block */
		/* ------------------------ Version 0 ------------------------------- */
		PCRE2_SPTR    	input; /* Pointer to input subject string */
		PCRE2_SPTR    	output; /* Pointer to output buffer */
		PCRE2_SIZE[2] 	output_offsets; /* Changed portion of the output */
		PCRE2_SIZE* 	ovector; /* Pointer to current ovector */
		uint32_t      	oveccount; /* Count of pairs set in ovector */
		uint32_t      	subscount; /* Substitution number */
		/* ------------------------------------------------------------------ */
	}


	/* List the generic forms of all other functions in macros, which will be
	expanded for each width below. Start with functions that give general
	information. */

	const c_int PCRE2_CODE_UNIT_WIDTH = 8;

	[LinkName($"pcre2_config_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_config(uint32_t what, void* where_);

	/* Functions for manipulating contexts. */

	[LinkName($"pcre2_general_context_copy_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_general_context* pcre2_general_context_copy(pcre2_general_context* gcontext);

	[LinkName($"pcre2_general_context_create_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_general_context* pcre2_general_context_create(function void*(size_t, void*) private_malloc, function void(void*, void*) private_free, void* memory_data);

	[LinkName($"pcre2_general_context_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_general_context_free(pcre2_general_context* gcontext);


	[LinkName($"pcre2_compile_context_create_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_compile_context* pcre2_compile_context_create(pcre2_general_context* gcontext);

	[LinkName($"pcre2_compile_context_copy_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_compile_context* pcre2_compile_context_copy(pcre2_compile_context* ccontext);

	[LinkName($"pcre2_compile_context_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_compile_context_free(pcre2_compile_context* ccontext);

	[LinkName($"pcre2_set_bsr_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_bsr(pcre2_compile_context* ccontext, uint32_t value);

	[LinkName($"pcre2_set_character_tables_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_character_tables(pcre2_compile_context* ccontext, uint8_t* tables);

	[LinkName($"pcre2_set_compile_extra_options_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_compile_extra_options(pcre2_compile_context* ccontext, uint32_t extra_options);

	[LinkName($"pcre2_set_max_pattern_length_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_max_pattern_length(pcre2_compile_context* ccontext, PCRE2_SIZE value);

	[LinkName($"pcre2_set_max_pattern_compiled_length_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_max_pattern_compiled_length(pcre2_compile_context* ccontext, PCRE2_SIZE value);

	[LinkName($"pcre2_set_max_varlookbehind_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_max_varlookbehind(pcre2_compile_context* ccontext, uint32_t value);

	[LinkName($"pcre2_set_newline_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_newline(pcre2_compile_context* ccontext, uint32_t value);

	[LinkName($"pcre2_set_parens_nest_limit_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_parens_nest_limit(pcre2_compile_context* ccontext, uint32_t value);

	[LinkName($"pcre2_set_compile_recursion_guard_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_compile_recursion_guard(pcre2_compile_context* ccontext, function c_int(uint32_t, void*) guard_function, void* user_data);

	[LinkName($"pcre2_set_optimize_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_optimize(pcre2_compile_context* ccontext, uint32_t directive);


	[LinkName($"pcre2_match_context_create_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_match_context* pcre2_match_context_create(pcre2_general_context* gcontext);

	[LinkName($"pcre2_match_context_copy_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_match_context* pcre2_match_context_copy(pcre2_match_context* mcontext);

	[LinkName($"pcre2_match_context_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_match_context_free(pcre2_match_context* mcontext);

	[LinkName($"pcre2_set_callout_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_callout(pcre2_match_context* mcontext, function c_int(pcre2_callout_block*, void*) callout_function, void* callout_data);

	[LinkName($"pcre2_set_substitute_callout_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_substitute_callout(pcre2_match_context* mcontext, function c_int(pcre2_substitute_callout_block*, void*) callout_function, void* callout_data);

	[LinkName($"pcre2_set_substitute_case_callout_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_substitute_case_callout(pcre2_match_context* mcontext, function PCRE2_SIZE(PCRE2_SPTR, PCRE2_SIZE, PCRE2_UCHAR*, PCRE2_SIZE, c_int, void*) callout_function, void* callout_data);

	[LinkName($"pcre2_set_offset_limit_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_offset_limit(pcre2_match_context* mcontext, PCRE2_SIZE value);

	[LinkName($"pcre2_set_heap_limit_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_heap_limit(pcre2_match_context* mcontext, uint32_t value);

	[LinkName($"pcre2_set_match_limit_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_match_limit(pcre2_match_context* mcontext, uint32_t value);

	[LinkName($"pcre2_set_depth_limit_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_depth_limit(pcre2_match_context* mcontext, uint32_t value);

	// These functions became obsolete at release 10.30 and are retained only for backward compatibility. They should not be used in new code. The first is replaced by pcre2_set_depth_limit(); the second is no longer needed and has no effect (it always returns zero).

	[LinkName($"pcre2_set_recursion_limit_{PCRE2_CODE_UNIT_WIDTH}"), Obsolete("replaced by pcre2_set_depth_limit()")]
	public static extern c_int pcre2_set_recursion_limit(pcre2_match_context* mcontext, uint32_t value);

	[LinkName($"pcre2_set_recursion_memory_management_{PCRE2_CODE_UNIT_WIDTH}"), Obsolete("no longer needed and has no effect (it always returns zero)")]
	public static extern c_int pcre2_set_recursion_memory_management(pcre2_match_context* mcontext, function void*(size_t, void*) private_malloc, function void(void*, void*) private_free, void* memory_data);


	[LinkName($"pcre2_convert_context_create_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_convert_context* pcre2_convert_context_create(pcre2_general_context* gcontext);

	[LinkName($"pcre2_convert_context_copy_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_convert_context* pcre2_convert_context_copy(pcre2_convert_context* cvcontext);

	[LinkName($"pcre2_convert_context_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_convert_context_free(pcre2_convert_context* cvcontext);

	[LinkName($"pcre2_set_glob_escape_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_glob_escape(pcre2_convert_context* cvcontext, uint32_t escape_char);

	[LinkName($"pcre2_set_glob_separator_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_set_glob_separator(pcre2_convert_context* cvcontext, uint32_t separator_char);


	/* Functions concerned with compiling a pattern to PCRE internal code. */

	[LinkName($"pcre2_compile_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_code* pcre2_compile(PCRE2_SPTR pattern, PCRE2_SIZE length, uint32_t options, c_int* error_code, PCRE2_SIZE* error_offset, pcre2_compile_context* ccontext);

	[LinkName($"pcre2_code_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_code_free(pcre2_code* code);

	[LinkName($"pcre2_code_copy_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_code* pcre2_code_copy(pcre2_code* code);

	[LinkName($"pcre2_code_copy_with_tables_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_code* pcre2_code_copy_with_tables(pcre2_code* code);


	/* Functions that give information about a compiled pattern. */

	[LinkName($"pcre2_pattern_info_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_pattern_info(pcre2_code* code, uint32_t what, void* where_);

	[LinkName($"pcre2_callout_enumerate_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_callout_enumerate(pcre2_code* code, function c_int(pcre2_callout_enumerate_block*, void*) callback, void* user_data);


	/* Functions for running a match and inspecting the result. */

	[LinkName($"pcre2_match_data_create_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_match_data* pcre2_match_data_create(uint32_t ovecsize, pcre2_general_context* gcontext);

	[LinkName($"pcre2_match_data_create_from_pattern_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_match_data* pcre2_match_data_create_from_pattern(pcre2_code* code, pcre2_general_context* gcontext);

	[LinkName($"pcre2_dfa_match_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_dfa_match(pcre2_code* code, PCRE2_SPTR subject, PCRE2_SIZE length, PCRE2_SIZE startoffset, uint32_t options, pcre2_match_data* match_data, pcre2_match_context* mcontext, c_int* workspace, PCRE2_SIZE wscount);

	[LinkName($"pcre2_match_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_match(pcre2_code* code, PCRE2_SPTR subject, PCRE2_SIZE length, PCRE2_SIZE startoffset, uint32_t options, pcre2_match_data* match_data, pcre2_match_context* mcontext);

	[LinkName($"pcre2_match_data_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_match_data_free(pcre2_match_data* match_data);

	[LinkName($"pcre2_get_mark_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern PCRE2_SPTR pcre2_get_mark(pcre2_match_data* match_data);

	[LinkName($"pcre2_get_match_data_size_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern PCRE2_SIZE pcre2_get_match_data_size(pcre2_match_data* match_data);

	[LinkName($"pcre2_get_match_data_heapframes_size_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern PCRE2_SIZE pcre2_get_match_data_heapframes_size(pcre2_match_data* match_data);

	[LinkName($"pcre2_get_ovector_count_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern uint32_t pcre2_get_ovector_count(pcre2_match_data* match_data);

	[LinkName($"pcre2_get_ovector_pointer_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern PCRE2_SIZE* pcre2_get_ovector_pointer(pcre2_match_data* match_data);

	[LinkName($"pcre2_get_startchar_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern PCRE2_SIZE pcre2_get_startchar(pcre2_match_data* match_data);


	/* Convenience functions for handling matched substrings. */

	[LinkName($"pcre2_substring_copy_byname_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_copy_byname(pcre2_match_data* match_data, PCRE2_SPTR name, PCRE2_UCHAR* buffer, PCRE2_SIZE* bufflen);

	[LinkName($"pcre2_substring_copy_bynumber_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_copy_bynumber(pcre2_match_data* match_data, uint32_t number, PCRE2_UCHAR* buffer, PCRE2_SIZE* bufflen);

	[LinkName($"pcre2_substring_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_substring_free(PCRE2_UCHAR* buffer);

	[LinkName($"pcre2_substring_get_byname_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_get_byname(pcre2_match_data* match_data, PCRE2_SPTR name, PCRE2_UCHAR** bufferptr, PCRE2_SIZE* bufflen);

	[LinkName($"pcre2_substring_get_bynumber_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_get_bynumber(pcre2_match_data* match_data, uint32_t number, PCRE2_UCHAR** bufferptr, PCRE2_SIZE* bufflen);

	[LinkName($"pcre2_substring_length_byname_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_length_byname(pcre2_match_data* match_data, PCRE2_SPTR name, PCRE2_SIZE* length);

	[LinkName($"pcre2_substring_length_bynumber_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_length_bynumber(pcre2_match_data* match_data, uint32_t number, PCRE2_SIZE* length);

	[LinkName($"pcre2_substring_nametable_scan_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int  pcre2_substring_nametable_scan(pcre2_code* code, PCRE2_SPTR name, PCRE2_SPTR* first, PCRE2_SPTR* last);

	[LinkName($"pcre2_substring_number_from_name_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_number_from_name(pcre2_code* code, PCRE2_SPTR name);

	[LinkName($"pcre2_substring_list_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_substring_list_free(PCRE2_UCHAR** list);

	[LinkName($"pcre2_substring_list_get_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substring_list_get(pcre2_match_data* match_data, PCRE2_UCHAR*** listptr, PCRE2_SIZE** lengthsptr);


	/* Functions for serializing / deserializing compiled patterns. */

	[LinkName($"pcre2_serialize_encode_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern int32_t pcre2_serialize_encode(pcre2_code** codes, int32_t number_of_codes, uint8_t** serialized_bytes, PCRE2_SIZE* serialized_size, pcre2_general_context* gcontext);

	[LinkName($"pcre2_serialize_decode_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern int32_t pcre2_serialize_decode(pcre2_code** codes, int32_t number_of_codes, uint8_t* bytes, pcre2_general_context* gcontext);

	[LinkName($"pcre2_serialize_get_number_of_codes_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern int32_t pcre2_serialize_get_number_of_codes(uint8_t* bytes);

	[LinkName($"pcre2_serialize_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_serialize_free(uint8_t* bytes);


	/* Convenience function for match + substitute. */

	[LinkName($"pcre2_substitute_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_substitute(pcre2_code* code, PCRE2_SPTR subject, PCRE2_SIZE length, PCRE2_SIZE startoffset, uint32_t options, pcre2_match_data* match_data, pcre2_match_context* mcontext, PCRE2_SPTR replacement, PCRE2_SIZE rlength, PCRE2_UCHAR* outputbuffer, PCRE2_SIZE* outlengthptr);


	/* Functions for converting pattern source strings. */

	[LinkName($"pcre2_pattern_convert_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_pattern_convert(PCRE2_SPTR pattern, PCRE2_SIZE length, uint32_t options, PCRE2_UCHAR** buffer, PCRE2_SIZE* blength, pcre2_convert_context* cvcontext);

	[LinkName($"pcre2_converted_pattern_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_converted_pattern_free(PCRE2_UCHAR* onverted_pattern);


	/* Functions for JIT processing */

	[LinkName($"pcre2_jit_compile_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_jit_compile(pcre2_code* code, uint32_t options);

	[LinkName($"pcre2_jit_match_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_jit_match(pcre2_code* code, PCRE2_SPTR subject, PCRE2_SIZE length, PCRE2_SIZE startoffset, uint32_t options, pcre2_match_data* match_data, pcre2_match_context* mcontext);

	[LinkName($"pcre2_jit_free_unused_memory_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_jit_free_unused_memory(pcre2_general_context* gcontext);

	[LinkName($"pcre2_jit_stack_create_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern pcre2_jit_stack* pcre2_jit_stack_create(size_t start_size, size_t maxsize, pcre2_general_context* gcontext);

	[LinkName($"pcre2_jit_stack_assign_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_jit_stack_assign(pcre2_match_context* mcontext, pcre2_jit_callback callback, void* callback_data);

	[LinkName($"pcre2_jit_stack_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_jit_stack_free(pcre2_jit_stack* jit_stack);


	/* Other miscellaneous functions. */

	[LinkName($"pcre2_get_error_message_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern c_int pcre2_get_error_message(c_int errorcode, PCRE2_UCHAR* buffer, PCRE2_SIZE bufflen);

	[LinkName($"pcre2_maketables_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern uint8_t* pcre2_maketables(pcre2_general_context* gcontext);

	[LinkName($"pcre2_maketables_free_{PCRE2_CODE_UNIT_WIDTH}")]
	public static extern void pcre2_maketables_free(pcre2_general_context* gcontext, uint8_t* tables);

	/* Data types */
	public typealias PCRE2_UCHAR = PCRE2_UCHAR8;

	public typealias PCRE2_SPTR = PCRE2_SPTR8;

	public struct pcre2_jit_callback;
}