Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJcoB-0001iz-MC
 for ath10k@lists.infradead.org; Tue, 28 Nov 2017 10:08:09 +0000
From: <bpothuno@qti.qualcomm.com>
Subject: [PATCH] ath10k: handling qos at STA side based on AP WMM
 enable/disable
Date: Tue, 28 Nov 2017 15:37:30 +0530
Message-ID: <1511863650-9419-1-git-send-email-bpothuno@qti.qualcomm.com>
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
Cc: Balaji Pothunoori <bpothuno@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Balaji Pothunoori <bpothuno@qti.qualcomm.com>

Data packets are not sent by STA in case of STA joined to
non QOS AP (WMM disabled AP). This is happening because of STA
is sending data packets to firmware from host with qos enabled
along with non qos queue value(TID = 16).
Due to qos enabled, firmware is discarding the packet.

This patch fixes this issue by updating the qos based on station
WME capability field if WMM is disabled in AP.

This patch is required by 10.4 family chipsets like
QCA4019/QCA9888/QCA9884/QCA99X0.
Firmware Versoin : 10.4-3.5.1-00018.

For 10.2.4 family chipsets QCA988X/QCA9887 and QCA6174 this patch
has no effect.

Signed-off-by: Balaji Pothunoori <bpothuno@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0a947ee..2616b99 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2563,7 +2563,7 @@ static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
 		}
 		break;
 	case WMI_VDEV_TYPE_STA:
-		if (vif->bss_conf.qos)
+		if (sta->wme)
 			arg->peer_flags |= arvif->ar->wmi.peer_flags->qos;
 		break;
 	case WMI_VDEV_TYPE_IBSS:
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
