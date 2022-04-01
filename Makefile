TAG=		version-3.38.2
SHA256=		9708d6c6ba6b61a3bb220b49a65585012cbbecf1e16129302116598f5efb4cb3

PROG=		sqldiff
NOMAN=

.if !(make(clean) || make(cleandir) || make(obj))
CFLAGS+!=	pkg-config --cflags sqlite3
LDFLAGS+!=	pkg-config --libs sqlite3
.endif

sqldiff.c:
	ftp https://github.com/sqlite/sqlite/raw/${TAG}/tool/$@
	echo ${SHA256} $@ | sha256 -c

.include <bsd.prog.mk>
