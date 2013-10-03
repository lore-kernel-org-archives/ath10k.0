Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRZeF-0005Qt-WE
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 03:32:21 +0000
Message-ID: <1380771110.2081.89.camel@joe-AO722>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 20:31:50 -0700
In-Reply-To: <1380760114.2081.81.camel@joe-AO722>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
 <1380736969.2081.72.camel@joe-AO722>
 <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
 <1380758954.2081.79.camel@joe-AO722> <1380760114.2081.81.camel@joe-AO722>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>

On Wed, 2013-10-02 at 17:28 -0700, Joe Perches wrote:
> On Wed, 2013-10-02 at 17:09 -0700, Joe Perches wrote:
> > This has been running a _long_ time (broken?) on
> > drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> > 
> > $ spatch --version
> > spatch version 1.0.0-rc14 without Python support and with PCRE support
> 
> Nope.  Not hung/broken.  Just a _long_ time to run.
> 
> HANDLING: drivers/net/ethernet/mellanox/mlx4/en_rx.c
> HANDLING: drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> Note: processing took  2299.7s: drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> HANDLING: drivers/net/ethernet/mellanox/mlx4/port.c

Hi again Julia:

Oddly, just a few files took > 1000 seconds to run.
Most all the rest were < 10 seconds (no report).
A few were ~100 seconds.

HANDLING: drivers/net/ethernet/mellanox/mlx4/en_netdev.c
Note: processing took  2299.7s: drivers/net/ethernet/mellanox/mlx4/en_netdev.c
[]
HANDLING: drivers/net/wireless/ipw2x00/libipw_rx.c
Note: processing took  5308.0s: drivers/net/wireless/ipw2x00/libipw_rx.c
[]
HANDLING: drivers/net/wireless/hostap/hostap_80211_rx.c
Note: processing took  1336.6s: drivers/net/wireless/hostap/hostap_80211_rx.c

I don't know what causes the delays on these files.

The only output I get for net-next is:

* TODO
[[view:drivers/net/wireless/zd1201.c::face=ovl-face1::linb=331::colb=3::cole=9][ drivers/net/wireless/zd1201.c::331]]
* TODO
[[view:drivers/net/wireless/zd1201.c::face=ovl-face1::linb=332::colb=3::cole=9][ drivers/net/wireless/zd1201.c::332]]
* TODO
[[view:drivers/net/wireless/zd1201.c::face=ovl-face1::linb=332::colb=3::cole=9][ drivers/net/wireless/zd1201.c::332]]
* TODO
[[view:drivers/net/wireless/zd1201.c::face=ovl-face1::linb=332::colb=3::cole=9][ drivers/net/wireless/zd1201.c::332]]
* TODO
[[view:drivers/net/wireless/zd1201.c::face=ovl-face1::linb=333::colb=3::cole=9][ drivers/net/wireless/zd1201.c::333]]
* TODO
[[view:drivers/net/wireless/ath/ath10k/wmi.c::face=ovl-face1::linb=1761::colb=1::cole=7][ drivers/net/wireless/ath/ath10k/wmi.c::1761]]

and the zd1201 conversions would be kind of odd.

Anyway, the ath10k file is a good one to patch.  Thanks.
I'll send a patch separately.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
