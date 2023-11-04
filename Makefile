TAG=		version-3.44.0
SHA256=		43dd4449e3e62c93bba38a510ecda3fb6666a1ca7738a135a3b0b9c6f73dd22f

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
