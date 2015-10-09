Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkYrk-0003Wm-T4
 for ath10k@lists.infradead.org; Fri, 09 Oct 2015 14:41:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Fix OFDM rx-rate reporting.
References: <1444173675-16833-1-git-send-email-greearb@candelatech.com>
Date: Fri, 9 Oct 2015 17:41:19 +0300
In-Reply-To: <1444173675-16833-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 6 Oct 2015 16:21:15
 -0700")
Message-ID: <87egh4qf3k.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> The ath10k hw_rate codes are duplicated for
> cck and ofdm modes, so we have to check a flag to
> see if rate is cck or not when searching for
> the proper bitrate.
>
> This fixes monitor mode reporting invalid rates
> on my setup.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Please rebase, doesn't apply and it used unknown SHA1 ids:

Applying: ath10k: Fix OFDM rx-rate reporting.
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/htt_rx.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 ath10k: Fix OFDM rx-rate reporting.

>  u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
> -			     u8 hw_rate)
> +			     u8 hw_rate, u8 cck)

A boolean for cck would be nice because that's what it release is.

> @@ -99,6 +99,12 @@ u8 ath10k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
>  	for (i = 0; i < sband->n_bitrates; i++) {
>  		rate = &sband->bitrates[i];
>  
> +		/* hw_rate values are not unique, have to tie-break with bitrate
> +		 * and cck check.
> +		 */
> +		if (ath10k_mac_bitrate_is_cck(rate->bitrate) && !cck)
> +			continue;

Then this check could be just 'if (is_cck() != cck)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
