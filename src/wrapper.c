#include <R.h>
#include <Rinternals.h>
#include "liblouis/liblouis.h"
#include <stdlib.h>
#include <string.h>

SEXP r_translate(SEXP text, SEXP table_path) {
  const char *input     = CHAR(STRING_ELT(text, 0));
  const char *table_str = CHAR(STRING_ELT(table_path, 0));

  /* table_path is the full path to e.g. /path/to/inst/tables/en-ueb-g1.ctb */
  /* Extract the directory part to build the unicode.dis full path */
  char *path_copy = strdup(table_str);

  /* Find last slash to get directory */
  char *last_slash = strrchr(path_copy, '/');
  char full_unicode[2048];
  char full_table[2048];

  if (last_slash != NULL) {
    *last_slash = '\0';  /* path_copy is now just the directory */
  snprintf(full_unicode, sizeof(full_unicode), "%s/unicode.dis", path_copy);
  snprintf(full_table,   sizeof(full_table),   "%s/%s", path_copy, last_slash + 1);
  } else {
    snprintf(full_unicode, sizeof(full_unicode), "unicode.dis");
    snprintf(full_table,   sizeof(full_table),   "%s", table_str);
  }

  /* Combine: "full/path/unicode.dis,full/path/en-ueb-g1.ctb" */
  char combined[4096];
  snprintf(combined, sizeof(combined), "%s,%s", full_unicode, full_table);

  int inlen = (int)strlen(input);
  int outlen = inlen * 4;

  widechar *inbuf  = (widechar *) malloc(inlen  * sizeof(widechar));
  widechar *outbuf = (widechar *) malloc(outlen * sizeof(widechar));

  for (int i = 0; i < inlen; i++) {
    inbuf[i] = (widechar)(unsigned char)input[i];
  }

  lou_translateString(combined, inbuf, &inlen, outbuf, &outlen, NULL, NULL, 0);

  char *result = (char *) malloc((outlen * 3 + 1) * sizeof(char));
  int pos = 0;
  for (int i = 0; i < outlen; i++) {
    unsigned int cp = (unsigned int)outbuf[i];
    if (cp < 0x80) {
      result[pos++] = (char)cp;
    } else if (cp < 0x800) {
      result[pos++] = (char)(0xC0 | ((cp >> 6) & 0x1F));
      result[pos++] = (char)(0x80 | ( cp       & 0x3F));
    } else {
      result[pos++] = (char)(0xE0 | ((cp >> 12) & 0x0F));
      result[pos++] = (char)(0x80 | ((cp >>  6) & 0x3F));
      result[pos++] = (char)(0x80 | ( cp        & 0x3F));
    }
  }
  result[pos] = '\0';

  SEXP out = PROTECT(ScalarString(mkCharCE(result, CE_UTF8)));

  free(path_copy);
  free(inbuf);
  free(outbuf);
  free(result);

  UNPROTECT(1);
  return out;
}
