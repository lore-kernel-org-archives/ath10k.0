Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsoOf-0004Iw-0U
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 11:02:59 +0000
From: <yintang@qti.qualcomm.com>
Subject: [TDLS PATCH V1 4/5] ath10k: Avoid to set WEP key for TDLS peer
Date: Fri, 15 Sep 2017 19:03:39 +0800
Message-ID: <1505473420-22932-5-git-send-email-yintang@qti.qualcomm.com>
In-Reply-To: <1505473420-22932-1-git-send-email-yintang@qti.qualcomm.com>
References: <TDLS for ath10k>
 <1505473420-22932-1-git-send-email-yintang@qti.qualcomm.com>
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

From: Yingying Tang <yintang@qti.qualcomm.com>

TDLS peer do not need WEP key. Setting WEP key will lead
to TDLS setup failure. Add fix to avoid setting WEP key
for TDLS peer.

Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 399f9ba..f6702cb 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2966,7 +2966,7 @@ static int ath10k_station_assoc(struct ath10k *ar,
 		}
 
 		/* Plumb cached keys only for static WEP */
-		if (arvif->def_wep_key_idx != -1) {
+		if ((arvif->def_wep_key_idx != -1) && (!sta->tdls)) {
 			ret = ath10k_install_peer_wep_keys(arvif, sta->addr);
 			if (ret) {
 				ath10k_warn(ar, "failed to install peer wep keys for vdev %i: %d\n",
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
