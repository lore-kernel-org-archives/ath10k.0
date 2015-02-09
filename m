Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKoyp-0000PN-BV
 for ath10k@lists.infradead.org; Mon, 09 Feb 2015 14:06:29 +0000
Received: by mail-lb0-f181.google.com with SMTP id b6so7317361lbj.12
 for <ath10k@lists.infradead.org>; Mon, 09 Feb 2015 06:06:02 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: workaround corrupted htt rx events
Date: Mon,  9 Feb 2015 15:04:55 +0100
Message-Id: <1423490695-24829-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

qca6174 WLAN.RM.2.0-00073 firmware uses full rx
reordering offload and delivers Rx via a new HTT
event. The event however is incorrectly generated
in firmware and becomes overly long (with trailing
garbage). This was hitting defined CE buffer limit
that was programmed to the device and caused
device to crash upon busier Rx traffic.

Increasing the CE buffer limit for HTT Rx pipe to
2KBytes seems to be enough to workaround this
problem.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e6972b0..7681237 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -104,7 +104,7 @@ static const struct ce_attr host_ce_config_wlan[] = {
 	{
 		.flags = CE_ATTR_FLAGS,
 		.src_nentries = 0,
-		.src_sz_max = 512,
+		.src_sz_max = 2048,
 		.dest_nentries = 512,
 	},
 
@@ -174,7 +174,7 @@ static const struct ce_pipe_config target_ce_config_wlan[] = {
 		.pipenum = __cpu_to_le32(1),
 		.pipedir = __cpu_to_le32(PIPEDIR_IN),
 		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(512),
+		.nbytes_max = __cpu_to_le32(2048),
 		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
 		.reserved = __cpu_to_le32(0),
 	},
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
