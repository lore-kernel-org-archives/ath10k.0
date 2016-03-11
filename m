Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeGLn-000307-Is
 for ath10k@lists.infradead.org; Fri, 11 Mar 2016 06:15:04 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: fix debugfs pktlog_filter write
Date: Fri, 11 Mar 2016 11:46:39 +0530
Message-ID: <1457676999-32678-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org, stable@vger.kernel.org

From: Anilkumar Kolli <akolli@qti.qualcomm.com>

It is observed that, we are disabling the packet log if we write same
value to the pktlog_filter for the second time. Always enable pktlogs
on non zero filter.

Fixes: 90174455ae05 ("ath10k: add support to configure pktlog filter")
Cc: stable@vger.kernel.org
Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
---
v2:
 * added stable@vger.kernel.org

 drivers/net/wireless/ath/ath10k/debug.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 076d29b53ddf..0f834646e6a7 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2019,7 +2019,12 @@ static ssize_t ath10k_write_pktlog_filter(struct file *file,
 		goto out;
 	}
 
-	if (filter && (filter != ar->debug.pktlog_filter)) {
+	if (filter == ar->debug.pktlog_filter) {
+		ret = count;
+		goto out;
+	}
+
+	if (filter) {
 		ret = ath10k_wmi_pdev_pktlog_enable(ar, filter);
 		if (ret) {
 			ath10k_warn(ar, "failed to enable pktlog filter %x: %d\n",
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
