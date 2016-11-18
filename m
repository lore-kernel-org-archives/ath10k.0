Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7om6-00065j-W5
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 19:24:40 +0000
Received: by mail-qk0-x242.google.com with SMTP id y205so858691qkb.1
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 11:24:21 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 10/11] ath10k: Added more host_interest members
Date: Fri, 18 Nov 2016 20:22:50 +0100
Message-Id: <1479496971-19174-11-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Augmented struct host_interest with more members.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/targaddrs.h |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/targaddrs.h b/drivers/net/wireless/ath/ath10k/targaddrs.h
index a47cab4..58e0541 100644
--- a/drivers/net/wireless/ath/ath10k/targaddrs.h
+++ b/drivers/net/wireless/ath/ath10k/targaddrs.h
@@ -205,6 +205,24 @@ struct host_interest {
 	 */
 	/* Bit 1 - unused */
 	u32 hi_fw_swap;					/* 0x104 */
+
+	/* global arenas pointer address, used by host driver debug */
+	u32 hi_dynamic_mem_arenas_addr;			/* 0x108 */
+
+	/* allocated bytes of DRAM use by allocated */
+	u32 hi_dynamic_mem_allocated;			/* 0x10C */
+
+	/* remaining bytes of DRAM */
+	u32 hi_dynamic_mem_remaining;			/* 0x110 */
+
+	/* memory track count, configured by host */
+	u32 hi_dynamic_mem_track_max;			/* 0x114 */
+
+	/* minidump buffer */
+	u32 hi_minidump;				/* 0x118 */
+
+	/* bdata's sig and key addr */
+	u32 hi_bd_sig_key;				/* 0x11c */
 } __packed;
 
 #define HI_ITEM(item)  offsetof(struct host_interest, item)
@@ -319,6 +337,12 @@ struct host_interest {
 #define HI_ACS_FLAGS_USE_WWAN       (1 << 1)
 /* Use test VAP */
 #define HI_ACS_FLAGS_TEST_VAP       (1 << 2)
+/* SDIO/mailbox ACS flag definitions */
+#define HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET       (1 << 0)
+#define HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET    (1 << 1)
+#define HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE        (1 << 2)
+#define HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_FW_ACK    (1 << 16)
+#define HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_FW_ACK (1 << 17)
 
 /*
  * CONSOLE FLAGS
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
