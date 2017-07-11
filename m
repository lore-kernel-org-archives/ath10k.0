Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dUvfq-0006lg-1L
 for ath10k@lists.infradead.org; Tue, 11 Jul 2017 13:58:00 +0000
From: <mpubbise@qti.qualcomm.com>
Subject: [PATCH 3/3] ath10k: push peer type to target for TDLS peers
Date: Tue, 11 Jul 2017 19:26:18 +0530
Message-ID: <1499781378-858-4-git-send-email-mpubbise@qti.qualcomm.com>
In-Reply-To: <1499781378-858-1-git-send-email-mpubbise@qti.qualcomm.com>
References: <1499781378-858-1-git-send-email-mpubbise@qti.qualcomm.com>
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
Cc: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>

WMI interface for all the firmwares(except QCA6714) does not include the
type of peer(default/bss/tdls) requested during peer creation, therefore
target creates a default peer.

TDLS implementation on 10.4 firmware requires host to configure the
peer type(tdls) for TDLS peers. This patch adds peer type parameter to the
existing WMI interface for peer creation to accommodate this requirement.

Tested this change on QCA9888(10.4-3.5.1-00018) and QCA988x(10.2.4.70.9-2)
with ping tests for AP/STA modes.

Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    1 +
 drivers/net/wireless/ath/ath10k/wmi.h |    1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c91d804..b5e5a9e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -6500,6 +6500,7 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 	cmd = (struct wmi_peer_create_cmd *)skb->data;
 	cmd->vdev_id = __cpu_to_le32(vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
+	cmd->peer_type = __cpu_to_le32(peer_type);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
 		   "wmi peer create vdev_id %d peer_addr %pM\n",
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index eb95e8b..7b3a413 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5876,6 +5876,7 @@ struct wmi_tbtt_offset_event {
 struct wmi_peer_create_cmd {
 	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
+	__le32 peer_type;
 } __packed;
 
 enum wmi_peer_type {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
