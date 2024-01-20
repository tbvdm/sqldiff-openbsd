TAG=		version-3.45.0
SHA256=		59d9a23ebe8ff3e68b0bdb1c562ba1777d3f5f0e0e5dfddfc6ca6370abebf03a

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
