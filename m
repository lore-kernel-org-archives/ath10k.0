Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqNXC-0003tq-Uu
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 14:44:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: Advertise support for AP mode channel width
 changes
References: <1415366205-11672-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1415366205-11672-2-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 17 Nov 2014 16:43:36 +0200
In-Reply-To: <1415366205-11672-2-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Fri, 7 Nov 2014 18:46:45 +0530")
Message-ID: <8761edq44n.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> This will enable AP mode to change channel width dynamically
> based on 20/40 intolerance report sent by associated client.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4916,6 +4916,7 @@ int ath10k_mac_register(struct ath10k *ar)
>  	ar->hw->wiphy->max_remain_on_channel_duration = 5000;
>  
>  	ar->hw->wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
> +	ar->hw->wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
>  	/*
>  	 * on LL hardware queues are managed entirely by the FW
>  	 * so we only advertise to mac we can do the queues thing

I added newline to here as well:

--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4928,6 +4928,7 @@ int ath10k_mac_register(struct ath10k *ar)
 
        ar->hw->wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
        ar->hw->wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
+
        /*
         * on LL hardware queues are managed entirely by the FW
         * so we only advertise to mac we can do the queues thing

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
