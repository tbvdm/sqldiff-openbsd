TAG=	version-3.47.0

SHA256_sqldiff.c=	417a961b0d1855f2cbc732cad75b6c71952badb5700f0b0308d1326df12398b1
SHA256_sqlite3_stdio.h=	83e749efb2f16db0954196452497a325a3a7ac66e17e52c5956bbdc3cd8e8d5a

PATH_sqldiff.c=		tool
PATH_sqlite3_stdio.h=	ext/misc

PROG=	sqldiff
NOMAN=

.if !(make(clean) || make(cleandir) || make(obj))
CFLAGS+!=	pkg-config --cflags sqlite3
LDFLAGS+!=	pkg-config --libs sqlite3
.endif

sqldiff.c: sqlite3_stdio.h

sqldiff.c sqlite3_stdio.h:
	ftp https://github.com/sqlite/sqlite/raw/${TAG}/${PATH_$@}/$@
	echo ${SHA256_$@} $@ | sha256 -c

.include <bsd.prog.mk>
