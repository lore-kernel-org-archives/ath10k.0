Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKCOk-00040h-G0
 for ath10k@lists.infradead.org; Thu, 22 Dec 2016 23:03:43 +0000
From: <ryanhsu@qca.qualcomm.com>
Subject: [PATCH] ath10k: ignore configuring the incorrect board_id
Date: Thu, 22 Dec 2016 15:02:37 -0800
Message-ID: <1482447757-23577-1-git-send-email-ryanhsu@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qca.qualcomm.com

From: Ryan Hsu <ryanhsu@qca.qualcomm.com>

With command to get board_id from otp, in the case of following

  boot get otp board id result 0x00000000 board_id 0 chip_id 0
  boot using board name 'bus=pci,bmi-chip-id=0,bmi-board-id=0"
  ...
  failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=0 from
  ath10k/QCA6174/hw3.0/board-2.bin

The invalid board_id=0 will be used as index to search in the board-2.bin.

Ignore the case with board_id=0, as it means the otp is not carrying
the board id information.

Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 749e381..1bf67ad 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -694,8 +694,11 @@ static int ath10k_core_get_board_id_from_otp(struct ath10k *ar)
 		   "boot get otp board id result 0x%08x board_id %d chip_id %d\n",
 		   result, board_id, chip_id);
 
-	if ((result & ATH10K_BMI_BOARD_ID_STATUS_MASK) != 0)
+	if ((result & ATH10K_BMI_BOARD_ID_STATUS_MASK) != 0 ||
+	    (board_id == 0)) {
+		ath10k_warn(ar, "board id is not exist in otp, ignore it\n");
 		return -EOPNOTSUPP;
+	}
 
 	ar->id.bmi_ids_valid = true;
 	ar->id.bmi_board_id = board_id;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
