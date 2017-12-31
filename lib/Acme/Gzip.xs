#ifdef __cplusplus
extern "C" {
#endif

#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef __cplusplus
} /* extern "C" */
#endif

#define NEED_newSVpvn_flags
#include "ppport.h"

#include "gzip.hpp"

MODULE = Acme::Gzip  PACKAGE = Acme::Gzip

PROTOTYPES: DISABLE

void
is_gzip(...)
PPCODE:
{
  if (items != 1 || !SvOK(ST(0))) {
    croak("is_gzip expects exactly 1 defined argument");
  }
  SV* in_sv = ST(0);
  STRLEN in_len;
  const char* in_char = SvPV(in_sv, in_len);
  std::string in(in_char, in_len);
  if (compression::gzip::is_gzip(in)) {
    XSRETURN_YES;
  } else {
    XSRETURN_NO;
  }
}

void
gzip(...)
PPCODE:
{
  if (items != 1 || !SvOK(ST(0))) {
    croak("gzip expects exactly 1 defined argument");
  }
  SV* in_sv = ST(0);
  STRLEN in_len;
  const char* in_char = SvPV(in_sv, in_len);
  std::string in(in_char, in_len);
  std::string out;
  if (compression::gzip::compress(in, out)) {
    SV* out_sv = newSVpvn_flags(out.c_str(), out.size(), SVs_TEMP);
    XPUSHs(out_sv);
    XSRETURN(1);
  } else {
    croak("gzip failed");
  }
}

void
gunzip(...)
PPCODE:
{
  if (items != 1 || !SvOK(ST(0))) {
    croak("gunzip expects exactly 1 defined argument");
  }
  SV* in_sv = ST(0);
  STRLEN in_len;
  const char* in_char = SvPV(in_sv, in_len);
  std::string in(in_char, in_len);
  std::string out;
  if (compression::gzip::decompress(in, out)) {
    SV* out_sv = newSVpvn_flags(out.c_str(), out.size(), SVs_TEMP);
    XPUSHs(out_sv);
    XSRETURN(1);
  } else {
    croak("gunzip failed");
  }
}
