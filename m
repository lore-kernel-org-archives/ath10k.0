Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhpC-0004xC-Fr
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 20:12:36 +0000
Received: by mail-io0-x244.google.com with SMTP id f3-v6so19966235iob.13
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 13:12:23 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
Subject: [PATCH 6/9] firmware: print firmware name on fallback path
Date: Mon, 23 Apr 2018 16:12:02 -0400
Message-Id: <20180423201205.20533-7-andresx7@gmail.com>
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

Previously, one could assume the firmware name from the preceding
message: "Direct firmware load for {name} failed with error %d".

However, with the new firmware_request_nowarn() entrypoint, the message
outlined above will not always be printed.

Therefore, we add the firmware name to the fallback path spew in order
to associate it with the appropriate request.

Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
---
 drivers/base/firmware_loader/fallback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index e75928458489..1a47ddc70c31 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -669,6 +669,6 @@ int fw_sysfs_fallback(struct firmware *fw, const char *name,
 	if (!fw_run_sysfs_fallback(opt_flags))
 		return ret;
 
-	dev_warn(device, "Falling back to user helper\n");
+	dev_warn(device, "Falling back to user helper for %s\n", name);
 	return fw_load_from_user_helper(fw, name, device, opt_flags);
 }
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
