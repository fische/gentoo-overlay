# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# TODO Vendor this package from user configuration (USE flags or something else)
EGO_VENDOR=( "github.com/mholt/caddy c1d6c928e3a29e94013bda4d339d9e426500c8e7"
	"github.com/miekg/dns 8fc2e5773bbd308ca2fcc962fd8d25c1bd0f6743"
	"github.com/prometheus/client_golang abad2d1bd44235a26707c172eab6bca5bf2dbad3"
	"github.com/beorn7/perks 3a771d992973f24aa725d07868b467d1ddfceafb"
	"github.com/prometheus/procfs d0f344d83b0c80a1bc03b547a2374a9ec6711144"
	"golang.org/x/net 9f648a60d9775ef5c977e7669d1673a7a67bef33 github.com/golang/net"
	"golang.org/x/text 5d731a35f4867878fc89f7744f7b6debb3beded6 github.com/golang/text"
)

EGO_PN="github.com/${PN}/${PN}"

inherit savedconfig golang-build golang-vcs-snapshot

DESCRIPTION="A DNS server that chains middleware"
HOMEPAGE="https://github.com/coredns/coredns"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
GITCOMMIT="8dcc7fccd74454134b33c8bc9f780ed6d7f076cf"

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
