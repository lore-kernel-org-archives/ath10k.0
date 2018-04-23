Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhpF-0004rU-Kz
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 20:12:51 +0000
Received: by mail-it0-x242.google.com with SMTP id m134-v6so12623517itb.3
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 13:12:27 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
Subject: [PATCH 9/9] ath10k: re-enable the firmware fallback mechanism for
 testmode
Date: Mon, 23 Apr 2018 16:12:05 -0400
Message-Id: <20180423201205.20533-10-andresx7@gmail.com>
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

The ath10k testmode uses request_firmware_direct() in order to avoid
producing firmware load warnings. Disabling the fallback mechanism was a
side effect of disabling warnings.

We now have a new API that allows us to avoid warnings while keeping the
fallback mechanism enabled. So use that instead.

Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
---
 drivers/net/wireless/ath/ath10k/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 568810b41657..0beb91be1b1c 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -157,7 +157,7 @@ static int ath10k_tm_fetch_utf_firmware_api_1(struct ath10k *ar,
 		 ar->hw_params.fw.dir, ATH10K_FW_UTF_FILE);
 
 	/* load utf firmware image */
-	ret = request_firmware_direct(&fw_file->firmware, filename, ar->dev);
+	ret = request_firmware_nowarn(&fw_file->firmware, filename, ar->dev);
 	ath10k_dbg(ar, ATH10K_DBG_TESTMODE, "testmode fw request '%s': %d\n",
 		   filename, ret);
 
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
