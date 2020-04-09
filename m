Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMY3l-0000yU-CR
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 14:21:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ath10k: correct legacy rate in tx stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016e82883ded-63f88383-cd90-4cb0-b9bb-3dd6a1e9f4e9-000000@us-west-2.amazonses.com>
References: <0101016e82883ded-63f88383-cd90-4cb0-b9bb-3dd6a1e9f4e9-000000@us-west-2.amazonses.com>
Message-Id: <20200409142136.5490EC433BA@smtp.codeaurora.org>
Date: Thu,  9 Apr 2020 14:21:36 +0000 (UTC)
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> wrote:

> When working in station mode, after connected to a legacy
> AP, 11g only, for example, the tx bitrate is incorrect in
> output of command 'iw wlan0 link'.
> 
> That's because the legacy tx bitrate value reported by
> firmware is not well handled:
> For QCA6174, the value represents rate index, but treated
> as a real rate;
> For QCA9888, the value is real rate, with unit 'Mbps', but
> treated as '100kbps'.
> 
> To fix this issue:
> 1. Translate the rate index to real rate for QCA6174;
> 2. Translate the rate from 'Mbps' to 'kbps' for QCA9888.
> 
> Tested with:
> QCA6174 PCIe with firmware WLAN.RM.4.4.1.c3-00031.
> QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> QCA9888 PCIe with firmware 10.4-3.9.0.2-00040.
> 
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

My comments don't seem to go to patchwork, so trying again:

What about QCA988X and WCN3990, how do they behave? Does this patch
break those?

> +	cck = (preamble == WMI_RATE_PREAMBLE_CCK);
> +	hw_rate = ATH10K_HW_LEGACY_RATE(*ratecode);
> +	for (i = 0; i < sband->n_bitrates; i++) {
> +		bitrates = &sband->bitrates[i];
> +		if (ath10k_mac_bitrate_is_cck(bitrates->bitrate) != cck)
> +			continue;
> +
> +		if (bitrates->hw_value == hw_rate ||
> +		    (bitrates->flags & IEEE80211_RATE_SHORT_PREAMBLE &&
> +		     bitrates->hw_value_short == hw_rate)) {
> +			bitrate = bitrates->bitrate;
> +
> +			/* The bitrate will be recovered in
> +			 * ath10k_update_per_peer_tx_stats().
> +			 */
> +			if (bitrate == 55)
> +				bitrate = 60;
> +
> +			bitrate = bitrate / 10;

Here you use magic value 60 but in ath10k_update_per_peer_tx_stats() you
use magic value 50:

> +		/* from 1Mbps to 100Kbps */
> +		rate = rate * 10;
> +		if (rate == 50)
> +			rate = 55;

Am I missing something or how is this supposed to work?

-- 
https://patchwork.kernel.org/patch/11251001/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
