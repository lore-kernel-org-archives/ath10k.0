Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9BW6-00080h-02
 for ath10k@lists.infradead.org; Sat, 04 Jun 2016 13:21:30 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: add QCA9887 chipset support
Date: Sat, 4 Jun 2016 13:21:01 +0000
Message-ID: <87twh9t7ib.fsf@kamboji.qca.qualcomm.com>
References: <1568876.Six5hABE57@bentobox>
 <1463755272-12912-1-git-send-email-sven.eckelmann@open-mesh.com>
In-Reply-To: <1463755272-12912-1-git-send-email-sven.eckelmann@open-mesh.com>
 (Sven Eckelmann's message of "Fri, 20 May 2016 16:41:11 +0200")
Content-Language: en-US
Content-ID: <51FDEE47C22DA641ABD8C4E030B45143@qualcomm.com>
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
To: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@open-mesh.com> writes:

> Add the hardware name, revision, firmware names and update the pci_id
> table.
>
> QA9887 HW1.0 is supposed to be similar to QCA988X HW2.0 . Details about
> he firmware interface are currently unknown.
>
> Signed-off-by: Sven Eckelmann <sven.eckelmann@open-mesh.com>

I added the warning we talked about, diff below. Full patch in the
pending branch:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=ed730faad11df99f2aba3b8d78ac5587c3403e69

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d34c32a075ac..3e8e7ed6faa1 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3005,6 +3005,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		pci_hard_reset = ath10k_pci_qca988x_chip_reset;
 		break;
 	case QCA9887_1_0_DEVICE_ID:
+		dev_warn(&pdev->dev, "QCA9887 support is still experimental, there are likely bugs. You have been warned.\n");
 		hw_rev = ATH10K_HW_QCA9887;
 		pci_ps = false;
 		pci_soft_reset = ath10k_pci_warm_reset;


-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
