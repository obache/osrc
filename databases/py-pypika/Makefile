# $NetBSD: Makefile,v 1.13 2020/12/06 10:47:40 adam Exp $

DISTNAME=	pypika-0.44.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=P/PyPika/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/kayak/pypika
COMMENT=	SQL query builder API for Python
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/PyPika-${PKGVERSION_NOREV}
EGG_NAME=	PyPika-${PKGVERSION_NOREV}

USE_LANGUAGES=	# none

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
