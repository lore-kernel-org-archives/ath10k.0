Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5PKi-0002xq-QS
 for ath10k@lists.infradead.org; Wed, 04 Sep 2019 07:04:05 +0000
Message-ID: <582e0a7eef96bb7d97fee4bae340ded97fda86a2.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: Store max_mtu in ieee80211_hw
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 04 Sep 2019 09:03:54 +0200
In-Reply-To: <1567577743-27684-1-git-send-email-wgong@codeaurora.org>
References: <1567577743-27684-1-git-send-email-wgong@codeaurora.org>
MIME-Version: 1.0
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
To: Wen Gong <wgong@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Wed, 2019-09-04 at 14:15 +0800, Wen Gong wrote:
> Make it possibly for drivers to adjust the default mat_mtu
> by storing it in the hardware struct.
> 
> +++ b/net/mac80211/iface.c
> @@ -1877,7 +1877,10 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
>  
>  		/* MTU range: 256 - 2304 */
>  		ndev->min_mtu = 256;
> -		ndev->max_mtu = IEEE80211_MAX_DATA_LEN;
> +		if (local->hw.max_mtu)
> +			ndev->max_mtu = local->hw.max_mtu;
> +		else
> +			ndev->max_mtu = IEEE80211_MAX_DATA_LEN;

It seems (slightly) preferable to me to just initialize the value in
local->hw.max_mtu in alloc_hw(), so the driver can override it before
register_hw(), and then use it here unconditionally. Any particular
reason for it being this way?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
