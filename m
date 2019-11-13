Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUur4-0002hb-UP
 for ath10k@lists.infradead.org; Wed, 13 Nov 2019 15:46:52 +0000
Received: by mail-pf1-x443.google.com with SMTP id p24so1927233pfn.4
 for <ath10k@lists.infradead.org>; Wed, 13 Nov 2019 07:46:50 -0800 (PST)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] ath10k: Handle "invalid" BDFs for msm8998 devices
Date: Wed, 13 Nov 2019 07:46:46 -0800
Message-Id: <20191113154646.43048-1-jeffrey.l.hugo@gmail.com>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

v2:
-tweak conditional nesting
-add comment in code to clarify

 drivers/net/wireless/ath/ath10k/qmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 637f83ef65f8..6df2d3ac5474 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -279,7 +279,15 @@ static int ath10k_qmi_bdf_dnld_send_sync(struct ath10k_qmi *qmi)
 		if (ret < 0)
 			goto out;
 
-		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		/* end = 1 triggers a CRC check on the BDF.  If this fails, we
+		 * get a QMI_ERR_MALFORMED_MSG_V01 error, but the FW is still
+		 * willing to use the BDF.  For some platforms, all the valid
+		 * released BDFs fail this CRC check, so attempt to detect this
+		 * scenario and treat it as non-fatal.
+		 */
+		if (resp.resp.result != QMI_RESULT_SUCCESS_V01 &&
+		    !(req->end == 1 &&
+		      resp.resp.result == QMI_ERR_MALFORMED_MSG_V01)) {
 			ath10k_err(ar, "failed to download board data file: %d\n",
 				   resp.resp.error);
 			ret = -EINVAL;
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
