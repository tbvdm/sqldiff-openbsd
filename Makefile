TAG=		4308b88dcdab08d8f7ead46e46c29180c1496585
SHA256=		670a8d58cf62a9693bb0ee6c7ff44bbac382457e0e7b1d01793ee96fda9575c5

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
