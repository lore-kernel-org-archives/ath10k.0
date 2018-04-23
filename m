Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhpE-0004xX-J1
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 20:12:38 +0000
Received: by mail-io0-x242.google.com with SMTP id e78-v6so7430077iod.0
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 13:12:26 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
Subject: [PATCH 8/9] ath10k: use request_firmware_nowarn to load firmware
Date: Mon, 23 Apr 2018 16:12:04 -0400
Message-Id: <20180423201205.20533-9-andresx7@gmail.com>
In-Reply-To: <20180423201205.20533-1-andresx7@gmail.com>
References: <20180423201205.20533-1-andresx7@gmail.com>
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
To: linux-kernel@vger.kernel.org
Cc: arend.vanspriel@broadcom.com, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, andresx7@gmail.com, alexdeucher@gmail.com, christian.koenig@amd.com, kvalo@codeaurora.org

This reduces the unnecessary spew when trying to load optional firmware:
"Direct firmware load for ... failed with error -2"

Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
Acked-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f3ec13b80b20..9a225b7ad2d7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -652,7 +652,7 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
 		dir = ".";
 
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-	ret = request_firmware(&fw, filename, ar->dev);
+	ret = request_firmware_nowarn(&fw, filename, ar->dev);
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
 		   filename, ret);
 
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
