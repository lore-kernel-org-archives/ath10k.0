Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0ntx-0001VU-DY
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 08:54:42 +0000
Received: by mail-wg0-f53.google.com with SMTP id l18so16472643wgh.26
 for <ath10k@lists.infradead.org>; Tue, 16 Dec 2014 00:54:19 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH 1/2] ath10k: fix low TX rates when IBSS and HT
Date: Tue, 16 Dec 2014 09:52:59 +0100
Message-Id: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
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

This fix TX problem when IBSS used in HT mode.
Before we used 6Mbps all the time for TX direction.

Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5475f0f..c9e7995 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1411,9 +1411,16 @@ static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
 		if (vif->bss_conf.qos)
 			arg->peer_flags |= WMI_PEER_QOS;
 		break;
+	case WMI_VDEV_TYPE_IBSS:
+		if (sta->wme)
+			arg->peer_flags |= WMI_PEER_QOS;
+		break;
 	default:
 		break;
 	}
+
+	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac peer %pM qos %d\n",
+		   sta->addr, !!(arg->peer_flags & WMI_PEER_QOS));
 }
 
 static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
