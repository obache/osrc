# $NetBSD: Makefile,v 1.3 2015/03/15 18:46:56 hiramatsu Exp $
#

DISTNAME=	tegaki-zinnia-japanese-0.3
CATEGORIES=	inputmethod japanese
MASTER_SITES=	http://www.tegaki.org/releases/0.3/models/
EXTRACT_SUFX=	.zip

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.tegaki.org/
COMMENT=	Tegaki project handwriting model for Zinnia-Japanese (all)
LICENSE=	gnu-lgpl-v2.1

CONFLICTS+=	tegaki-zinnia-japanese-light-[0-9]*

USE_LANGUAGES=	# none

NO_BUILD=		yes

INSTALLATION_DIRS=	share/tegaki/models/zinnia

INSTALL_MAKE_FLAGS+=	installpath=${DESTDIR}${PREFIX}/share/tegaki/models/zinnia

.include "../../mk/bsd.pkg.mk"
