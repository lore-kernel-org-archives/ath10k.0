Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioiGu-0004aZ-S9
 for ath10k@lists.infradead.org; Tue, 07 Jan 2020 06:23:22 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath10k: avoid consecutive OTP download to reduce boot time
Date: Tue,  7 Jan 2020 11:53:15 +0530
Message-Id: <1578378195-25780-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Vikas Patel <vikpatel@codeaurora.org>, linux-wireless@vger.kernel.org

From: Vikas Patel <vikpatel@codeaurora.org>

Currently, OTP is downloaded twice in case of "pre-cal-dt"
and "pre-cal-file" to fetch the board ID and takes around
~2 sec more boot uptime.

First OTP download happens in "ath10k_core_probe_fw" and
second in ath10k_core_start. First boot does not need OTP
download in core start when valid board id acquired.

The second OTP download is required upon core stop/start.

This patch skips the OTP download when first OTP download
has acquired a valid board id. This patch also marks board
id invalid in "ath10k_core_stop", which will force the OTP
download in ath10k_core_start and fetches valid board id.

Tested HW: QCA9984
Tested FW: 10.4-3.6-00104

Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5ec16ce..8fef991 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -874,6 +874,13 @@ static int ath10k_core_get_board_id_from_otp(struct ath10k *ar)
 		return -ENODATA;
 	}
 
+	if (ar->id.bmi_ids_valid) {
+		ath10k_dbg(ar, ATH10K_DBG_BOOT,
+			   "boot already acquired valid otp board id,skip download, board_id %d chip_id %d\n",
+			   ar->id.bmi_board_id, ar->id.bmi_chip_id);
+		goto skip_otp_download;
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "boot upload otp to 0x%x len %zd for board id\n",
 		   address, ar->normal_mode_fw.fw_file.otp_len);
@@ -921,6 +928,8 @@ static int ath10k_core_get_board_id_from_otp(struct ath10k *ar)
 	ar->id.bmi_board_id = board_id;
 	ar->id.bmi_chip_id = chip_id;
 
+skip_otp_download:
+
 	return 0;
 }
 
@@ -2863,6 +2872,8 @@ void ath10k_core_stop(struct ath10k *ar)
 	ath10k_htt_tx_stop(&ar->htt);
 	ath10k_htt_rx_free(&ar->htt);
 	ath10k_wmi_detach(ar);
+
+	ar->id.bmi_ids_valid = false;
 }
 EXPORT_SYMBOL(ath10k_core_stop);
 
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
