# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# TODO Vendor this package from user configuration (USE flags or something else)
EGO_VENDOR=( "github.com/mholt/caddy 6f580c6aa36c54c3e1c65b5c609550a8a2508e3e"
	"github.com/miekg/dns 7586a3cbe8ccfc63f82de3ab2ceeb08c9939af72"
	"github.com/prometheus/client_golang abad2d1bd44235a26707c172eab6bca5bf2dbad3"
	"github.com/beorn7/perks 3a771d992973f24aa725d07868b467d1ddfceafb"
	"github.com/prometheus/procfs 1dc9a6cbc91aacc3e8b2d63db4d2e957a5394ac4"
	"golang.org/x/net 927f97764cc334a6575f4b7a1584a147864d5723 github.com/golang/net"
	"golang.org/x/text e6919f6577db79269a6443b9dc46d18f2238fb5d github.com/golang/text"
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
	insinto /etc/coredns
	newins "${FILESDIR}"/Corefile-1.2.6 Corefile

	newinitd "${FILESDIR}"/coredns-1.2.6.init coredns
	newconfd "${FILESDIR}"/coredns-1.2.6.conf coredns

	dobin ${PN}
	dodoc src/${EGO_PN}/README.md
	save_config src/${EGO_PN}/plugin.cfg
}
