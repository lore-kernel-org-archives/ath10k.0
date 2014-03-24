Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRzqG-0006Nd-Iv
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 08:02:45 +0000
Received: by mail-pd0-f182.google.com with SMTP id y10so4998278pdj.13
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 01:02:17 -0700 (PDT)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: update wal_dbg_tx_stats structure with missing
 parameter
Date: Mon, 24 Mar 2014 16:02:02 +0800
Message-Id: <1395648122-2125-1-git-send-email-yeohchunyeow@gmail.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

This patch is introduced by Bartosz Markowski but never upstream.
By using this patch, 636 firmware is able to print out the peer
stats correctly and have caused no regression to the latest AP
firmware as well.

The original patch from Bartosz Markowski can be found at:
http://lists.infradead.org/pipermail/ath10k/2013-September/000318.html

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 2b2f0b7..d1275a3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2685,6 +2685,9 @@ struct wal_dbg_tx_stats {
 	/* wal pdev resets  */
 	__le32 pdev_resets;
 
+	/* frames dropped due to non-availability of stateless TIDs */
+	__le32 stateless_tid_alloc_failure;
+
 	__le32 phy_underrun;
 
 	/* MPDU is more than txop limit */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
