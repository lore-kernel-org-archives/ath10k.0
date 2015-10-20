Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoYJD-0007Iy-LM
 for ath10k@lists.infradead.org; Tue, 20 Oct 2015 14:54:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH] ath10k: add notice.txt references to WHENCE
Date: Tue, 20 Oct 2015 17:53:22 +0300
Message-ID: <1445352802-18789-1-git-send-email-kvalo@qca.qualcomm.com>
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
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

This is to make sure that the notice files get automatically included.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 WHENCE |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/WHENCE b/WHENCE
index 9b7e8e8526aa..5cc01414e915 100755
--- a/WHENCE
+++ b/WHENCE
@@ -2393,17 +2393,22 @@ Driver: ath10k - Qualcomm Atheros support for QCA988x family of chips
 File: ath10k/QCA988X/hw2.0/board.bin
 File: ath10k/QCA988X/hw2.0/firmware-4.bin
 Version: 10.2.4.45
+File: ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt
 File: ath10k/QCA988X/hw2.0/firmware-5.bin
 Version: 10.2.4.70.9-2
+File: ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt
 File: ath10k/QCA6174/hw2.1/board.bin
 File: ath10k/QCA6174/hw2.1/firmware-5.bin
 Version: WLAN.RM.1.1-00141
+File: ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
 File: ath10k/QCA6174/hw3.0/board.bin
 File: ath10k/QCA6174/hw3.0/firmware-4.bin
 Version: WLAN.RM.2.0-00180-QCARMSWPZ-1
+File: ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
 File: ath10k/QCA99X0/hw2.0/board.bin
 File: ath10k/QCA99X0/hw2.0/firmware-5.bin
 Version: 10.4.1.00030-1
+File: ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt
 
 Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
