Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvf2P-00083Z-CR
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:07:31 +0000
Subject: [PATCH 3/7] ath10k: add ath10k_sdio_read()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 5 Apr 2017 10:06:53 +0300
Message-ID: <149137601370.4898.4600249077985000688.stgit@potku.adurom.net>
In-Reply-To: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
References: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
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

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c |   40 +++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 56728d44dd12..bbd8317de861 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -343,6 +343,31 @@ static int ath10k_sdio_read32(struct ath10k *ar, u32 addr, u32 *val)
 	return ret;
 }
 
+static int ath10k_sdio_read(struct ath10k *ar, u32 addr, void *buf, size_t len)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct sdio_func *func = ar_sdio->func;
+	int ret;
+
+	sdio_claim_host(func);
+
+	ret = sdio_memcpy_fromio(func, buf, addr, len);
+	if (ret) {
+		ath10k_warn(ar, "failed to read from address 0x%x: %d\n",
+			    addr, ret);
+		goto out;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio read addr 0x%x buf 0x%p len %zu\n",
+		   addr, buf, len);
+	ath10k_dbg_dump(ar, ATH10K_DBG_SDIO_DUMP, NULL, "sdio read ", buf, len);
+
+out:
+	sdio_release_host(func);
+
+	return ret;
+}
+
 /* HIF mbox functions */
 
 static int ath10k_sdio_mbox_rx_process_packet(struct ath10k *ar,
@@ -859,11 +884,8 @@ static int ath10k_sdio_mbox_read_int_status(struct ath10k *ar,
 	 * will yield us the value of different int status
 	 * registers and the lookahead registers.
 	 */
-	ret = ath10k_sdio_read_write_sync(ar,
-					  MBOX_HOST_INT_STATUS_ADDRESS,
-					  (u8 *)irq_proc_reg,
-					  sizeof(*irq_proc_reg),
-					  HIF_RD_SYNC_BYTE_INC);
+	ret = ath10k_sdio_read(ar, MBOX_HOST_INT_STATUS_ADDRESS,
+			       irq_proc_reg, sizeof(*irq_proc_reg));
 	if (ret)
 		goto out;
 
@@ -1175,9 +1197,7 @@ static int ath10k_sdio_bmi_exchange_msg(struct ath10k *ar,
 
 	/* We always read from the start of the mbox address */
 	addr = ar_sdio->mbox_info.htc_addr;
-	ret = ath10k_sdio_read_write_sync(ar, addr, ar_sdio->bmi_buf,
-					  *resp_len,
-					  HIF_RD_SYNC_BYTE_INC);
+	ret = ath10k_sdio_read(ar, addr, ar_sdio->bmi_buf, *resp_len);
 	if (ret) {
 		ath10k_warn(ar,
 			    "unable to read the bmi data from the device: %d\n",
@@ -1538,9 +1558,7 @@ static int ath10k_sdio_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
 	}
 
 	/* read the data */
-	ret = ath10k_sdio_read_write_sync(ar, MBOX_WINDOW_DATA_ADDRESS,
-					  (u8 *)buf, buf_len,
-					  HIF_RD_SYNC_BYTE_INC);
+	ret = ath10k_sdio_read(ar, MBOX_WINDOW_DATA_ADDRESS, buf, buf_len);
 	if (ret) {
 		ath10k_warn(ar, "failed to read from mbox window data addrress: %d\n",
 			    ret);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
