Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVDil-0000k2-9f
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 05:28:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix initial radar detection logic
References: <1396015934-7723-1-git-send-email-michal.kazior@tieto.com>
 <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 2 Apr 2014 08:27:48 +0300
In-Reply-To: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 1 Apr 2014 09:25:23 +0200")
Message-ID: <87eh1gs3l7.fsf@kamboji.qca.qualcomm.com>
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

> This fixes a problem of initial radar detection
> (CAC) being stuck and blocking Rx in some cases
> until all interfaces were brought down.

It would be good to describe more about the cases where this problem
happened.

> For userspace this meant first run of hostapd
> would perform CAC but due to filtered Rx no
> clients would associate. Subsequent runs of
> hostapd would not perform CAC (as it was already
> done) and would associate clients.
>
> This also makes sure radar detection is performed
> when bandwidth is widened. Before if 20MHz CAC was
> performed then 40MHz CAC wouldn't start monitor
> vdev effectively disabling initial radar
> detection.
>
> A driver should just start/stop radar detection
> based on hw->conf.radar_enabled. However, since
> ath10k needs to start a monitor vdev for the
> initial radar detection special care needs to be
> applied.
>
> While at it cleanup the code a bit.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -434,6 +434,8 @@ struct ath10k {
>  	unsigned int filter_flags;
>  	unsigned long dev_flags;
>  	u32 dfs_block_radar_events;
> +	bool radar_enabled; /* protected by conf_mutex */
> +	int num_started_vdevs; /* protected by conf_mutex */

I would prefer style like this:

        u32 dfs_block_radar_events;

        /* these are protected by conf_mutex */
        bool radar_enabled; 
        int num_started_vdevs;

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -489,6 +489,8 @@ static inline int ath10k_vdev_setup_sync(struct ath10k *ar)
>  	return 0;
>  }
>  
> +static void ath10k_recalc_radar_detection(struct ath10k *ar);

Forward declarations should be avoided if possible. Can you add a new
patch which just moves ath10k_recalc_radar_detection() and in this patch
you do the modifications in the function?

> @@ -571,6 +576,11 @@ static int ath10k_vdev_stop(struct ath10k_vif *arvif)
>  		return ret;
>  	}
>  
> +	if (WARN_ON(ar->num_started_vdevs == 0)) {
> +		ar->num_started_vdevs--;
> +		ath10k_recalc_radar_detection(ar);

Now num_started_vdevs will be -1, what does that mean? It would be good
to document that in struct ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
