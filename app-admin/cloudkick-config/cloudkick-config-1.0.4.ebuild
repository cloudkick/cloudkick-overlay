# Copyright 2010 Cloudkick, Inc
# Distributed under the terms of the Apache License, Version 2.0
# $Header: $

EAPI="2"

DESCRIPTION="The Cloudkick agent configuration utility"
HOMEPAGE="http://cloudkick.com/"
SRC_URI="
    x86?    ( http://packages.cloudkick.com/releases/${PN}/binaries/${P}_i386.tar.gz )
    amd64?  ( http://packages.cloudkick.com/releases/${PN}/binaries/${P}_amd64.tar.gz )"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
    =net-misc/curl-7.2*"

src_install() {
    into /usr
    dobin src/cloudkick-config
}

pkg_postinst() {
    elog "cloudkick-config can be used to write /etc/cloudkick.conf for use with the"
    elog "cloudkick-agent. See https://support.cloudkick.com/Agent/Cloudkick.conf for"
    elog "further configuration details."
}
