Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLh2K-00020h-Fj
 for ath10k@lists.infradead.org; Tue, 07 Apr 2020 05:44:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/4] ath10k: disable TX complete indication of htt for
 sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200212080415.31265-2-wgong@codeaurora.org>
References: <20200212080415.31265-2-wgong@codeaurora.org>
Message-Id: <20200407054431.65C14C433D2@smtp.codeaurora.org>
Date: Tue,  7 Apr 2020 05:44:31 +0000 (UTC)
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

Wen Gong <wgong@codeaurora.org> wrote:

> For sdio chip, it is high latency bus, all the TX packet's content will
> be tranferred from HOST memory to firmware memory via sdio bus, then it
> need much more memory in firmware than low latency bus chip, for low
> latency chip, such as PCI-E, it only need to transfer the TX descriptor
> via PCI-E bus to firmware memory. For sdio chip, reduce the complexity of
> TX logic will help TX efficiency since its memory is limited, and it will
> reduce the TX circle's time of each packet and then firmware will have more
> memory for TX since TX complete also need memeory.
> 
> This patch disable TX complete indication from firmware for htt data
> packet, it will not have TX complete indication from firmware to ath10k.
> It will cut the cost of bus bandwidth of TX complete and make the TX
> logic of firmware simpler, it results in significant performance
> improvement on TX path.
> 
> Udp TX throughout is 130Mbps without this patch, and it arrives
> 400Mbps with this patch.
> 
> The downside of this patch is the command "iw wlan0 station dump" will
> show 0 for "tx retries" and "tx failed" since all tx packet's status
> is success.
> 
> This patch only effect sdio chip, it will not effect PCI, SNOC etc.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This has new warnings:

drivers/net/wireless/ath/ath10k/htt_tx.c: In function 'ath10k_htt_htc_tx_complete':
drivers/net/wireless/ath/ath10k/htt_tx.c:566:30: warning: 'msg_type' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath10k/htt_tx.c:573:6: warning: 'flags1' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath10k/htt_tx.c:577:42: warning: 'desc_hdr' may be used uninitialized in this function [-Wmaybe-uninitialized]

From what I can see these are false positives, but please do double check that. In
the pending branch I solved it like this:

--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -546,9 +546,9 @@ void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb)
        struct ath10k_htt *htt = &ar->htt;
        struct htt_tx_done tx_done = {0};
        struct htt_cmd_hdr *htt_hdr;
-       struct htt_data_tx_desc *desc_hdr;
-       u16 flags1;
-       u8 msg_type;
+       struct htt_data_tx_desc *desc_hdr = NULL;
+       u16 flags1 = 0;
+       u8 msg_type = 0;
 
        if (htt->disable_tx_comp) {
                htt_hdr = (struct htt_cmd_hdr *)skb->data;

-- 
https://patchwork.kernel.org/patch/11377827/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
