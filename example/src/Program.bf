using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using System.Interop;
using static pcre2.pcre2;

namespace example;

static class Program
{
	static int Main(params String[] args)
	{
		pcre2_code* re;
		PCRE2_SPTR pattern; /* PCRE2_SPTR is a pointer to unsigned code units of */
		PCRE2_SPTR subject; /* the appropriate width (8, 16, or 32 bits). */
		PCRE2_SPTR name_table;

		c_int crlf_is_newline;
		c_int errornumber;
		c_int find_all;
		//int i;
		c_int namecount;
		c_int name_entry_size;
		c_int rc;
		c_int utf8;

		uint32 option_bits;
		uint32 newline;

		PCRE2_SIZE erroroffset;
		PCRE2_SIZE* ovector;

		c_int subject_length;
		pcre2_match_data* match_data;

		let subStr = "123test456";
		pattern = (PCRE2_SPTR)"[a-z]";
		subject = (PCRE2_SPTR)subStr.Ptr;
		subject_length = (.)subStr.Length;

		re = pcre2_compile(
			pattern, /* the pattern */
			PCRE2_ZERO_TERMINATED, /* indicates pattern is zero-terminated */
			0, /* default options */
			&errornumber, /* for error number */
			&erroroffset, /* for error offset */
			null);

		match_data = pcre2_match_data_create_from_pattern(re, null);

		rc = pcre2_match(re, (.)subStr, 10, 0, 0, match_data, null);

		if (rc < 0)
		{
			Debug.WriteLine("match fail");
		}

		ovector = pcre2_get_ovector_pointer(match_data);

		Debug.WriteLine($"Match succeeded at offset {(int)ovector[0]}");

		/*************************************************************************
		* We have found the first match within the subject string. If the output *
		* vector wasn't big enough, say so. Then output any substrings that were *
		* captured.                                                              *
		*************************************************************************/

		/* The output vector wasn't big enough. This should not happen, because we used
		pcre2_match_data_create_from_pattern() above. */

		if (rc == 0)
			Debug.WriteLine("ovector was not big enough for all the captured substrings");

		for (let i < rc)
		{
			PCRE2_SPTR substring_start = subject + ovector[2 * i];
			uint64 substring_length = ovector[2 * i + 1] - ovector[2 * i];
			Debug.WriteLine($"{substring_length}: {StringView((char8*)substring_start)})");
		}

		pcre2_match_data_free(match_data);

		pcre2_code_free(re);

		return 0;
	}
}