# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Lightweight DTLS proxy"
HOMEPAGE="https://github.com/ibm-security-innovation/goldy"
SRC_URI="https://github.com/ibm-security-innovation/${PN}/archive/master.tar.gz -> ${PN}-master.tar.gz"
S="${WORKDIR}/${PN}-master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="net-libs/mbedtls"

src_compile() {
	emake V=1 || die "emake failed"
}

src_install() {
	dobin ${PN}
}
