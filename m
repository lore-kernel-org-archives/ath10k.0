Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwSt7-0000fd-VS
 for ath10k@lists.infradead.org; Wed, 20 Feb 2019 14:30:23 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Add peer delete response event
Date: Wed, 20 Feb 2019 20:00:01 +0530
Message-Id: <1550673001-8779-1-git-send-email-pillair@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, Dundi Raviteja <dundi@codeaurora.org>

From: Dundi Raviteja <dundi@codeaurora.org>

Peer creation in firmware fails if last peer deletion is still
in progress.

The firmware sends a peer delete response event if it advertises
the service WMI_SERVICE_SYNC_DELETE_CMDS. This peer delete response
event is used to synchronize the peer deletion.

Add peer delete response event and wait for the event after
deleting every peer from host driver to synchronize with firmware.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c    |  3 ++-
 drivers/net/wireless/ath/ath10k/core.h    |  3 ++-
 drivers/net/wireless/ath/ath10k/mac.c     | 41 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 23 ++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  6 ++++-
 drivers/net/wireless/ath/ath10k/wmi.h     |  9 ++++++-
 6 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a1b2aea..21f60cd 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1,7 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -3105,6 +3105,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->vdev_setup_done);
 	init_completion(&ar->thermal.wmi_sync);
 	init_completion(&ar->bss_survey_done);
+	init_completion(&ar->peer_delete_done);
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath10k_scan_timeout_work);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2f43600..99951ed 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1,7 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -1197,6 +1197,7 @@ struct ath10k {
 	struct ath10k_radar_found_info last_radar_info;
 	struct work_struct radar_confirmation_work;
 	struct ath10k_bus_params bus_param;
+	struct completion peer_delete_done;
 
 	/* must be last */
 	u8 drv_priv[0] __aligned(sizeof(void *));
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 795446d..a9a2448 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -704,6 +704,26 @@ ath10k_mac_get_any_chandef_iter(struct ieee80211_hw *hw,
 	*def = &conf->def;
 }
 
+static void ath10k_wait_for_peer_delete_done(struct ath10k *ar, u32 vdev_id,
+					     const u8 *addr)
+{
+	unsigned long time_left;
+	int ret;
+
+	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
+		ret = ath10k_wait_for_peer_deleted(ar, vdev_id, addr);
+		if (ret) {
+			ath10k_warn(ar, "failed wait for peer deleted");
+			return;
+		}
+
+		time_left = wait_for_completion_timeout(&ar->peer_delete_done,
+							5 * HZ);
+		if (!time_left)
+			ath10k_warn(ar, "Timeout in receiving peer delete response\n");
+	}
+}
+
 static int ath10k_peer_create(struct ath10k *ar,
 			      struct ieee80211_vif *vif,
 			      struct ieee80211_sta *sta,
@@ -748,7 +768,7 @@ static int ath10k_peer_create(struct ath10k *ar,
 		spin_unlock_bh(&ar->data_lock);
 		ath10k_warn(ar, "failed to find peer %pM on vdev %i after creation\n",
 			    addr, vdev_id);
-		ath10k_wmi_peer_delete(ar, vdev_id, addr);
+		ath10k_wait_for_peer_delete_done(ar, vdev_id, addr);
 		return -ENOENT;
 	}
 
@@ -830,6 +850,18 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 	if (ret)
 		return ret;
 
+	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
+		unsigned long time_left;
+
+		time_left = wait_for_completion_timeout
+			    (&ar->peer_delete_done, 5 * HZ);
+
+		if (!time_left) {
+			ath10k_warn(ar, "Timeout in receiving peer delete response\n");
+			return -ETIMEDOUT;
+		}
+	}
+
 	ar->num_peers--;
 
 	return 0;
@@ -5426,8 +5458,11 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
-	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS)
+	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
+		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
+						 vif->addr);
+	}
 
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
@@ -5492,6 +5527,8 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 			ath10k_warn(ar, "failed to submit AP/IBSS self-peer removal on vdev %i: %d\n",
 				    arvif->vdev_id, ret);
 
