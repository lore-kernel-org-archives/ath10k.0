Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOrr4-0004DM-Vw
 for ath10k@lists.infradead.org; Mon, 10 Aug 2015 18:31:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: report per-chain RSSI
In-Reply-To: <20150729121942.9c8c2ec02dfc0469163aa7aa@ubnt.com> (Dmitry
 Ivanov's message of "Wed, 29 Jul 2015 12:19:42 +0300")
References: <20150729121942.9c8c2ec02dfc0469163aa7aa@ubnt.com>
Date: Mon, 10 Aug 2015 21:30:56 +0300
Message-ID: <874mk7uhb3.fsf@kamboji.qca.qualcomm.com>
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
To: Dmitry Ivanov <dmitrijs.ivanovs@ubnt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dmitry Ivanov <dmitrijs.ivanovs@ubnt.com> writes:

> ath10k: report per-chain RSSI.
>
> Signed-off-by: Dmitry Ivanov <dima@ubnt.com>

Please write a proper commit log. And CC ath10k mailing list when
submitting ath10k patches:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/sources#submitting_patches

> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -832,6 +832,20 @@ static void ath10k_htt_rx_h_signal(struct ath10k *ar,
>  				   struct ieee80211_rx_status *status,
>  				   struct htt_rx_desc *rxd)
>  {
> +	{

The extra block is not needed and can be remove, right?

> +		/* Linux array has size IEEE80211_MAX_CHAINS, FW array has size 4 */
> +		BUILD_BUG_ON(IEEE80211_MAX_CHAINS != 4);

This is a bit evil, is this really necessary? Can't we just add a define
for FW array size and use that?

> +		u32 i = IEEE80211_MAX_CHAINS;

Why u32? Wouldn't int be enough?

> +		u8 signal_per_chain;
> +		do {
> +			i--;
> +			signal_per_chain = rxd->ppdu_start.rssi_chains[i].pri20_mhz;
> +			if (signal_per_chain != 0x80) {

What's the magic number 0x80? Is there an existing define you could use
or do we need to add a new one?

> +				status->chains |= BIT(i);
> +				status->chain_signal[i] = ATH10K_DEFAULT_NOISE_FLOOR + signal_per_chain;
> +			}
> +		} while (i);
> +	}

Wouldn't a normal for loop be simpler?

for (i = 0; i < IEEE80211_MAX_CHAINS; i++)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
