Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gId5l-0002Ju-2i
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 17:18:42 +0000
Received: by mail-pl1-x643.google.com with SMTP id t6-v6so1301023plo.9
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 10:18:31 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/3] ath10k: don't assume this is a PCI dev in generic code
Date: Fri,  2 Nov 2018 10:17:48 -0700
Message-Id: <20181102171749.38680-2-briannorris@chromium.org>
In-Reply-To: <20181102171749.38680-1-briannorris@chromium.org>
References: <20181102171749.38680-1-briannorris@chromium.org>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

Not all devices using this driver are backed by a PCI device, so it's
not fair to assume 'to_pci_dev()' is valid. Fortunately, we only were
using this to convert straight back to a bare 'device', which means we
were only doing no-op pointer arithmetic, and not actually accessing
potentially out-of-bounds memory. But this is still bad practice.

Just use 'ar->dev' directly, since that's really all we're looking for.

Fixes: 209b2a68de76 ("ath10k: add platform regulatory domain support")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801ded10..5c4ee66382d9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8313,7 +8313,6 @@ static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
 
 static int ath10k_mac_get_wrdd_regulatory(struct ath10k *ar, u16 *rd)
 {
-	struct pci_dev __maybe_unused *pdev = to_pci_dev(ar->dev);
 	acpi_handle root_handle;
 	acpi_handle handle;
 	struct acpi_buffer wrdd = {ACPI_ALLOCATE_BUFFER, NULL};
@@ -8321,7 +8320,7 @@ static int ath10k_mac_get_wrdd_regulatory(struct ath10k *ar, u16 *rd)
 	u32 alpha2_code;
 	char alpha2[3];
 
-	root_handle = ACPI_HANDLE(&pdev->dev);
+	root_handle = ACPI_HANDLE(ar->dev);
 	if (!root_handle)
 		return -EOPNOTSUPP;
 
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