+		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
+						 vif->addr);
 		kfree(arvif->u.ap.noa_data);
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 5d05bff..143eb88 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1,7 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -468,6 +468,24 @@ static void ath10k_wmi_event_tdls_peer(struct ath10k *ar, struct sk_buff *skb)
 	kfree(tb);
 }
 
+static int ath10k_wmi_tlv_event_peer_delete_resp(struct ath10k *ar,
+						 struct sk_buff *skb)
+{
+	struct wmi_peer_delete_resp_ev_arg *arg;
+	struct wmi_tlv *tlv_hdr;
+
+	tlv_hdr = (struct wmi_tlv *)skb->data;
+	arg = (struct wmi_peer_delete_resp_ev_arg *)tlv_hdr->value;
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "vdev id %d", arg->vdev_id);
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "peer mac addr %pM", &arg->peer_addr);
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv peer delete response\n");
+
+	complete(&ar->peer_delete_done);
+
+	return 0;
+}
+
 /***********/
 /* TLV ops */
 /***********/
@@ -617,6 +635,9 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_TLV_TDLS_PEER_EVENTID:
 		ath10k_wmi_event_tdls_peer(ar, skb);
 		break;
+	case WMI_TLV_PEER_DELETE_RESP_EVENTID:
+		ath10k_wmi_tlv_event_peer_delete_resp(ar, skb);
+		break;
 	case WMI_TLV_MGMT_TX_COMPLETION_EVENTID:
 		ath10k_wmi_event_mgmt_tx_compl(ar, skb);
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 4fba581..9e3335f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1,7 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -315,6 +315,8 @@ enum wmi_tlv_event_id {
 	WMI_TLV_PEER_TX_FAIL_CNT_THR_EVENTID,
 	WMI_TLV_PEER_ESTIMATED_LINKSPEED_EVENTID,
 	WMI_TLV_PEER_STATE_EVENTID,
+	WMI_TLV_PEER_ASSOC_CONF_EVENTID,
+	WMI_TLV_PEER_DELETE_RESP_EVENTID,
 	WMI_TLV_MGMT_RX_EVENTID = WMI_TLV_EV(WMI_TLV_GRP_MGMT),
 	WMI_TLV_HOST_SWBA_EVENTID,
 	WMI_TLV_TBTTOFFSET_UPDATE_EVENTID,
@@ -1557,6 +1559,8 @@ wmi_tlv_svc_map(const __le32 *in, unsigned long *out, size_t len)
 	       WMI_SERVICE_SAP_AUTH_OFFLOAD, len);
 	SVCMAP(WMI_TLV_SERVICE_MGMT_TX_WMI,
 	       WMI_SERVICE_MGMT_TX_WMI, len);
+	SVCMAP(WMI_TLV_SERVICE_SYNC_DELETE_CMDS,
+	       WMI_SERVICE_SYNC_DELETE_CMDS, len);
 }
 
 static inline void
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0e27878..5d1a17e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1,7 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -211,6 +211,7 @@ enum wmi_service {
 	WMI_SERVICE_RTT_RESPONDER_ROLE,
 	WMI_SERVICE_PER_PACKET_SW_ENCRYPT,
 	WMI_SERVICE_REPORT_AIRTIME,
+	WMI_SERVICE_SYNC_DELETE_CMDS,
 
 	/* Remember to add the new value to wmi_service_name()! */
 
@@ -502,6 +503,7 @@ static inline char *wmi_service_name(enum wmi_service service_id)
 	SVCSTR(WMI_SERVICE_RTT_RESPONDER_ROLE);
 	SVCSTR(WMI_SERVICE_PER_PACKET_SW_ENCRYPT);
 	SVCSTR(WMI_SERVICE_REPORT_AIRTIME);
+	SVCSTR(WMI_SERVICE_SYNC_DELETE_CMDS);
 
 	case WMI_SERVICE_MAX:
 		return NULL;
@@ -6748,6 +6750,11 @@ struct wmi_tlv_mgmt_tx_bundle_compl_ev_arg {
 	const __le32 *status;
 };
 
+struct wmi_peer_delete_resp_ev_arg {
+	__le32 vdev_id;
+	struct wmi_mac_addr peer_addr;
+};
+
 struct wmi_mgmt_rx_ev_arg {
 	__le32 channel;
 	__le32 snr;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
