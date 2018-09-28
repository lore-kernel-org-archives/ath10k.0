Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-he1eur01on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::614]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5y9t-0007tj-SF
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 19:10:39 +0000
From: Peter Oh <peter.oh@bowerswilkins.com>
Subject: Re: [RFC v4 2/2] ath10k: report tx rate using
 ieee80211_tx_rate_update()
Date: Fri, 28 Sep 2018 19:10:21 +0000
Message-ID: <caada2d5-2e0e-8a5a-cab9-5078654ab5a4@bowerswilkins.com>
References: <1537773000-2587-1-git-send-email-akolli@codeaurora.org>
 <1537773000-2587-3-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1537773000-2587-3-git-send-email-akolli@codeaurora.org>
Content-Language: en-US
Content-ID: <6B9653BB3E245D47BE0DB3CF46012025@eurprd04.prod.outlook.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>



On 09/24/2018 12:10 AM, Anilkumar Kolli wrote:
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index f2405258a6d3..355c39a0486c 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -2753,8 +2753,11 @@ static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
>   				struct ath10k_per_peer_tx_stats *peer_stats)
>   {
>   	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
> -	u8 rate = 0, rate_idx = 0, sgi;
> +	struct ieee80211_chanctx_conf *conf = NULL;
>   	struct rate_info txrate;
> +	u8 rate = 0, sgi;
> +	int rate_idx = 0;
type mismatch. ath10k_accumulate_per_peer_tx_stats() take u8 rate_idx, 
but you're passing int.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
