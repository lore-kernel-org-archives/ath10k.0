Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSRQ5-0001YA-23
 for ath10k@lists.infradead.org; Mon, 11 Jun 2018 18:20:13 +0000
Received: by mail-pf0-x241.google.com with SMTP id y8-v6so1598994pfm.10
 for <ath10k@lists.infradead.org>; Mon, 11 Jun 2018 11:19:45 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: use crash_dump enum instead of magic numbers
Date: Mon, 11 Jun 2018 11:19:35 -0700
Message-Id: <20180611181935.155032-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

The comments are telling you what the enum could tell you instead.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4cf54a7ef09a..eae46a04f503 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -41,10 +41,8 @@ static bool uart_print;
 static bool skip_otp;
 static bool rawmode;
 
-/* Enable ATH10K_FW_CRASH_DUMP_REGISTERS and ATH10K_FW_CRASH_DUMP_CE_DATA
- * by default.
- */
-unsigned long ath10k_coredump_mask = 0x3;
+unsigned long ath10k_coredump_mask = BIT(ATH10K_FW_CRASH_DUMP_REGISTERS) |
+				     BIT(ATH10K_FW_CRASH_DUMP_CE_DATA);
 
 /* FIXME: most of these should be readonly */
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
-- 
2.18.0.rc1.242.g61856ae69a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
