Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIuSL-0001AW-4q
 for ath10k@lists.infradead.org; Mon, 30 Mar 2020 13:27:59 +0000
From: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Subject: [PATCH v2 2/2] ath10k: enable radar detection in secondary segment
Date: Mon, 30 Mar 2020 18:56:32 +0530
Message-Id: <1585574792-719-2-git-send-email-ssreeela@codeaurora.org>
In-Reply-To: <1585574792-719-1-git-send-email-ssreeela@codeaurora.org>
References: <1585574792-719-1-git-send-email-ssreeela@codeaurora.org>
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
Cc: Lei Wang <leiwa@codeaurora.org>, Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>, linux-wireless@vger.kernel.org

From: Lei Wang <leiwa@codeaurora.org>

Enable radar detection in secondary segment for VHT160 and VHT80+80 mode
on DFS channels. Otherwise, when injecting radar pulse in the secondary
segment, the DUT can't detect radar pulse.

Tested: qca9984 with firmware ver 10.4-3.10-00047

Signed-off-by: Lei Wang <leiwa@codeaurora.org>
Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  6 ++---
 drivers/net/wireless/ath/ath10k/wmi.c     | 39 ++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/wmi.h     |  5 ++--
 3 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 4e68deb..e1ab900f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2123,7 +2123,7 @@ ath10k_wmi_tlv_op_gen_vdev_start(struct ath10k *ar,
 	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_CHANNEL);
 	tlv->len = __cpu_to_le16(sizeof(*ch));
 	ch = (void *)tlv->value;
-	ath10k_wmi_put_wmi_channel(ch, &arg->channel);
+	ath10k_wmi_put_wmi_channel(ar, ch, &arg->channel);
 
 	ptr += sizeof(*tlv);
 	ptr += sizeof(*ch);
