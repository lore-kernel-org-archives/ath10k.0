Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjIKW-0003YW-N4
 for ath10k@lists.infradead.org; Tue, 15 Jan 2019 06:36:10 +0000
Subject: RE: [PATCH] ath10k: fix S5 power consumption issue for QCA9377
From: Robert Chang <rwchang@qti.qualcomm.com>
Date: Tue, 15 Jan 2019 06:36:01 +0000
Message-ID: <9149f921df804d68b33c76cb01beb62b@aptaiexm02a.ap.qualcomm.com>
References: <1547533867-15131-1-git-send-email-yyuwang@codeaurora.org>
In-Reply-To: <1547533867-15131-1-git-send-email-yyuwang@codeaurora.org>
Content-Language: en-US
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
To: Yu Wang <yyuwang@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Karen
 Huang (TAM)" <yahuan@qti.qualcomm.com>

+ Karen

Thanks,
Robert

-----Original Message-----
From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Yu Wang
Sent: Tuesday, January 15, 2019 2:31 PM
To: ath10k@lists.infradead.org
Cc: Yu Wang <yyuwang@codeaurora.org>; linux-wireless@vger.kernel.org
Subject: [EXT] [PATCH] ath10k: fix S5 power consumption issue for QCA9377

After system entering S5 (shut down but system still providing power to QCA9377) on Ubuntu platform, power consumption of QCA9377 is 69mA, which is too high.
The root cause is pci_soft_reset is not set for QCA9377 during pci probe.
To fix this issue, set 'pci_soft_reset' to 'th10k_pci_warm_reset', and then the power consumption drops to a normal value(10mA).
Verified on Dell Ubuntu platform with firmware:
WLAN.TF.1.0-00002-QCATFSWPZ-5

Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 01b4edb..0a4ce98 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3554,7 +3554,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	case QCA9377_1_0_DEVICE_ID:
 		hw_rev = ATH10K_HW_QCA9377;
 		pci_ps = true;
-		pci_soft_reset = NULL;
+		pci_soft_reset = ath10k_pci_warm_reset;
 		pci_hard_reset = ath10k_pci_qca6174_chip_reset;
 		targ_cpu_to_ce_addr = ath10k_pci_qca6174_targ_cpu_to_ce_addr;
 		break;
--
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
