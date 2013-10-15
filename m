Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW9gg-0001Pp-RA
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 18:49:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/7] ath10k: track vif list internally
References: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
 <20131015184656.14123.70575.stgit@localhost6.localdomain6>
Date: Tue, 15 Oct 2013 21:49:19 +0300
In-Reply-To: <20131015184656.14123.70575.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Tue, 15 Oct 2013 21:46:56 +0300")
Message-ID: <87a9iabc9c.fsf@kamboji.qca.qualcomm.com>
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
To: michal.kazior@tieto.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Michal Kazior <michal.kazior@tieto.com>
>
> mac80211 interface interations functions have
> peculiar locking issues. This patch introduces
> internal (to ath10k) vif list that will be used
> for vif iteration purposes.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -713,6 +713,7 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
>  	mutex_init(&ar->conf_mutex);
>  	spin_lock_init(&ar->data_lock);
>  
> +	INIT_LIST_HEAD(&ar->arvifs);
>  	INIT_LIST_HEAD(&ar->peers);
>  	init_waitqueue_head(&ar->peer_mapping_wq);
>  
> @@ -824,6 +825,7 @@ int ath10k_core_start(struct ath10k *ar)
>  		goto err_disconnect_htc;
>  
>  	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
> +	INIT_LIST_HEAD(&ar->arvifs);
>  
>  	return 0;

Michal, why do the INIT_LIST_HEAD() twice? Isn't it enough to do it
core_start()?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
