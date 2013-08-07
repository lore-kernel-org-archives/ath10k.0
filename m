Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V73dD-0007xi-SD
 for ath10k@lists.infradead.org; Wed, 07 Aug 2013 13:18:28 +0000
Received: by mail-ea0-f169.google.com with SMTP id z7so855285eaf.28
 for <ath10k@lists.infradead.org>; Wed, 07 Aug 2013 06:18:05 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: update supported FW build version
Date: Wed,  7 Aug 2013 15:17:46 +0200
Message-Id: <1375881466-30090-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1375881466-30090-1-git-send-email-bartosz.markowski@tieto.com>
References: <1375881466-30090-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

The latest supported and available FW build is 1.0.0.636.
Reflect this in ath10k code.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 373c2ef..9868705 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -24,7 +24,7 @@
 #define SUPPORTED_FW_MAJOR	1
 #define SUPPORTED_FW_MINOR	0
 #define SUPPORTED_FW_RELEASE	0
-#define SUPPORTED_FW_BUILD	629
+#define SUPPORTED_FW_BUILD	636
 
 /* QCA988X 2.0 definitions */
 #define QCA988X_HW_2_0_VERSION		0x4100016c
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
