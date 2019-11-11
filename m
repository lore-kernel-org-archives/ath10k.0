Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU5PK-0004oE-4j
 for ath10k@lists.infradead.org; Mon, 11 Nov 2019 08:50:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k:mac: disassoc dbg msg after return check
References: <20191111083040.16824-1-eduardoabinader@gmail.com>
Date: Mon, 11 Nov 2019 10:50:41 +0200
In-Reply-To: <20191111083040.16824-1-eduardoabinader@gmail.com> (Eduardo
 Abinader's message of "Mon, 11 Nov 2019 09:30:40 +0100")
Message-ID: <87lfsmssny.fsf@kamboji.qca.qualcomm.com>
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
To: Eduardo Abinader <eduardoabinader@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Eduardo Abinader <eduardoabinader@gmail.com> writes:

> Signed-off-by: Eduardo Abinader <eduardoabinader@gmail.com>

No empty commit logs, please.

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6786,13 +6786,13 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
>  		/*
>  		 * Disassociation.
>  		 */
> -		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac sta %pM disassociated\n",
> -			   sta->addr);
> -
>  		ret = ath10k_station_disassoc(ar, vif, sta);
>  		if (ret)
>  			ath10k_warn(ar, "failed to disassociate station: %pM vdev %i: %i\n",
>  				    sta->addr, arvif->vdev_id, ret);
> +		else
> +			ath10k_dbg(ar, ATH10K_DBG_MAC, "mac sta %pM disassociated\n",
> +			   sta->addr);

I don't understand, how is this better?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
