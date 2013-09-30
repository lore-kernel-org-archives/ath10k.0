Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQirx-0005BB-5M
 for ath10k@lists.infradead.org; Mon, 30 Sep 2013 19:10:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k: split vdev_id calculation from tx function
References: <1380292706-3609-1-git-send-email-michal.kazior@tieto.com>
 <1380292706-3609-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 30 Sep 2013 22:10:30 +0300
In-Reply-To: <1380292706-3609-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 27 Sep 2013 16:38:24 +0200")
Message-ID: <87mwmudt21.fsf@kamboji.qca.qualcomm.com>
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

> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Empty commit log.

> ---
>  drivers/net/wireless/ath/ath10k/mac.c |   25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 7415a60..4b7c949 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -1421,6 +1421,19 @@ static u8 ath10k_tx_h_get_tid(struct ieee80211_hdr *hdr)
>  	return ieee80211_get_qos_ctl(hdr)[0] & IEEE80211_QOS_CTL_TID_MASK;
>  }
>  
> +static u8 ath10k_tx_h_get_vdev_id(struct ath10k *ar,
> +				  struct ieee80211_tx_info *info)
> +{
> +	if (info->control.vif)
> +		return ath10k_vif_to_arvif(info->control.vif)->vdev_id;
> +
> +	if (ar->monitor_enabled)
> +		return ar->monitor_vdev_id;
> +
> +	ath10k_warn("could not resolve vdev id\n");
> +	return 0;
> +}

Empty line before return would be nice.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