@@ -2763,7 +2763,7 @@ ath10k_wmi_tlv_op_gen_scan_chan_list(struct ath10k *ar,
 		tlv->len = __cpu_to_le16(sizeof(*ci));
 		ci = (void *)tlv->value;
 
-		ath10k_wmi_put_wmi_channel(ci, ch);
+		ath10k_wmi_put_wmi_channel(ar, ci, ch);
 
 		chans += sizeof(*tlv);
 		chans += sizeof(*ci);
@@ -3450,7 +3450,7 @@ ath10k_wmi_tlv_op_gen_tdls_peer_update(struct ath10k *ar,
 		tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_CHANNEL);
 		tlv->len = __cpu_to_le16(sizeof(*chan));
 		chan = (void *)tlv->value;
-		ath10k_wmi_put_wmi_channel(chan, &chan_arg[i]);
+		ath10k_wmi_put_wmi_channel(ar, chan, &chan_arg[i]);
 
 		ptr += sizeof(*tlv);
 		ptr += sizeof(*chan);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index db6f4c7..4a3a698 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1694,10 +1694,11 @@ static const struct wmi_peer_flags_map wmi_10_2_peer_flags_map = {
 	.bw160 = WMI_10_2_PEER_160MHZ,
 };
 
-void ath10k_wmi_put_wmi_channel(struct wmi_channel *ch,
+void ath10k_wmi_put_wmi_channel(struct ath10k *ar, struct wmi_channel *ch,
 				const struct wmi_channel_arg *arg)
 {
 	u32 flags = 0;
+	struct ieee80211_channel *chan = NULL;
 
 	memset(ch, 0, sizeof(*ch));
 
@@ -1717,20 +1718,36 @@ void ath10k_wmi_put_wmi_channel(struct wmi_channel *ch,
 	ch->band_center_freq2 = 0;
 	ch->mhz = __cpu_to_le32(arg->freq);
 	ch->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1);
-	if (arg->mode == MODE_11AC_VHT80_80)
+	if (arg->mode == MODE_11AC_VHT80_80) {
 		ch->band_center_freq2 = __cpu_to_le32(arg->band_center_freq2);
+		chan = ieee80211_get_channel(ar->hw->wiphy,
+					     arg->band_center_freq2 - 10);
+	}
 
 	if (arg->mode == MODE_11AC_VHT160) {
-		if (arg->freq > arg->band_center_freq1)
-			ch->band_center_freq1 =
-				__cpu_to_le32(arg->band_center_freq1 + 40);
-		else
-			ch->band_center_freq1 =
-				__cpu_to_le32(arg->band_center_freq1 - 40);
+		u32 band_center_freq1;
+		u32 band_center_freq2;
+
+		if (arg->freq > arg->band_center_freq1) {
+			band_center_freq1 = arg->band_center_freq1 + 40;
+			band_center_freq2 = arg->band_center_freq1 - 40;
+		} else {
+			band_center_freq1 = arg->band_center_freq1 - 40;
+			band_center_freq2 = arg->band_center_freq1 + 40;
+		}
 
+		ch->band_center_freq1 =
+					__cpu_to_le32(band_center_freq1);
+		/* Minus 10 to get a defined 5G channel frequency*/
+		chan = ieee80211_get_channel(ar->hw->wiphy,
+					     band_center_freq2 - 10);
+		/* The center frequency of the entire VHT160 */
 		ch->band_center_freq2 = __cpu_to_le32(arg->band_center_freq1);
 	}
 
+	if (chan && chan->flags & IEEE80211_CHAN_RADAR)
+		flags |= WMI_CHAN_FLAG_DFS_CFREQ2;
+
 	ch->min_power = arg->min_power;
 	ch->max_power = arg->max_power;
 	ch->reg_power = arg->max_reg_power;
@@ -7176,7 +7193,7 @@ ath10k_wmi_op_gen_vdev_start(struct ath10k *ar,
 		memcpy(cmd->ssid.ssid, arg->ssid, arg->ssid_len);
 	}
 
-	ath10k_wmi_put_wmi_channel(&cmd->chan, &arg->channel);
+	ath10k_wmi_put_wmi_channel(ar, &cmd->chan, &arg->channel);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
 		   "wmi vdev %s id 0x%x flags: 0x%0X, freq %d, mode %d, ch_flags: 0x%0X, max_power: %d\n",
@@ -7548,7 +7565,7 @@ ath10k_wmi_op_gen_scan_chan_list(struct ath10k *ar,
 		ch = &arg->channels[i];
 		ci = &cmd->chan_info[i];
 
-		ath10k_wmi_put_wmi_channel(ci, ch);
+		ath10k_wmi_put_wmi_channel(ar, ci, ch);
 	}
 
 	return skb;
@@ -8952,7 +8969,7 @@ ath10k_wmi_10_4_gen_tdls_peer_update(struct ath10k *ar,
 
 	for (i = 0; i < cap->peer_chan_len; i++) {
 		chan = (struct wmi_channel *)&peer_cap->peer_chan_list[i];
-		ath10k_wmi_put_wmi_channel(chan, &chan_arg[i]);
+		ath10k_wmi_put_wmi_channel(ar, chan, &chan_arg[i]);
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 5ba0c9a..2090707 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2094,7 +2094,8 @@ enum wmi_channel_change_cause {
 
 /* Indicate reason for channel switch */
 #define WMI_CHANNEL_CHANGE_CAUSE_CSA (1 << 13)
-
+/* DFS required on channel for 2nd segment of VHT160 and VHT80+80*/
+#define WMI_CHAN_FLAG_DFS_CFREQ2  (1 << 15)
 #define WMI_MAX_SPATIAL_STREAM        3 /* default max ss */
 
 /* HT Capabilities*/
@@ -7351,7 +7352,7 @@ void ath10k_wmi_put_start_scan_common(struct wmi_start_scan_common *cmn,
 				      const struct wmi_start_scan_arg *arg);
 void ath10k_wmi_set_wmm_param(struct wmi_wmm_params *params,
 			      const struct wmi_wmm_params_arg *arg);
-void ath10k_wmi_put_wmi_channel(struct wmi_channel *ch,
+void ath10k_wmi_put_wmi_channel(struct ath10k *ar, struct wmi_channel *ch,
 				const struct wmi_channel_arg *arg);
 int ath10k_wmi_start_scan_verify(const struct wmi_start_scan_arg *arg);
 
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
