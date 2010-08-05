# Copyright 2010 Cloudkick, Inc
# Distributed under the terms of the Apache License, Version 2.0
# $Header: $

EAPI="2"

DESCRIPTION="The Cloudkick monitoring agent"
HOMEPAGE="http://cloudkick.com/"
SRC_URI="
    x86?    ( http://packages.cloudkick.com/releases/${PN}/binaries/${P}_i386.tar.gz )
    amd64?  ( http://packages.cloudkick.com/releases/${PN}/binaries/${P}_amd64.tar.gz )"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
    app-admin/cloudkick-config"
RDEPEND="${DEPEND}
    =dev-libs/openssl-0.9.8*"

src_install() {
    into /usr
    dosbin src/cloudkick-agent
    doman docs/cloudkick-agent.8.gz

    newinitd "${FILESDIR}/cloudkick-agent.initd" "cloudkick-agent"
    newconfd "${FILESDIR}/cloudkick-agent.confd" "cloudkick-agent"
}

pkg_postinst() {
    elog "To configure the Cloudkick agent, run cloudkick-config or see the documentation"
    elog "at https://support.cloudkick.com/Agent/Cloudkick.conf, then start the agent"
    elog "with /etc/init.d/cloudkick-agent start"
}
