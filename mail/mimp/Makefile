# $NetBSD: Makefile,v 1.8 2019/05/23 19:23:06 rillig Exp $

DISTNAME=	mimp-h3-${MIMPVER}
PKGNAME=	mimp-${MIMPVER}
PKGREVISION=	2
CATEGORIES=	mail www
MASTER_SITES=	http://ftp.horde.org/pub/mimp/
MASTER_SITES+=	ftp://ftp.horde.org/pub/mimp/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.horde.org/apps/mimp/
COMMENT=	Internet Messaging Program for mobile devices
LICENSE=	gnu-gpl-v2

DEPENDS+=	imp>=4.2:../../mail/imp

PHP_VERSIONS_ACCEPTED=	56

USE_TOOLS+=	pax

PKG_DESTDIR_SUPPORT=	destdir

DOCDIR=		${PREFIX}/share/doc/mimp
EGDIR=		${PREFIX}/share/examples/mimp
HORDEDIR=	${PREFIX}/share/horde
MIMPDIR=	${HORDEDIR}/mimp
MIMPVER=	1.1.4
PAXDIRS=	lib locale po templates themes

WRKSRC=			${WRKDIR}/${DISTNAME}
PKG_USERS_VARS+=	APACHE_USER
BUILD_DEFS+=		APACHE_USER

MESSAGE_SUBST+=	MIMPDIR=${MIMPDIR}
MESSAGE_SUBST+=	PKG_SYSCONFDIR=${PKG_SYSCONFDIR}

PKG_SYSCONFSUBDIR?=	httpd

CONF_FILES=		${EGDIR}/mimp.conf ${PKG_SYSCONFDIR}/mimp.conf
CONF_FILES_PERMS+=	${MIMPDIR}/config/conf.xml.dist \
			${MIMPDIR}/config/conf.xml \
			${APACHE_USER} ${REAL_ROOT_GROUP} 0440
CONF_FILES_PERMS+=	${MIMPDIR}/config/menu.php.dist \
			${MIMPDIR}/config/menu.php \
			${APACHE_USER} ${REAL_ROOT_GROUP} 0440
CONF_FILES_PERMS+=	${MIMPDIR}/config/mime_drivers.php.dist \
			${MIMPDIR}/config/mime_drivers.php \
			${APACHE_USER} ${REAL_ROOT_GROUP} 0440
CONF_FILES_PERMS+=	${MIMPDIR}/config/prefs.php.dist \
			${MIMPDIR}/config/prefs.php \
			${APACHE_USER} ${REAL_ROOT_GROUP} 0440

SUBST_CLASSES+=		files
SUBST_STAGE.files=	post-build
SUBST_FILES.files=	mimp.conf.dist
SUBST_VARS.files=	MIMPDIR
SUBST_MESSAGE.files=	Fixing configuration files.

REPLACE_INTERPRETER+=	php
REPLACE.php.old=	.*/bin/php
REPLACE.php.new=	${PREFIX}/bin/php
REPLACE_FILES.php=	scripts/bounce_spam.php \
			scripts/upgrades/convert_vfolders.php

do-build:
	${CP} ${FILESDIR}/mimp.conf.dist ${WRKSRC}/mimp.conf.dist
	${CP} ${WRKSRC}/config/conf.xml ${WRKSRC}/config/conf.xml.dist
	${FIND} ${WRKSRC} -name .htaccess -print | ${XARGS} ${RM} -f

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${DOCDIR}
	${INSTALL_DATA_DIR} ${DESTDIR}${EGDIR}
	${INSTALL_DATA_DIR} ${DESTDIR}${MIMPDIR}
	${INSTALL_DATA_DIR} ${DESTDIR}${MIMPDIR}/config
	${INSTALL_DATA} ${WRKSRC}/mimp.conf.dist ${DESTDIR}${EGDIR}/mimp.conf
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DESTDIR}${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/* ${DESTDIR}${DOCDIR}
.for d in ${PAXDIRS}
		${INSTALL_DATA_DIR} ${DESTDIR}${MIMPDIR}/${d}
.endfor
.for d in ${PAXDIRS}
		cd ${WRKSRC}/${d} && pax -rwpam . ${DESTDIR}${MIMPDIR}/${d}
.endfor
	${INSTALL_DATA} ${WRKSRC}/config/*.dist ${DESTDIR}${MIMPDIR}/config
	${INSTALL_DATA} ${WRKSRC}/*.php ${DESTDIR}${MIMPDIR}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DESTDIR}${MIMPDIR}
	${FIND} ${DESTDIR}${MIMPDIR} -type d -print | \
	${XARGS} ${CHMOD} ${PKGDIRMODE}
	${FIND} ${DESTDIR}${MIMPDIR} -type f -print | \
	${XARGS} ${CHMOD} ${SHAREMODE}
	${CHOWN} ${APACHE_USER}:${ROOT_GROUP} ${DESTDIR}${MIMPDIR}/config
	${CHMOD} 0750 ${DESTDIR}${MIMPDIR}/config

.include "../../lang/php/phpversion.mk"
.include "../../mk/bsd.pkg.mk"
