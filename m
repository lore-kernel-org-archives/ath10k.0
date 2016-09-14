Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkArS-0006x6-RP
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 14:08:31 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 04/21] ath10k: rate-limit packet tx errors
Date: Wed, 14 Sep 2016 14:07:55 +0000
Message-ID: <87wpieefr9.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-5-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-5-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 11 May 2016 10:02:16	-0700")
Content-Language: en-US
Content-ID: <8A0CC84211BFE44A84DC50E4F71765E8@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> When firmware crashes, stack can continue to send packets
> for a bit, and existing code was spamming logs.
>
> So, rate-limit the error message for tx failures.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index cd3016d..42cac32 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3432,8 +3432,9 @@ static int ath10k_mac_tx_submit(struct ath10k *ar,
>  	}
>  
>  	if (ret) {
> -		ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
> -			    ret);
> +		if (net_ratelimit())
> +			ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
> +				    ret);
>  		ieee80211_free_txskb(ar->hw, skb);
>  	}

ath10k_warn() is already rate limited. If there's something wrong then
that function should be fixed, not the callers.

void ath10k_warn(struct ath10k *ar, const char *fmt, ...)
{
	struct va_format vaf = {
		.fmt = fmt,
	};
	va_list args;

	va_start(args, fmt);
	vaf.va = &args;
	dev_warn_ratelimited(ar->dev, "%pV", &vaf);
	trace_ath10k_log_warn(ar, &vaf);

	va_end(args);
}

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
