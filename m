Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyEIM-0001LV-VV
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 12:56:29 +0000
Message-ID: <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>
Subject: Re: [RFC 1/7] mac80211: Add check for napi handle before WARN_ON
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 22 Jul 2020 14:56:00 +0200
In-Reply-To: <1595351666-28193-2-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-2-git-send-email-pillair@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On Tue, 2020-07-21 at 22:44 +0530, Rakesh Pillai wrote:
> The function ieee80211_rx_napi can be now called
> from a thread context as well, with napi context
> being NULL.
> 
> Hence add the napi context check before giving out
> a warning for softirq count being 0.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  net/mac80211/rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index a88ab6f..1e703f1 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -4652,7 +4652,7 @@ void ieee80211_rx_napi(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
>  	struct ieee80211_supported_band *sband;
>  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
>  
> -	WARN_ON_ONCE(softirq_count() == 0);
> +	WARN_ON_ONCE(napi && softirq_count() == 0);

FWIW, I'm pretty sure this is incorrect - we make assumptions on
softirqs being disabled in mac80211 for serialization and in place of
some locking, I believe.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
