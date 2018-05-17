Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJSIe-0006Zz-Ic
 for ath10k@lists.infradead.org; Thu, 17 May 2018 23:27:09 +0000
Received: by mail-wm0-x243.google.com with SMTP id o78-v6so11973653wmg.0
 for <ath10k@lists.infradead.org>; Thu, 17 May 2018 16:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180517231512.13085-1-niklas.cassel@linaro.org>
In-Reply-To: <20180517231512.13085-1-niklas.cassel@linaro.org>
From: Adrian Chadd <adrian.chadd@gmail.com>
Date: Thu, 17 May 2018 15:26:25 -0700
Message-ID: <CAJ-Vmon1ybhWs_8Nv=w62pmhSizDdDeYCgK8_HTTwPZ=EEC46g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: transmit queued frames after waking queues
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
To: niklas.cassel@linaro.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, David Miller <davem@davemloft.net>

On Thu, 17 May 2018 at 16:16, Niklas Cassel <niklas.cassel@linaro.org>
wrote:

> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c
b/drivers/net/wireless/ath/ath10k/txrx.c
> index cda164f6e9f6..1d3b2d2c3fee 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -95,6 +95,9 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>                  wake_up(&htt->empty_tx_wq);
>          spin_unlock_bh(&htt->tx_lock);

> +       if (htt->num_pending_tx <= 3 && !list_empty(&ar->txqs))
> +               ath10k_mac_tx_push_pending(ar);
> +

Just sanity checking - what's protecting htt->num_pending_tx? or is it
serialised some other way?

>          dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);

>          ath10k_report_offchan_tx(htt->ar, msdu);
> --
> 2.17.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
