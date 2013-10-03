Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [2001:4f8:3:36:211:85ff:fe63:a549] (helo=shards.monkeyblade.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRZqC-0005XG-8F
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 03:44:42 +0000
Date: Wed, 02 Oct 2013 23:44:17 -0400 (EDT)
Message-Id: <20131002.234417.149459627679517962.davem@davemloft.net>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
From: David Miller <davem@davemloft.net>
In-Reply-To: <1380771551.2081.93.camel@joe-AO722>
References: <1380760114.2081.81.camel@joe-AO722>
 <1380771110.2081.89.camel@joe-AO722>
 <1380771551.2081.93.camel@joe-AO722>
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
To: joe@perches.com
Cc: mcgrof@do-not-panic.com, netdev@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org, julia.lawall@lip6.fr, kvalo@qca.qualcomm.com

From: Joe Perches <joe@perches.com>
Date: Wed, 02 Oct 2013 20:39:11 -0700

> Use the appropriate define instead of 6.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> Noticed-by: Julia Lawall <julia.lawall@lip6.fr> via spatch script

Applied, thanks Joe.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
