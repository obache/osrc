# $NetBSD: Makefile,v 1.11 2020/11/21 09:34:57 wiz Exp $
#

DISTNAME=		poppler-${VERSION}
COMMENT=		Ruby binding of poppler-glib
PKGREVISION=		2
CATEGORIES=		print

MAINTAINER=		pkgsrc-users@NetBSD.org

CONFLICTS+=		${RUBY_PKGPREFIX}-gnome2-poppler>=3.0.7nb1
SUPERSEDES+=		${RUBY_PKGPREFIX}-gnome2-poppler>=3.0.7nb1

DEPENDS+=		${RUBY_PKGPREFIX}-gio2>=${VERSION}:../../devel/ruby-gio2
DEPENDS+=		${RUBY_PKGPREFIX}-cairo-gobject>=${VERSION}:../../graphics/ruby-cairo-gobject

BUILDLINK_API_DEPENDS.poppler-glib+=     poppler-glib>=0.79.0nb1
.include "../../print/poppler-glib/buildlink3.mk"
.include "../../meta-pkgs/ruby-gnome/Makefile.common"
.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
