Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj4HS-0007xi-08
 for ath10k@lists.infradead.org; Mon, 14 Jan 2019 15:36:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id r10so23365452wrs.10
 for <ath10k@lists.infradead.org>; Mon, 14 Jan 2019 07:36:01 -0800 (PST)
From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask in
 multiple APs conf
Date: Mon, 14 Jan 2019 16:35:58 +0100
Message-Id: <20190114153558.972-1-chunkeey@gmail.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>, Brian Norris <briannorris@chromium.org>, Mathias Kresin <dev@kresin.me>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>

Many integrated QCA9984 WiFis in various IPQ806x platform routers
from various vendors (Netgear R7800, ZyXEL NBG6817, TP-LINK C2600,
etc.) have either blank, bogus or non-unique MAC-addresses in
their calibration data.

As a result, OpenWrt utilizes a discouraged binary calibration data
patching method that allows to modify the device's MAC-addresses right
at the source. This is because the ath10k' firmware extracts the MAC
address from the supplied radio/calibration data and issues a response
to the ath10k linux driver. Which was designed to take the main MAC in
ath10k_wmi_event_ready().

Part of the "setting an alternate MAC" issue was already tackled by a
patch from Brian Norris:
commit 9d5804662ce1
("ath10k: retrieve MAC address from system firmware if provided")
by allowing the option to specify an alternate MAC-address with the
established device_get_mac_address() function which extracts the right
address from DeviceTree/fwnode mac-address or local-mac-address
properties and saves it for later.

However, Ben Greear noted that the Qualcomm's ath10k firmware is liable
to not properly calculate its rx-bssid mask in this case. This can cause
issues in the popluar "multiple AP with a single ath10k instance"
configurations.

To improve MAC address handling, Felix Fietkau suggested to call
pdev_set_base_macaddr_cmdid before bringing up the first vif and
use the first vif MAC address there. Which is in ath10k_core_start().

This patch implement Felix Fietkau's request to
"call pdev_set_base_macaddr_cmdid before bringing up the first vif".
The pdev_set_base_macaddr_cmdid is already declared for all devices
and version. The driver just needed the support code for this
function.

BugLink: https://lists.openwrt.org/pipermail/openwrt-devel/2018-November/014595.html
Fixes: 9d5804662ce1 ("ath10k: retrieve MAC address from system firmware if provided")
Cc: Brian Norris <briannorris@chromium.org>
Cc: Ben Greear <greearb@candelatech.com>
Cc: Felix Fietkau <nbd@nbd.name>
Cc: Mathias Kresin <dev@kresin.me>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

WARNING: line over 80 characters
L85: FILE: drivers/net/wireless/ath/ath10k/wmi-ops.h:68:
+                                 const u8 macaddr[ETH_ALEN]);

The function parameter has been aligned to match other functions
parameters that extend over 80 characters.

---
---
 drivers/net/wireless/ath/ath10k/core.c    |  7 +++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 18 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 24 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 24 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  4 ++++
 5 files changed, 77 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 399b501f3c3c..6b037e282fb9 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2649,6 +2649,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
