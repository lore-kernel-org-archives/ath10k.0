Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJypu-0005xR-NA
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 11:48:28 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v6] ath10k: enable napi on RX path for sdio
Date: Mon, 14 Oct 2019 19:47:53 +0800
Message-Id: <20191014114753.7459-1-wgong@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

For tcp RX, the quantity of tcp acks to remote is 1/2 of the quantity
of tcp data from remote, then it will have many small length packets
on TX path of sdio bus, then it reduce the RX packets's bandwidth of
tcp.

This patch enable napi on RX path, then the RX packet of tcp will not
feed to tcp stack immeditely from mac80211 since GRO is enabled by
default, it will feed to tcp stack after napi complete, if rx bundle
is enabled, then it will feed to tcp stack one time for each bundle
of RX. For example, RX bundle size is 32, then tcp stack will receive
one large length packet, its length is neary 1500*32, then tcp stack
will send a tcp ack for this large packet, this will reduce the tcp
acks ratio from 1/2 to 1/32. This results in significant performance
improvement for tcp RX.

Tcp rx throughout is 240Mbps without this patch, and it arrive 390Mbps
with this patch. The cpu usage has no obvious difference with and
without NAPI.

call stack for each RX packet on GRO path:
(skb length is about 1500 bytes)
  skb_gro_receive ([kernel.kallsyms])
  tcp4_gro_receive ([kernel.kallsyms])
  inet_gro_receive ([kernel.kallsyms])
  dev_gro_receive ([kernel.kallsyms])
  napi_gro_receive ([kernel.kallsyms])
  ieee80211_deliver_skb ([mac80211])
  ieee80211_rx_handlers ([mac80211])
  ieee80211_prepare_and_rx_handle ([mac80211])
  ieee80211_rx_napi ([mac80211])
  ath10k_htt_rx_proc_rx_ind_hl ([ath10k_core])
  ath10k_htt_rx_pktlog_completion_handler ([ath10k_core])
  ath10k_sdio_napi_poll ([ath10k_sdio])
  net_rx_action ([kernel.kallsyms])
  softirqentry_text_start ([kernel.kallsyms])
  do_softirq ([kernel.kallsyms])

call stack for napi complete and send tcp ack from tcp stack:
(skb length is about 1500*32 bytes)
 _tcp_ack_snd_check ([kernel.kallsyms])
 tcp_v4_do_rcv ([kernel.kallsyms])
 tcp_v4_rcv ([kernel.kallsyms])
 local_deliver_finish ([kernel.kallsyms])
 ip_local_deliver ([kernel.kallsyms])
 ip_rcv_finish ([kernel.kallsyms])
 ip_rcv ([kernel.kallsyms])
 netif_receive_skb_core ([kernel.kallsyms])
 netif_receive_skb_one_core([kernel.kallsyms])
 netif_receive_skb ([kernel.kallsyms])
 netif_receive_skb_internal ([kernel.kallsyms])
 napi_gro_complete ([kernel.kallsyms])
 napi_gro_flush ([kernel.kallsyms])
 napi_complete_done ([kernel.kallsyms])
 ath10k_sdio_napi_poll ([ath10k_sdio])
 net_rx_action ([kernel.kallsyms])
 __softirqentry_text_start ([kernel.kallsyms])
 do_softirq ([kernel.kallsyms])

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00017-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v6: add napi check for ath10k_htt_rx_proc_rx_ind_hl
this is 1 patches of the 7 patches from ath10k: improve throughout of tcp/udp TX/RX of sdio.
it depends on patches: "ath10k: improve throughout of RX of sdio"
v5: move skb_queue_head_init(&ar->htt.rx_indication_head)
from ath10k_htt_connect to ath10k_core_create to forbidden 
init 2 times
v4: change some code style
v3: change some code style
v2: no change
 drivers/net/wireless/ath/ath10k/core.c   |  2 +
 drivers/net/wireless/ath/ath10k/htt.h    |  3 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 48 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/sdio.c   | 33 ++++++++++++++++
 4 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 36c62d66c19e..cbd56db2dc78 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3223,6 +3223,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_waitqueue_head(&ar->htt.empty_tx_wq);
 	init_waitqueue_head(&ar->wmi.tx_credits_wq);
 
+	skb_queue_head_init(&ar->htt.rx_indication_head);
+
 	init_completion(&ar->offchan_tx_completed);
 	INIT_WORK(&ar->offchan_tx_work, ath10k_offchan_tx_work);
 	skb_queue_head_init(&ar->offchan_tx_queue);
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 30c080094af1..4a12564fc30e 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1869,6 +1869,8 @@ struct ath10k_htt {
 	struct ath10k *ar;
 	enum ath10k_htc_ep_id eid;
 
+	struct sk_buff_head rx_indication_head;
+
 	u8 target_version_major;
 	u8 target_version_minor;
 	struct completion target_version_received;
@@ -2283,6 +2285,7 @@ int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *msdu);
 void ath10k_htt_rx_pktlog_completion_handler(struct ath10k *ar,
 					     struct sk_buff *skb);
 int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget);
