# Copyright 2010 Cloudkick, Inc
# Distributed under the terms of the Apache License, Version 2.0
# $Header: $

EAPI="2"
inherit scons-utils toolchain-funcs

DESCRIPTION="The Cloudkick agent configuration utility"
HOMEPAGE="http://cloudkick.com/"
SRC_URI="http://packages.cloudkick.com/releases/${PN}/binaries/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-misc/curl[ssl]"
RDEPEND="${DEPEND}"

src_compile() {
	tc-export CC
	escons || die "escons failed"
}

src_install() {
	into /usr
	dobin src/cloudkick-config
}

pkg_postinst() {
	elog "cloudkick-config can be used to write /etc/cloudkick.conf for use with the"
	elog "cloudkick-agent. See https://support.cloudkick.com/Agent/Cloudkick.conf for"
	elog "further configuration details."
}
