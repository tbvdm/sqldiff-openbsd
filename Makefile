TAG=		version-3.43.0
SHA256=		1a6d6b211ff503c8f56d87208839dd4b294d63694b354f42d6901419317c4aaa

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
