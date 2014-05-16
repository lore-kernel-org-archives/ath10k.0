Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlIKf-00075p-0c
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:37:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  improve vdev map handling.
References: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
Date: Fri, 16 May 2014 16:37:27 +0300
In-Reply-To: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 30 Apr 2014 11:22:59
 -0700")
Message-ID: <878uq16e08.fsf@kamboji.qca.qualcomm.com>
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
> Check vdev map has space before calling ffs,
> fix invalid cleanup in failure to create vdev
> case.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> @@ -594,14 +594,14 @@ static int ath10k_monitor_vdev_create(struct ath10k *ar)
>  
>  	lockdep_assert_held(&ar->conf_mutex);
>  
> -	bit = ffs(ar->free_vdev_map);
> -	if (bit == 0) {
> +	if (!ar->free_vdev_map) {

As we are using ar->free_vdev_map as a bitmap, I think !foo is just
confusing. Wouldn't '== 0' make more sense here?

> @@ -638,7 +632,7 @@ static int ath10k_monitor_vdev_delete(struct ath10k *ar)
>  		return ret;
>  	}
>  
> -	ar->free_vdev_map |= 1 << (ar->monitor_vdev_id);
> +	ar->free_vdev_map |= (1 << ar->monitor_vdev_id);

Aren't the parentheses useless here?

> @@ -2622,11 +2616,12 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>  	INIT_WORK(&arvif->wep_key_work, ath10k_tx_wep_key_work);
>  	INIT_LIST_HEAD(&arvif->list);
>  
> -	bit = ffs(ar->free_vdev_map);
> -	if (bit == 0) {
> +	if (!ar->free_vdev_map) {

Ditto about '==0'.

> +		ath10k_warn("Free vdev map is empty, no more interfaces allowed.\n");
>  		ret = -EBUSY;
>  		goto err;
>  	}
> +	bit = ffs(ar->free_vdev_map);

Empty line after '}', please.

> @@ -2669,7 +2664,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>  		goto err;
>  	}
>  
> -	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
> +	ar->free_vdev_map &= ~(1 << arvif->vdev_id);

Why remove the BIT()? Not that it matters much, I just think it's easier
to read when BIT() macro is used. Would be good to convert all cases to
use BIT anyway, but that's for a separate patch.

>  err_vdev_delete:
>  	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
> -	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
> +	ar->free_vdev_map |= (1 << arvif->vdev_id);

Again why remove BIT()?

> @@ -2792,7 +2787,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
>  	}
>  	spin_unlock_bh(&ar->data_lock);
>  
> -	ar->free_vdev_map |= 1 << (arvif->vdev_id);
> +	ar->free_vdev_map |= (1 << arvif->vdev_id);

Do we need the parenthesis?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
