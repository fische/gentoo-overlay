# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# TODO Vendor this package from user configuration (USE flags or something else)
EGO_VENDOR=( "github.com/mholt/caddy 694d2c9b2e1ce5596b4e8a651e76b3f312ee2a77"
	"github.com/miekg/dns 7064f7248f5fa5fd79382a76328b4e200b79e4ae"
	"github.com/prometheus/client_golang c5b7fccd204277076155f10851dad72b76a49317"
	"github.com/beorn7/perks 3a771d992973f24aa725d07868b467d1ddfceafb"
	"github.com/prometheus/procfs 1dc9a6cbc91aacc3e8b2d63db4d2e957a5394ac4"
	"golang.org/x/net b68f30494add4df6bd8ef5e82803f308e7f7c59c github.com/golang/net"
	"golang.org/x/text ece95c760240037f89ebcbdd7155ac8cb52e38fa github.com/golang/text"
)

EGO_PN="github.com/${PN}/${PN}"

inherit savedconfig golang-build golang-vcs-snapshot

DESCRIPTION="A DNS server that chains middleware"
HOMEPAGE="https://github.com/coredns/coredns"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
GITCOMMIT="756749c5cad4cd40453b82f70592bc19bb9ccb15"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"

src_prepare() {
	default

	restore_config src/${EGO_PN}/plugin.cfg
	GOPATH="${S}" go generate ${EGO_PN}
}

src_compile() {
	GOPATH="${S}" go build -o ${PN} -v -ldflags="-s -w -X github.com/coredns/coredns/coremain.GitCommit=${GITCOMMIT}" ${EGO_PN} || die
}

src_install() {
	dobin ${PN}
	dodoc src/${EGO_PN}/README.md
	save_config src/${EGO_PN}/plugin.cfg
}
