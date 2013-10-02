Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Wed, 02 Oct 2013 17:05:21 -0400 (EDT)
Message-Id: <20131002.170521.463969346066312216.davem@davemloft.net>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
From: David Miller <davem@davemloft.net>
In-Reply-To: <1380679480.2081.24.camel@joe-AO722>
References: <1380679480.2081.24.camel@joe-AO722>
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
Cc: brcm80211-dev-list@broadcom.com, bridge@lists.linux-foundation.org, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, wil6210@qca.qualcomm.com, netfilter-devel@vger.kernel.org, b43-dev@lists.infradead.org, linuxppc-dev@lists.ozlabs.org

From: Joe Perches <joe@perches.com>
Date: Tue, 01 Oct 2013 19:04:40 -0700

> Convert the memset/memcpy uses of 6 to ETH_ALEN
> where appropriate.
> 
> Also convert some struct definitions and u8 array
> declarations of [6] to ETH_ALEN.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Looks fine, applied, thanks Joe.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
