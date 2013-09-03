Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGpfs-00066h-DQ
 for ath10k@lists.infradead.org; Tue, 03 Sep 2013 12:25:37 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 1/2] ath10k: set the UART baud rate to 19200
Date: Tue, 3 Sep 2013 14:24:02 +0200
Message-ID: <1378211043-20299-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

When configuring the host_interests over BMI, set the UART
baud rate to 19200. This is valid for QCA988X_2.0 devices.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2dd39a8..2c1d2d7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -435,6 +435,13 @@ static int ath10k_init_uart(struct ath10k *ar)
 		return ret;
 	}
 
+	/* Set the UART baud rate to 19200. */
+	ret = ath10k_bmi_write32(ar, hi_desired_baud_rate, 19200);
+	if (ret) {
+		ath10k_warn("could not set the baud rate (%d)\n", ret);
+		return ret;
+	}
+
 	ath10k_info("UART prints enabled\n");
 	return 0;
 }
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
