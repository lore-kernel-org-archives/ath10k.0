Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eefUH-0004Rt-1U
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 11:14:34 +0000
Received: by mail-wr0-x243.google.com with SMTP id v15so7242848wrb.8
 for <ath10k@lists.infradead.org>; Thu, 25 Jan 2018 03:14:22 -0800 (PST)
From: Tobias Schramm <tobleminer@gmail.com>
Subject: [PATCH v3 1/2] pci: Add vendor id of Ubiquiti Networks
Date: Thu, 25 Jan 2018 12:13:39 +0100
Message-Id: <20180125111340.17553-2-tobleminer@gmail.com>
In-Reply-To: <20180125111340.17553-1-tobleminer@gmail.com>
References: <20180125111340.17553-1-tobleminer@gmail.com>
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
To: kvalo@qca.qualcomm.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org
Cc: Tobias Schramm <tobleminer@gmail.com>

Signed-off-by: Tobias Schramm <tobleminer@gmail.com>
---
 include/linux/pci_ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index ab20dc5db423..35871adfdc86 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -149,6 +149,8 @@
 #define PCI_VENDOR_ID_DYNALINK		0x0675
 #define PCI_DEVICE_ID_DYNALINK_IS64PH	0x1702
 
+#define PCI_VENDOR_ID_UBIQUITI		0x0777
+
 #define PCI_VENDOR_ID_BERKOM			0x0871
 #define PCI_DEVICE_ID_BERKOM_A1T		0xffa1
 #define PCI_DEVICE_ID_BERKOM_T_CONCEPT		0xffa2
-- 
2.16.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
