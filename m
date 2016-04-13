Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqIkz-0006Ad-7j
 for ath10k@lists.infradead.org; Wed, 13 Apr 2016 11:14:50 +0000
Subject: [PATCH v2 4/5] ath10k: prefer ether_addr_copy() over memcpy()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 13 Apr 2016 14:14:02 +0300
Message-ID: <20160413111402.18823.24437.stgit@potku.adurom.net>
In-Reply-To: <20160413111247.18823.15952.stgit@potku.adurom.net>
References: <20160413111247.18823.15952.stgit@potku.adurom.net>
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

Fixes checkpatch warning:

drivers/net/wireless/ath/ath10k/wmi.c:5800: Prefer ether_addr_copy() over memcpy() if the Ethernet addresses are __aligned(2)

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e92ac26865ff..adb31e188ebd 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5827,9 +5827,8 @@ ath10k_wmi_put_start_scan_tlvs(struct wmi_start_scan_tlvs *tlvs,
 		bssids->num_bssid = __cpu_to_le32(arg->n_bssids);
 
 		for (i = 0; i < arg->n_bssids; i++)
-			memcpy(&bssids->bssid_list[i],
-			       arg->bssids[i].bssid,
-			       ETH_ALEN);
+			ether_addr_copy(bssids->bssid_list[i].addr,
+					arg->bssids[i].bssid);
 
 		ptr += sizeof(*bssids);
 		ptr += sizeof(struct wmi_mac_addr) * arg->n_bssids;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
