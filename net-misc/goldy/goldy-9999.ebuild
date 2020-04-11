# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# TODO Use BDEPEND instead of provisioning dependencies here
MBEDTLS_VER=2.7.10
LIBEV_VER=4.33

DESCRIPTION="Lightweight DTLS proxy"
HOMEPAGE="https://github.com/ibm-security-innovation/goldy"
SRC_URI="https://github.com/ibm-security-innovation/${PN}/archive/master.tar.gz -> ${PN}-master.tar.gz
	https://tls.mbed.org/download/mbedtls-${MBEDTLS_VER}-apache.tgz -> mbedtls-${MBEDTLS_VER}.tar.gz
	http://dist.schmorp.de/libev/Attic/libev-${LIBEV_VER}.tar.gz -> libev-${LIBEV_VER}.tar.gz"
S="${WORKDIR}/${PN}-master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack ${A} 

	mv mbedtls-${MBEDTLS_VER} libev-${LIBEV_VER} ${PN}-master/deps
}

src_compile() {
	emake -C ./deps build_deps || die "emake build_deps failed"
	emake V=1 || die "emake failed"
}

src_install() {
	dobin ${PN}
}
