Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGJz3-0006lT-DC
 for ath10k@lists.infradead.org; Wed, 09 May 2018 07:57:58 +0000
Received: by mail-lf0-x244.google.com with SMTP id t129-v6so10315199lff.3
 for <ath10k@lists.infradead.org>; Wed, 09 May 2018 00:57:47 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH] ath10k: hw: make consistent usage of ATH10K_FW_DIR in paths
Date: Wed,  9 May 2018 09:56:33 +0200
Message-Id: <20180509075633.3030-1-marcus.folkesson@gmail.com>
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, linux-wireless@vger.kernel.org

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index b8bdabe73073..23467e9fefeb 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -85,11 +85,11 @@ enum qca9377_chip_id_rev {
 	QCA9377_HW_1_1_CHIP_ID_REV = 0x1,
 };
 
-#define QCA6174_HW_2_1_FW_DIR		"ath10k/QCA6174/hw2.1"
+#define QCA6174_HW_2_1_FW_DIR		ATH10K_FW_DIR "/QCA6174/hw2.1"
 #define QCA6174_HW_2_1_BOARD_DATA_FILE	"board.bin"
 #define QCA6174_HW_2_1_PATCH_LOAD_ADDR	0x1234
 
-#define QCA6174_HW_3_0_FW_DIR		"ath10k/QCA6174/hw3.0"
+#define QCA6174_HW_3_0_FW_DIR		ATH10K_FW_DIR "/QCA6174/hw3.0"
 #define QCA6174_HW_3_0_BOARD_DATA_FILE	"board.bin"
 #define QCA6174_HW_3_0_PATCH_LOAD_ADDR	0x1234
 
-- 
2.16.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
