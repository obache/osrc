# $NetBSD: Makefile,v 1.8 2020/08/31 08:45:44 wiz Exp $

DISTNAME=	brotli-1.0.9
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GITHUB:=google/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/google/brotli
COMMENT=	Generic-purpose lossless compression algorithm
LICENSE=	mit

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	libbrotlicommon.pc
PKGCONFIG_OVERRIDE+=	libbrotlidec.pc
PKGCONFIG_OVERRIDE+=	libbrotlienc.pc
PKGCONFIG_OVERRIDE_STAGE=	post-build

CMAKE_ARGS+=	-DCMAKE_SHARED_LINKER_FLAGS=${COMPILER_RPATH_FLAG}${PREFIX}/lib
CMAKE_ARGS+=	-DCMAKE_EXE_LINKER_FLAGS=${COMPILER_RPATH_FLAG}${PREFIX}/lib

TEST_TARGET=	test

INSTALLATION_DIRS+=	${PKGMANDIR}/man1

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/brotli.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/

.include "../../mk/bsd.pkg.mk"
