Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfhPz-0003XH-1p
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 06:25:53 +0000
Received: by mail-lf0-x244.google.com with SMTP id 90so241846lfr.3
 for <ath10k@lists.infradead.org>; Sun, 19 Feb 2017 22:25:28 -0800 (PST)
Subject: Re: [PATCH] ath10k: Update available channel list for 5G radio
References: <1487567326-18346-1-git-send-email-c_traja@qti.qualcomm.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <3ef14794-30e3-729b-b601-3962e52ef6ed@gmail.com>
Date: Mon, 20 Feb 2017 07:25:24 +0100
MIME-Version: 1.0
In-Reply-To: <1487567326-18346-1-git-send-email-c_traja@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: c_traja@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 02/20/2017 06:08 AM, c_traja@qti.qualcomm.com wrote:
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 3029f25..0840efb 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -7623,6 +7623,38 @@ static void ath10k_mac_op_sta_pre_rcu_remove(struct ieee80211_hw *hw,
>  	CHAN2G(14, 2484, 0),
>  };
>
> +static const struct ieee80211_channel ath10k_low_5ghz_channels[] = {
> +	CHAN5G(36, 5180, 0),
> +	CHAN5G(40, 5200, 0),
> +	CHAN5G(44, 5220, 0),
> +	CHAN5G(48, 5240, 0),
> +	CHAN5G(52, 5260, 0),
> +	CHAN5G(56, 5280, 0),
> +	CHAN5G(60, 5300, 0),
> +	CHAN5G(64, 5320, 0),
> +};
> +
> +static const struct ieee80211_channel ath10k_high_5ghz_channels[] = {
> +	CHAN5G(100, 5500, 0),
> +	CHAN5G(104, 5520, 0),
> +	CHAN5G(108, 5540, 0),
> +	CHAN5G(112, 5560, 0),
> +	CHAN5G(116, 5580, 0),
> +	CHAN5G(120, 5600, 0),
> +	CHAN5G(124, 5620, 0),
> +	CHAN5G(128, 5640, 0),
> +	CHAN5G(132, 5660, 0),
> +	CHAN5G(136, 5680, 0),
> +	CHAN5G(140, 5700, 0),
> +	CHAN5G(144, 5720, 0),
> +	CHAN5G(149, 5745, 0),
> +	CHAN5G(153, 5765, 0),
> +	CHAN5G(157, 5785, 0),
> +	CHAN5G(161, 5805, 0),
> +	CHAN5G(165, 5825, 0),
> +	CHAN5G(169, 5845, 0),
> +};

This isn't too flexible. What if one day you'll see hardware that supports
channels 100-144 only?

It should be much better idea to just disable unavailable channels, see what we
did in wiphy_freq_limits_apply (net-next).

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
