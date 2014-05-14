Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkeOC-0008Ir-6I
 for ath10k@lists.infradead.org; Wed, 14 May 2014 18:58:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 5/5] ath10k: dont configure bssid for ap mode
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1399637749-13489-6-git-send-email-michal.kazior@tieto.com>
Date: Wed, 14 May 2014 21:58:19 +0300
In-Reply-To: <1399637749-13489-6-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 May 2014 14:15:49 +0200")
Message-ID: <87tx8schmc.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> FW creates self-peer for AP internally.
>
> This prevents ath10k from trying to create
> explicit self-peer during hw recovery and thus
> prevents a timeout and a warning during teardown:
>
>   ath10k: removing stale peer $AP_BSSID from vdev_id 0
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -2953,7 +2953,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
>  		arvif->u.ap.hidden_ssid = info->hidden_ssid;
>  	}
>  
> -	if (changed & BSS_CHANGED_BSSID) {
> +	if (changed & BSS_CHANGED_BSSID &&
> +	    vif->type != NL80211_IFTYPE_AP) {
>  		if (!is_zero_ether_addr(info->bssid)) {
>  			ath10k_dbg(ATH10K_DBG_MAC,
>  				   "mac vdev %d create peer %pM\n",

I think this deserves a comment, at least "Firmware creates self-peer in
AP mode automatically" or something like that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
