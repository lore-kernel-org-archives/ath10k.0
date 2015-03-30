Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcZTS-0005zm-RH
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 13:11:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5 2/7] ath10k: implement chanctx API
References: <1427200993-7550-1-git-send-email-michal.kazior@tieto.com>
 <1427200993-7550-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 30 Mar 2015 16:10:56 +0300
In-Reply-To: <1427200993-7550-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Mar 2015 12:43:08 +0000")
Message-ID: <87mw2u4om7.fsf@kamboji.qca.qualcomm.com>
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

> The chanctx API will allow ath10k to support
> multi-channel operation.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -1754,13 +1945,19 @@ static void ath10k_peer_assoc_h_crypto(struct ath10k *ar,
>  				       struct wmi_peer_assoc_complete_arg *arg)
>  {
>  	struct ieee80211_bss_conf *info = &vif->bss_conf;
> +	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
> +	struct ath10k_chanctx *arctx;
>  	struct cfg80211_bss *bss;
>  	const u8 *rsnie = NULL;
>  	const u8 *wpaie = NULL;
>  
>  	lockdep_assert_held(&ar->conf_mutex);
>  
> -	bss = cfg80211_get_bss(ar->hw->wiphy, ar->hw->conf.chandef.chan,
> +	arctx = ath10k_mac_vif_ctx(arvif);
> +	if (WARN_ON(!arctx))
> +		return;
> +
> +	bss = cfg80211_get_bss(ar->hw->wiphy, arctx->conf.def.chan,
>  			       info->bssid, NULL, 0, 0, 0);

As I had to pull mac80211-next for TDLS there was a conflict here.
Please check the pending branch for my conflict resolution.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
