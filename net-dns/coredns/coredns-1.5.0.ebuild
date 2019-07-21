# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# TODO Vendor this package from user configuration (USE flags or something else)
EGO_VENDOR=(
	"github.com/mholt/caddy c1d6c928e3a29e94013bda4d339d9e426500c8e7"
	"github.com/miekg/dns 8fc2e5773bbd308ca2fcc962fd8d25c1bd0f6743"
	"github.com/prometheus/client_golang abad2d1bd44235a26707c172eab6bca5bf2dbad3"
	"github.com/beorn7/perks 3a771d992973f24aa725d07868b467d1ddfceafb"
	"github.com/prometheus/procfs d0f344d83b0c80a1bc03b547a2374a9ec6711144"
	"golang.org/x/net 9f648a60d9775ef5c977e7669d1673a7a67bef33 github.com/golang/net"
	"golang.org/x/text 5d731a35f4867878fc89f7744f7b6debb3beded6 github.com/golang/text"
	"golang.org/x/crypto 4def268fd1a49955bfb3dda92fe3db4f924f2285 github.com/golang/crypto"
	"golang.org/x/time 9d24e82272b4f38b78bc8cff74fa936d31ccd8ef github.com/golang/time"
	"golang.org/x/sys fae7ac547cb717d141c433a2a173315e216b64c4 github.com/golang/sys"
	"gopkg.in/yaml.v2 51d6538a90f86fe93ac480b35f37b2be17fef232 github.com/go-yaml/yaml"
	"github.com/aws/aws-sdk-go 852052a10992d92f68b9a60862a3312292524903"
	"github.com/coreos/etcd 2cf9e51d2a78003b164c2998886158e60ded1cbb"
	"github.com/dnstap/golang-dnstap 2cf77a2b5e11ac8d0ba3892772ac8e1f7b528344"
	"github.com/farsightsec/golang-framestream 8a0cb8ba87105c2d27e725e48e50ce0b5c521d57"
	"github.com/gogo/protobuf ba06b47c162d49f2af050fb4c75bcbc86a159d5c"
	"github.com/golang/protobuf aa810b61a9c79d51363740d207bb46cf8e620ed5"
	"k8s.io/client-go e64494209f554a6723674bd494d69445fb76a1d4 github.com/kubernetes/client-go"
	"k8s.io/apimachinery 2b1284ed4c93a43499e781493253e2ac5959c4fd github.com/kubernetes/apimachinery"
	"k8s.io/api 89a74a8d264df0e993299876a8cde88379b940ee github.com/kubernetes/api"
	"k8s.io/klog d98d8acdac006fb39831f1b25640813fef9c314f github.com/kubernetes/klog"
	"sigs.k8s.io/yaml fd68e9863619f6ec2fdd8625fe1f02e7c877e480 github.com/kubernetes-sigs/yaml"
	"github.com/davecgh/go-spew 8991bc29aa16c548c550c7ff78260e27b9ab7c73"
	"github.com/google/gofuzz 24818f796faf91cd76ec7bddd72458fbced7a6c1"
	"github.com/json-iterator/go 0ff49de124c6f76f8494e194af75bde0f1a49a29"
	"github.com/hashicorp/golang-lru 7087cb70de9f7a8bc0a10c375cb0d2280a8edf9c"
	"github.com/grpc-ecosystem/grpc-opentracing 8e809c8a86450a29b90dcc9efbf062d0fe6d9746"
	"google.golang.org/grpc 1d89a3c832915b2314551c1d2a506874d62e53f7 github.com/grpc/grpc-go"
	"github.com/googleapis/gnostic 7c663266750e7d82587642f65e60bc4083f1f84e"
	"github.com/gophercloud/gophercloud fe1ba5ce12dda9d3056d303dfe080d5eccdd1780"
	"github.com/gregjones/httpcache 901d90724c7919163f472a9812253fb26761123d"
	"github.com/imdario/mergo 7c29201646fa3de8506f701213473dd407f19646"
	"gopkg.in/inf.v0 d2d2541c53f18d2a059457998ce2876cc8e67cbf github.com/go-inf/inf"
	"gopkg.in/DataDog/dd-trace-go.v0 27617015d45e6cd550b9a7ac7715c37cc2f7d020 github.com/DataDog/dd-trace-go"
	"google.golang.org/genproto c66870c02cf823ceb633bcd05be3c7cda29976f4 github.com/googleapis/go-genproto"
	"golang.org/x/oauth2 d2e6202438beef2727060aa7cabdd924d92ebfd9 github.com/golang/oauth2"
	"github.com/prometheus/common 4724e9255275ce38f7179b2478abeae4e28c904f"
	"github.com/spf13/pflag 298182f68c66c05229eb03ac171abe6e309ee79a"
	"github.com/peterbourgon/diskv 5f041e8faa004a95c88a202771f4cc3e991971e6"
	"github.com/prometheus/client_model 5c3871d89910bfb32f5fcab2aa4b9ec68e65a99f"
	"github.com/opentracing/opentracing-go 1949ddbfd147afd4d964a9f00b24eb291e0e7c38"
	"github.com/openzipkin/zipkin-go-opentracing 26cf9707480e6b90e5eff22cf0bbf05319154232"
	"github.com/modern-go/reflect2 94122c33edd36123c84d5368cfb2b69df93a0ec8"
	"github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
	"github.com/opentracing-contrib/go-observer a52f2342449246d5bcc273e65cbdcfa5f7d6c63c"
	"github.com/matttproud/golang_protobuf_extensions c12348ce28de40eed0136aa2b644d0ee0650e56c"
	"github.com/google/btree 4030bb1f1f0c35b30ca7009e9ebd06849dd45306"
	"github.com/go-logfmt/logfmt 07c9b44f60d7ffdfb7d8efe1ad539965737836dc"
	"github.com/Shopify/sarama 4602b5a8c6e826f9e0737865818dd43b2339a092"
	"github.com/DataDog/dd-trace-go 27617015d45e6cd550b9a7ac7715c37cc2f7d020"
	"github.com/rcrowley/go-metrics 3113b8401b8a98917cde58f8bbd42a1b1c03b1fd"
	"github.com/pierrec/lz4 ea731401f5c95a8ba30f15787e5e0fb77c60c66b"
	"github.com/eapache/queue 44cc805cf13205b55f69e14bcb69867d1ae92f98"
	"github.com/eapache/go-xerial-snappy 776d5712da21bc4762676d614db1d8a64f4238b0"
	"github.com/eapache/go-resiliency ea41b0fad31007accc7f806884dcdf3da98b79ce"
	"github.com/apache/thrift 384647d290e2e4a55a14b1b7ef1b7e66293a2c33"
	"github.com/DataDog/zstd c7161f8c63c045cbc7ca051dcc969dd0e4054de2"
	"github.com/golang/snappy 2e65f85255dbc3072edf28d6b5b8efc472979f5a"
	"cloud.google.com/go 97efc2c9ffd9fe8ef47f7f3203dc60bbca547374 github.com/googleapis/google-cloud-go"
)

EGO_PN="github.com/${PN}/${PN}"

inherit savedconfig golang-build golang-vcs-snapshot

DESCRIPTION="A DNS server that chains middleware"
HOMEPAGE="https://github.com/coredns/coredns"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
GITCOMMIT="e3f9a80b1d5a112907a012acee276e9080b32852"

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
