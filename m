Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFNqY-00057h-On
 for ath10k@lists.infradead.org; Fri, 30 Aug 2013 12:30:39 +0000
Subject: [PATCH 2/7] ath10k: make target_ce_config_wlan more readable
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 30 Aug 2013 15:30:14 +0300
Message-ID: <20130830123014.31164.32755.stgit@localhost6.localdomain6>
In-Reply-To: <20130830122905.31164.50662.stgit@localhost6.localdomain6>
References: <20130830122905.31164.50662.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

It's easier to read t if the field names are visible.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   85 ++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index cf7a3e4..304bd4f 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -125,21 +125,78 @@ static const struct ce_attr host_ce_config_wlan[] = {
 
 /* Target firmware's Copy Engine configuration. */
 static const struct ce_pipe_config target_ce_config_wlan[] = {
-	/* host->target HTC control and raw streams */
-	{ /* CE0 */ 0, PIPEDIR_OUT, 32, 256, CE_ATTR_FLAGS, 0,},
-	/* target->host HTT + HTC control */
-	{ /* CE1 */ 1, PIPEDIR_IN, 32, 512, CE_ATTR_FLAGS, 0,},
-	/* target->host WMI */
-	{ /* CE2 */ 2, PIPEDIR_IN, 32, 2048, CE_ATTR_FLAGS, 0,},
-	/* host->target WMI */
-	{ /* CE3 */ 3, PIPEDIR_OUT, 32, 2048, CE_ATTR_FLAGS, 0,},
-	/* host->target HTT */
-	{ /* CE4 */ 4, PIPEDIR_OUT, 256, 256, CE_ATTR_FLAGS, 0,},
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = 0,
+		.pipedir = PIPEDIR_OUT,
+		.nentries = 32,
+		.nbytes_max = 256,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.pipenum = 1,
+		.pipedir = PIPEDIR_IN,
+		.nentries = 32,
+		.nbytes_max = 512,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.pipenum = 2,
+		.pipedir = PIPEDIR_IN,
+		.nentries = 32,
+		.nbytes_max = 2048,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
+	/* CE3: host->target WMI */
+	{
+		.pipenum = 3,
+		.pipedir = PIPEDIR_OUT,
+		.nentries = 32,
+		.nbytes_max = 2048,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = 4,
+		.pipedir = PIPEDIR_OUT,
+		.nentries = 256,
+		.nbytes_max = 256,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
 	/* NB: 50% of src nentries, since tx has 2 frags */
-	/* unused */
-	{ /* CE5 */ 5, PIPEDIR_OUT, 32, 2048, CE_ATTR_FLAGS, 0,},
-	/* Reserved for target autonomous hif_memcpy */
-	{ /* CE6 */ 6, PIPEDIR_INOUT, 32, 4096, CE_ATTR_FLAGS, 0,},
+
+	/* CE5: unused */
+	{
+		.pipenum = 5,
+		.pipedir = PIPEDIR_OUT,
+		.nentries = 32,
+		.nbytes_max = 2048,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
+	/* CE6: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = 6,
+		.pipedir = PIPEDIR_INOUT,
+		.nentries = 32,
+		.nbytes_max = 4096,
+		.flags = CE_ATTR_FLAGS,
+		.reserved = 0,
+	},
+
 	/* CE7 used only by Host */
 };
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
