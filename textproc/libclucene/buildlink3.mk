# $NetBSD: buildlink3.mk,v 1.18 2021/01/01 08:24:57 ryoon Exp $

BUILDLINK_TREE+=	libclucene

.if !defined(LIBCLUCENE_BUILDLINK3_MK)
LIBCLUCENE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libclucene+=	libclucene>=2.2.0
BUILDLINK_ABI_DEPENDS.libclucene?=	libclucene>=2.3.3.4nb18
BUILDLINK_PKGSRCDIR.libclucene?=	../../textproc/libclucene
.endif # LIBCLUCENE_BUILDLINK3_MK

.include "../../devel/boost-headers/buildlink3.mk"
BUILDLINK_TREE+=	-libclucene
