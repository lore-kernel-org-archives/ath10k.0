Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSV1N-0002KS-Pv
 for ath10k@lists.infradead.org; Wed, 06 Nov 2019 23:47:31 +0000
Received: by mail-pf1-x444.google.com with SMTP id p26so467885pfq.8
 for <ath10k@lists.infradead.org>; Wed, 06 Nov 2019 15:47:29 -0800 (PST)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] ath10k: Handle "invalid" BDFs for msm8998 devices
Date: Wed,  6 Nov 2019 15:47:12 -0800
Message-Id: <20191106234712.2380-1-jeffrey.l.hugo@gmail.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org

When the BDF download QMI message has the end field set to 1, it signals
the end of the transfer, and triggers the firmware to do a CRC check.  The
BDFs for msm8998 devices fail this check, yet the firmware is happy to
still use the BDF.  It appears that this error is not caught by the
downstream drive by concidence, therefore there are production devices
in the field where this issue needs to be handled otherwise we cannot
support wifi on them.  So, attempt to detect this scenario as best we can
and treat it as non-fatal.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index eb618a2652db..5ff8cfc93778 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -265,10 +265,13 @@ static int ath10k_qmi_bdf_dnld_send_sync(struct ath10k_qmi *qmi)
 			goto out;
 
 		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-			ath10k_err(ar, "failed to download board data file: %d\n",
-				   resp.resp.error);
-			ret = -EINVAL;
-			goto out;
+			if (!(req->end == 1 &&
+			      resp.resp.result == QMI_ERR_MALFORMED_MSG_V01)) {
+				ath10k_err(ar, "failed to download board data file: %d\n",
+					   resp.resp.error);
+				ret = -EINVAL;
+				goto out;
+			}
 		}
 
 		remaining -= req->data_len;
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
