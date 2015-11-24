Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1HZ2-0007gK-FO
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 17:39:43 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 2/3] ath10k: introduce new subtypes for proxy STA and Mesh
Date: Tue, 24 Nov 2015 09:37:34 -0800
Message-ID: <1448386655-13936-3-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
References: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
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

QCA988X firmware starting from 10.2.4.70.12-2 supports new
vdev subtypes for proxy STA and Mesh, hence add them to be used
as needed.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0747055..d85ad78 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4274,6 +4274,8 @@ enum wmi_vdev_subtype {
 	WMI_VDEV_SUBTYPE_P2P_DEVICE = 1,
 	WMI_VDEV_SUBTYPE_P2P_CLIENT = 2,
 	WMI_VDEV_SUBTYPE_P2P_GO     = 3,
+	WMI_VDEV_SUBTYPE_PROXY_STA	= 4,
+	WMI_VDEV_SUBTYPE_MESH		= 5,
 };
 
 /* values for vdev_subtype */
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
