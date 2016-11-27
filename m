Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB5HJ-0001M3-2M
 for ath10k@lists.infradead.org; Sun, 27 Nov 2016 19:38:22 +0000
Received: by mail-lf0-x243.google.com with SMTP id 98so7502290lfs.0
 for <ath10k@lists.infradead.org>; Sun, 27 Nov 2016 11:37:59 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH] ath10k: fix TLV set regdomain command
Date: Sun, 27 Nov 2016 20:37:20 +0100
Message-Id: <1480275440-9919-1-git-send-email-erik.stromdahl@gmail.com>
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

There is a typo bug in the current implementation of
ath10k_wmi_tlv_op_gen_pdev_set_rd.
The conformance test limits are not set up properly.

The two arguments ctl2g and ctl5g were not used at all.
Instead, the regdomain arguments rd2g and rd5g were used
for the ctl settings as well.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 97b536e..f304f66 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1313,8 +1313,8 @@ static int ath10k_wmi_tlv_op_pull_echo_ev(struct ath10k *ar,
 	cmd->regd = __cpu_to_le32(rd);
 	cmd->regd_2ghz = __cpu_to_le32(rd2g);
 	cmd->regd_5ghz = __cpu_to_le32(rd5g);
-	cmd->conform_limit_2ghz = __cpu_to_le32(rd2g);
-	cmd->conform_limit_5ghz = __cpu_to_le32(rd5g);
+	cmd->conform_limit_2ghz = __cpu_to_le32(ctl2g);
+	cmd->conform_limit_5ghz = __cpu_to_le32(ctl5g);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv pdev set rd\n");
 	return skb;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
