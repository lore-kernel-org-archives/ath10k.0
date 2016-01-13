Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJNeA-0002nD-1d
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 15:47:42 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 2/7] ath10k: Fix naming Peer stats rssi_changed field in 10.2.4
Date: Wed, 13 Jan 2016 21:16:29 +0530
Message-ID: <1452699994-5078-3-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Fix naming of peer stats rssi_changed field in 10.2.4 to make it
more readable. As of now this field is not used, but necessary to
pull in fw_stats with appropriate length.

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e1bb02b..187f495 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4233,7 +4233,7 @@ struct wmi_10_2_peer_stats {
 
 struct wmi_10_2_4_peer_stats {
 	struct wmi_10_2_peer_stats common;
-	__le32 unknown_value; /* FIXME: what is this word? */
+	__le32 peer_rssi_changed;
 } __packed;
 
 struct wmi_10_2_4_ext_peer_stats {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
