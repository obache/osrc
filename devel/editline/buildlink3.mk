# $NetBSD: buildlink3.mk,v 1.5 2020/05/11 21:06:01 tnn Exp $

BUILDLINK_TREE+=	editline

.if !defined(EDITLINE_BUILDLINK3_MK)
EDITLINE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.editline+=	editline>=3.0
BUILDLINK_PKGSRCDIR.editline?=		../../devel/editline
BUILDLINK_INCDIRS.editline?=		include/readline

BUILDLINK_FILES.editline+=	include/history.h
BUILDLINK_FILES.editline+=	include/readline.h

CHECK_BUILTIN.editline:=	yes
.include "../../devel/editline/builtin.mk"
CHECK_BUILTIN.editline:=	no

# A built-in editline is always going to use a built-in termcap.
.if !empty(USE_BUILTIN.editline:M[yY][eE][sS])
USE_BUILTIN.termcap=	yes
.endif

.include "../../mk/termcap.buildlink3.mk"
.endif	# EDITLINE_BUILDLINK3_MK

BUILDLINK_TREE+=	-editline