+	status = ath10k_wmi_pdev_set_base_macaddr(ar, ar->mac_addr);
+	if (status) {
+		ath10k_err(ar,
+			   "failed to set base mac address: %d\n", status);
+		goto err_hif_stop;
+	}
+
 	/* Some firmware revisions do not properly set up hardware rx filter
 	 * registers.
 	 *
diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index 04663076d27a..4f8c7e402e6f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -66,6 +66,8 @@ struct wmi_ops {
 
 	struct sk_buff *(*gen_pdev_suspend)(struct ath10k *ar, u32 suspend_opt);
 	struct sk_buff *(*gen_pdev_resume)(struct ath10k *ar);
+	struct sk_buff *(*gen_pdev_set_base_macaddr)(struct ath10k *ar,
+						     const u8 macaddr[ETH_ALEN]);
 	struct sk_buff *(*gen_pdev_set_rd)(struct ath10k *ar, u16 rd, u16 rd2g,
 					   u16 rd5g, u16 ctl2g, u16 ctl5g,
 					   enum wmi_dfs_region dfs_reg);
@@ -506,6 +508,22 @@ ath10k_wmi_pdev_set_regdomain(struct ath10k *ar, u16 rd, u16 rd2g, u16 rd5g,
 				   ar->wmi.cmd->pdev_set_regdomain_cmdid);
 }
 
+static inline int
+ath10k_wmi_pdev_set_base_macaddr(struct ath10k *ar, const u8 macaddr[ETH_ALEN])
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_pdev_set_base_macaddr)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_pdev_set_base_macaddr(ar, macaddr);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb,
+				   ar->wmi.cmd->pdev_set_base_macaddr_cmdid);
+}
+
 static inline int
 ath10k_wmi_pdev_suspend_target(struct ath10k *ar, u32 suspend_opt)
 {
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 892bd8c30dd9..8a17a905548c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2228,6 +2228,28 @@ ath10k_wmi_tlv_op_gen_peer_create(struct ath10k *ar, u32 vdev_id,
 	return skb;
 }
 
+static struct sk_buff *
+ath10k_wmi_tlv_op_gen_pdev_set_base_macaddr(struct ath10k *ar,
+					    const u8 addr[ETH_ALEN])
+{
+	struct wmi_pdev_set_base_macaddr_cmd *cmd;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*tlv) + sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	tlv = (void *)skb->data;
+	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_PDEV_SET_BASE_MACADDR_CMD);
+	tlv->len = __cpu_to_le16(sizeof(*cmd));
+	cmd = (void *)tlv->value;
+	ether_addr_copy(cmd->mac_addr.addr, addr);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv set base macaddr\n");
+	return skb;
+}
+
 static struct sk_buff *
 ath10k_wmi_tlv_op_gen_peer_delete(struct ath10k *ar, u32 vdev_id,
 				  const u8 peer_addr[ETH_ALEN])
@@ -4110,6 +4132,8 @@ static const struct wmi_ops wmi_tlv_ops = {
 
 	.gen_pdev_suspend = ath10k_wmi_tlv_op_gen_pdev_suspend,
 	.gen_pdev_resume = ath10k_wmi_tlv_op_gen_pdev_resume,
+	.gen_pdev_set_base_macaddr =
+			ath10k_wmi_tlv_op_gen_pdev_set_base_macaddr,
 	.gen_pdev_set_rd = ath10k_wmi_tlv_op_gen_pdev_set_rd,
 	.gen_pdev_set_param = ath10k_wmi_tlv_op_gen_pdev_set_param,
 	.gen_init = ath10k_wmi_tlv_op_gen_init,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index ba837403e266..d4886eb989dc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -6239,6 +6239,25 @@ int ath10k_wmi_connect(struct ath10k *ar)
 	return 0;
 }
 
+static struct sk_buff *
+ath10k_wmi_op_gen_pdev_set_base_macaddr(struct ath10k *ar,
+					const u8 macaddr[ETH_ALEN])
+{
+	struct wmi_pdev_set_base_macaddr_cmd *cmd;
+	struct sk_buff *skb;
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	cmd = (struct wmi_pdev_set_base_macaddr_cmd *)skb->data;
+	ether_addr_copy(cmd->mac_addr.addr, macaddr);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi pdev basemac %pM\n", macaddr);
+	return skb;
+}
+
 static struct sk_buff *
 ath10k_wmi_op_gen_pdev_set_rd(struct ath10k *ar, u16 rd, u16 rd2g, u16 rd5g,
 			      u16 ctl2g, u16 ctl5g,
@@ -8885,6 +8904,7 @@ static const struct wmi_ops wmi_ops = {
 
 	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
 	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
+	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
 	.gen_pdev_set_rd = ath10k_wmi_op_gen_pdev_set_rd,
 	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
 	.gen_init = ath10k_wmi_op_gen_init,
@@ -8960,6 +8980,7 @@ static const struct wmi_ops wmi_10_1_ops = {
 
 	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
 	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
+	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
 	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
 	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
 	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
@@ -9032,6 +9053,7 @@ static const struct wmi_ops wmi_10_2_ops = {
 
 	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
 	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
+	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
 	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
 	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
 	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
@@ -9115,6 +9137,7 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 	.gen_peer_create = ath10k_wmi_op_gen_peer_create,
 	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
 	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
+	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
 	.gen_peer_set_param = ath10k_wmi_op_gen_peer_set_param,
 	.gen_set_psmode = ath10k_wmi_op_gen_set_psmode,
 	.gen_set_sta_ps = ath10k_wmi_op_gen_set_sta_ps,
@@ -9166,6 +9189,7 @@ static const struct wmi_ops wmi_10_4_ops = {
 
 	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
 	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
+	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
 	.gen_pdev_set_rd = ath10k_wmi_10x_op_gen_pdev_set_rd,
 	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
 	.gen_init = ath10k_wmi_10_4_op_gen_init,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 2034ccc7cc72..151abcb5ec35 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4083,6 +4083,10 @@ struct wmi_pdev_set_param_cmd {
 	__le32 param_value;
 } __packed;
 
+struct wmi_pdev_set_base_macaddr_cmd {
+	struct wmi_mac_addr mac_addr;
+} __packed;
+
 /* valid period is 1 ~ 60000ms, unit in millisecond */
 #define WMI_PDEV_PARAM_CAL_PERIOD_MAX 60000
 
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
