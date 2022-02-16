TAG=		version-3.37.2
SHA256=		383c022a66962c136d0ce3b7d7b69ae114c9d452b56633950f89956e40afd5e8

PROG=		sqldiff
NOMAN=

.if !(make(clean) || make(cleandir) || make(obj))
CFLAGS+!=	pkg-config --cflags sqlite3
LDFLAGS+!=	pkg-config --libs sqlite3
.endif

sqldiff.c:
	ftp https://github.com/sqlite/sqlite/raw/${TAG}/tool/sqldiff.c
	echo ${SHA256} $@ | sha256 -c

.include <bsd.prog.mk>
