# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ACMEv2 client written in plain C code with minimal dependencies"
HOMEPAGE="https://github.com/ndilieto/uacme"
SRC_URI="https://github.com/ndilieto/${PN}/archive/upstream/latest.tar.gz -> ${PN}-latest.tar.gz"
S="${WORKDIR}/${PN}-upstream-latest"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs gnutls openssl mbedtls"
REQUIRED_USE="^^ ( gnutls openssl mbedtls )"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="net-misc/curl
        docs? ( app-text/asciidoc )
        gnutls? ( net-libs/gnutls )
        openssl? ( dev-libs/openssl )
        mbedtls? ( net-libs/mbedtls )"

src_configure() {
        if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
                econf \
                        --disable-maintainer-mode \
                        $(use_enable docs) \
                        $(use_with gnutls) \
                        $(use_with openssl) \
                        $(use_with mbedtls)
        fi
}