+int ath10k_htt_rx_hl_indication(struct ath10k *ar, int budget);
 void ath10k_htt_set_tx_ops(struct ath10k_htt *htt);
 void ath10k_htt_set_rx_ops(struct ath10k_htt *htt);
 #endif
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9f0e7b4943ec..44c32cf051bf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2350,7 +2350,10 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 		memcpy(skb->data + offset, &qos_ctrl, IEEE80211_QOS_CTL_LEN);
 	}
 
-	ieee80211_rx_ni(ar->hw, skb);
+	if (ar->napi.dev)
+		ieee80211_rx_napi(ar->hw, NULL, skb, &ar->napi);
+	else
+		ieee80211_rx_ni(ar->hw, skb);
 
 	/* We have delivered the skb to the upper layers (mac80211) so we
 	 * must not free it.
@@ -3751,14 +3754,12 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_RX_IND:
-		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL)
-			return ath10k_htt_rx_proc_rx_ind_hl(htt,
-							    &resp->rx_ind_hl,
-							    skb,
-							    HTT_RX_PN_CHECK,
-							    HTT_RX_NON_TKIP_MIC);
-		else
+		if (ar->bus_param.dev_type != ATH10K_DEV_TYPE_HL) {
 			ath10k_htt_rx_proc_rx_ind_ll(htt, &resp->rx_ind);
+		} else {
+			skb_queue_tail(&htt->rx_indication_head, skb);
+			return false;
+		}
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP: {
 		struct htt_peer_map_event ev = {
@@ -3948,6 +3949,37 @@ static int ath10k_htt_rx_deliver_msdu(struct ath10k *ar, int quota, int budget)
 	return quota;
 }
 
+int ath10k_htt_rx_hl_indication(struct ath10k *ar, int budget)
+{
+	struct htt_resp *resp;
+	struct ath10k_htt *htt = &ar->htt;
+	struct sk_buff *skb;
+	bool release;
+	int quota;
+
+	for (quota = 0; quota < budget; quota++) {
+		skb = skb_dequeue(&htt->rx_indication_head);
+		if (!skb)
+			break;
+
+		resp = (struct htt_resp *)skb->data;
+
+		release = ath10k_htt_rx_proc_rx_ind_hl(htt,
+						       &resp->rx_ind_hl,
+						       skb,
+						       HTT_RX_PN_CHECK,
+						       HTT_RX_NON_TKIP_MIC);
+
+		if (release)
+			dev_kfree_skb_any(skb);
+
+		ath10k_dbg(ar, ATH10K_DBG_HTT, "rx indication poll pending count:%d\n",
+			   skb_queue_len(&htt->rx_indication_head));
+	}
+	return quota;
+}
+EXPORT_SYMBOL(ath10k_htt_rx_hl_indication);
+
 int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 {
 	struct ath10k_htt *htt = &ar->htt;
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index ff0283315fd1..7fdf2eda76e1 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1341,6 +1341,9 @@ static void ath10k_rx_indication_async_work(struct work_struct *work)
 		ep = &ar->htc.endpoint[cb->eid];
 		ep->ep_ops.ep_rx_complete(ar, skb);
 	}
+
+	if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
+		napi_schedule(&ar->napi);
 }
 
 static void ath10k_sdio_write_async_work(struct work_struct *work)
@@ -1731,6 +1734,8 @@ static int ath10k_sdio_hif_start(struct ath10k *ar)
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	int ret;
 
+	napi_enable(&ar->napi);
+
 	/* Sleep 20 ms before HIF interrupts are disabled.
 	 * This will give target plenty of time to process the BMI done
 	 * request before interrupts are disabled.
@@ -1855,6 +1860,9 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 	}
 
 	spin_unlock_bh(&ar_sdio->wr_async_lock);
+
+	napi_synchronize(&ar->napi);
+	napi_disable(&ar->napi);
 }
 
 #ifdef CONFIG_PM
@@ -2030,6 +2038,26 @@ static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
 
 #endif /* CONFIG_PM_SLEEP */
 
+static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
+{
+	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
+	int done;
+
+	done = ath10k_htt_rx_hl_indication(ar, budget);
+	ath10k_dbg(ar, ATH10K_DBG_SDIO, "napi poll: done: %d, budget:%d\n", done, budget);
+
+	if (done < budget)
+		napi_complete_done(ctx, done);
+
+	return done;
+}
+
+void ath10k_sdio_init_napi(struct ath10k *ar)
+{
+	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll,
+		       ATH10K_NAPI_BUDGET);
+}
+
 static int ath10k_sdio_probe(struct sdio_func *func,
 			     const struct sdio_device_id *id)
 {
@@ -2055,6 +2083,8 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		return -ENOMEM;
 	}
 
+	ath10k_sdio_init_napi(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "sdio new func %d vendor 0x%x device 0x%x block 0x%x/0x%x\n",
 		   func->num, func->vendor, func->device,
@@ -2165,6 +2195,9 @@ static void ath10k_sdio_remove(struct sdio_func *func)
 		   func->num, func->vendor, func->device);
 
 	ath10k_core_unregister(ar);
+
+	netif_napi_del(&ar->napi);
+
 	ath10k_core_destroy(ar);
 
 	flush_workqueue(ar_sdio->workqueue);
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
