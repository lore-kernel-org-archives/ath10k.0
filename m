Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCgy3-0000ka-Gj
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 05:32:51 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix a typo in spectral code commments
Date: Tue, 14 Jun 2016 11:03:54 +0530
Message-ID: <1465882434-594-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Found this obvious typo while going through the spectral
code design in ath10k

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/spectral.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
index 4671cfb..4510906 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.c
+++ b/drivers/net/wireless/ath/ath10k/spectral.c
@@ -101,7 +101,7 @@ int ath10k_spectral_process_fft(struct ath10k *ar,
 		break;
 	case 80:
 		/* TODO: As experiments with an analogue sender and various
-		 * configuaritions (fft-sizes of 64/128/256 and 20/40/80 Mhz)
+		 * configurations (fft-sizes of 64/128/256 and 20/40/80 Mhz)
 		 * show, the particular configuration of 80 MHz/64 bins does
 		 * not match with the other smaples at all. Until the reason
 		 * for that is found, don't report these samples.
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
