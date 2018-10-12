Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAtm8-0008Pb-Ai
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 09:30:29 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/3] ath10k: Disable interface pause wow config for integrated
 chipset
Date: Fri, 12 Oct 2018 15:00:02 +0530
Message-Id: <20181012093003.11932-3-govinds@codeaurora.org>
In-Reply-To: <20181012093003.11932-1-govinds@codeaurora.org>
References: <20181012093003.11932-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

wow pause iface config controls the PCI D0/D3-WOW cases for pcie
bus state. Firmware does not expects WOW_IFACE_PAUSE_ENABLED config
for bus/link that cannot be suspended ex:snoc and does not trigger
common subsystem shutdown.
Disable interface pause wow config for integrated chipset(WCN3990)
for correct WOW configuration in the firmware.

Testing:
    Tested on WCN3990 HW.
    Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 ++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 8c49a26fc571..1e608ef6499c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3185,6 +3185,8 @@ ath10k_wmi_tlv_op_gen_wow_enable(struct ath10k *ar)
 	cmd = (void *)tlv->value;
 
 	cmd->enable = __cpu_to_le32(1);
+	if (ar->hif.bus == ATH10K_BUS_SNOC)
+		cmd->pause_iface_config = WOW_IFACE_PAUSE_DISABLED;
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv wow enable\n");
 	return skb;
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 3e1e340cd834..a8bdb5614b9b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1968,8 +1968,15 @@ struct wmi_tlv_set_quiet_cmd {
 	__le32 enabled;
 } __packed;
 
+enum wmi_tlv_wow_interface_cfg {
+	WOW_IFACE_PAUSE_ENABLED,
+	WOW_IFACE_PAUSE_DISABLED
+};
+
 struct wmi_tlv_wow_enable_cmd {
 	__le32 enable;
+	__le32 pause_iface_config;
+	__le32 flags;
 } __packed;
 
 struct wmi_tlv_wow_host_wakeup_ind {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
