Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0UtP-0006QM-4f
 for ath10k@lists.infradead.org; Mon, 15 Dec 2014 12:36:52 +0000
Received: by mail-wg0-f53.google.com with SMTP id l18so14221237wgh.26
 for <ath10k@lists.infradead.org>; Mon, 15 Dec 2014 04:36:22 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC] ath10k: allow to use HT rates when IBSS
Date: Mon, 15 Dec 2014 13:35:31 +0100
Message-Id: <1418646931-6466-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

This fix TX problem when IBSS connected and
enabled HT rates. Before we used 6Mbps all the
time.

Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5475f0f..d358dab 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1408,6 +1408,7 @@ static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
 		}
 		break;
 	case WMI_VDEV_TYPE_STA:
+	case WMI_VDEV_TYPE_IBSS:
 		if (vif->bss_conf.qos)
 			arg->peer_flags |= WMI_PEER_QOS;
 		break;
@@ -1635,6 +1636,17 @@ static int ath10k_station_assoc(struct ath10k *ar,
 		return ret;
 	}
 
+	if (arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		ret = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
+						WMI_PEER_NSS, sta->rx_nss);
+		if (ret) {
+			ath10k_warn(ar, "failed to set nss param %d for STA %pM vdet %i: %d\n",
+				    sta->rx_nss, sta->addr,
+				    arvif->vdev_id, ret);
+			return ret;
+		}
+	}
+
 	/* Re-assoc is run only to update supported rates for given station. It
 	 * doesn't make much sense to reconfigure the peer completely.
 	 */
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
