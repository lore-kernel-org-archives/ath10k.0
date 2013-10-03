Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0043.hostedemail.com ([216.40.44.43]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRWmp-0002rG-MT
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 00:28:59 +0000
Message-ID: <1380760114.2081.81.camel@joe-AO722>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 17:28:34 -0700
In-Reply-To: <1380758954.2081.79.camel@joe-AO722>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
 <1380736969.2081.72.camel@joe-AO722>
 <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
 <1380758954.2081.79.camel@joe-AO722>
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

On Wed, 2013-10-02 at 17:09 -0700, Joe Perches wrote:
> This has been running a _long_ time (broken?) on
> drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> 
> $ spatch --version
> spatch version 1.0.0-rc14 without Python support and with PCRE support

Nope.  Not hung/broken.  Just a _long_ time to run.

HANDLING: drivers/net/ethernet/mellanox/mlx4/en_rx.c
HANDLING: drivers/net/ethernet/mellanox/mlx4/en_netdev.c
Note: processing took  2299.7s: drivers/net/ethernet/mellanox/mlx4/en_netdev.c
HANDLING: drivers/net/ethernet/mellanox/mlx4/port.c



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
