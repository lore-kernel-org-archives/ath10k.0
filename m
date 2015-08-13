Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPzwk-0006RQ-26
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 21:21:58 +0000
Date: Fri, 14 Aug 2015 00:21:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: ath10k: remove DMA mapping wrappers
Message-ID: <20150813212130.GA15856@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: ath10k@lists.infradead.org

Hello Michal Kazior,

The patch 767d34fc67af: "ath10k: remove DMA mapping wrappers" from
Feb 27, 2014, leads to the following static checker warning:

	drivers/net/wireless/ath/ath10k/htt_tx.c:445 ath10k_htt_mgmt_tx()
	warn: dma_mapping_error() doesn't return an error code

drivers/net/wireless/ath/ath10k/htt_tx.c
   443          skb_cb->paddr = dma_map_single(dev, msdu->data, msdu->len,
   444                                         DMA_TO_DEVICE);
   445          res = dma_mapping_error(dev, skb_cb->paddr);
   446          if (res)
   447                  goto err_free_txdesc;
   448  

We should be returning an error code here instead of 1.  There are
several of these bugs.

drivers/net/wireless/ath/ath10k/htt_tx.c:530 ath10k_htt_tx() warn: dma_mapping_error() doesn't return an error code
drivers/net/wireless/ath/ath10k/pci.c:1667 ath10k_pci_hif_exchange_bmi_msg() warn: dma_mapping_error() doesn't return an error code
drivers/net/wireless/ath/ath10k/htc.c:147 ath10k_htc_send() warn: dma_mapping_error() doesn't return an error code

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
