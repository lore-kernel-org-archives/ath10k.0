Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCKxt-0005cv-De
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 09:49:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 4/8] ath10k: add workqueue for RX path of sdio
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <1567679893-14029-5-git-send-email-wgong@codeaurora.org>
Date: Mon, 23 Sep 2019 12:49:01 +0300
In-Reply-To: <1567679893-14029-5-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Thu, 5 Sep 2019 18:38:09 +0800")
Message-ID: <87o8zb8hrm.fsf@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> The thread of read rx message by sdio bus from firmware is
> synchronous, it will cost much time for process the left part
> of rx message which includes indicate the rx packet to uppper
> net stack. It will reduce the time of read from sdio.

This paragraph is hard to read.

> This patch move the indication to a workqueue, it results in
> significant performance improvement on RX path.

How much is "significant"? Some numbers would make it a lot easier to
understand the importance of the changes.

> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> +static struct ath10k_sdio_rx_request *ath10k_sdio_alloc_rx_req(struct ath10k *ar)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_rx_request *rx_req;
> +
> +	spin_lock_bh(&ar_sdio->rx_lock);
> +
> +	if (list_empty(&ar_sdio->rx_req_freeq)) {
> +		rx_req = NULL;
> +		ath10k_dbg(ar, ATH10K_DBG_SDIO, "rx_req alloc fail\n");
> +		goto out;
> +	}
> +
> +	rx_req = list_first_entry(&ar_sdio->rx_req_freeq,
> +				  struct ath10k_sdio_rx_request, list);
> +	list_del(&rx_req->list);
> +
> +out:
> +	spin_unlock_bh(&ar_sdio->rx_lock);
> +	return rx_req;
> +}

The name of the function is "alloc" but it does not allocate anything?

> +static void ath10k_sdio_free_rx_req(struct ath10k *ar,
> +				    struct ath10k_sdio_rx_request *rx_req)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +
> +	memset(rx_req, 0, sizeof(*rx_req));
> +
> +	spin_lock_bh(&ar_sdio->rx_lock);
> +	list_add_tail(&rx_req->list, &ar_sdio->rx_req_freeq);
> +	spin_unlock_bh(&ar_sdio->rx_lock);
> +}

And this neither frees anything. IMHO that's quite misleading naming.
Maybe call _get() and _put()? Or maybe there's some more common naming
in kernel?

> +static int ath10k_sdio_prep_async_rx_req(struct ath10k *ar,
> +					 struct sk_buff *skb,
> +					 struct ath10k_htc_ep *ep)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_rx_request *rx_req;
> +
> +	/* Allocate a rx request for the message and queue it on the
> +	 * SDIO rx workqueue.
> +	 */
> +	rx_req = ath10k_sdio_alloc_rx_req(ar);
> +	if (!rx_req) {
> +		ath10k_warn(ar, "unable to allocate rx request for async request\n");
> +		return -ENOMEM;
> +	}
> +
> +	rx_req->skb = skb;
> +	rx_req->ep = ep;
> +
> +	spin_lock_bh(&ar_sdio->wr_async_lock_rx);
> +	list_add_tail(&rx_req->list, &ar_sdio->wr_asyncq_rx);
> +	spin_unlock_bh(&ar_sdio->wr_async_lock_rx);
> +
> +	return 0;
> +}

Is there enough room in struct ath10k_skb_cb so that you could add
struct ath10k_htc_ep there? That way struct ath10k_sdio_rx_request would
be useless and you could just use skb_queue_*() functions, which would
make this patch a lot simpler.

> @@ -209,6 +224,11 @@ struct ath10k_sdio {
>  	struct list_head wr_asyncq;
>  	/* protects access to wr_asyncq */
>  	spinlock_t wr_async_lock;
> +
> +	struct work_struct wr_async_work_rx;
> +	struct list_head wr_asyncq_rx;
> +	/* protects access to wr_asyncq_rx */
> +	spinlock_t wr_async_lock_rx;
>  };

I think the naming is now confusing. I'm guessing "wr_async_lock" means
"write asynchronous lock"? So what is wr_asyncq_rx then? It would a lot
simpler if we have tx_lock and rx_lock, or something like that.

Naturally all cleanup for wr_async_lock needs to be done in a separate
patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
