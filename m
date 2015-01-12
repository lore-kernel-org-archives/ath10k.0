Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAkzO-0002sO-JA
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 19:49:28 +0000
From: greearb@candelatech.com
Subject: [PATCH 4/8] ath10k:  make dbglog debug messages be 'warn' level.
Date: Mon, 12 Jan 2015 10:32:40 -0800
Message-Id: <1421087564-10384-4-git-send-email-greearb@candelatech.com>
In-Reply-To: <1421087564-10384-1-git-send-email-greearb@candelatech.com>
References: <1421087564-10384-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

This only happens on firmware crash, and it appears this
logic is not always perfect, so make sure the information
is printed to logs at higher level.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 0f7e845..dee0d5a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1132,9 +1132,8 @@ static void ath10k_pci_dump_dbglog(struct ath10k *ar)
 		return;
 	}
 
-	ath10k_dbg(ar, ATH10K_DBG_PCI,
-		   "debug log header, dbuf: 0x%x  dropped: %i\n",
-		   le32_to_cpu(dbg_hdr.dbuf), le32_to_cpu(dbg_hdr.dropped));
+	ath10k_warn(ar, "debug log header, dbuf: 0x%x  dropped: %i\n",
+		    le32_to_cpu(dbg_hdr.dbuf), le32_to_cpu(dbg_hdr.dropped));
 	dbufp = le32_to_cpu(dbg_hdr.dbuf);
 
 	/* i is for logging purposes and sanity check in case firmware buffers
@@ -1154,11 +1153,10 @@ static void ath10k_pci_dump_dbglog(struct ath10k *ar)
 
 		len = le32_to_cpu(dbuf.length);
 
-		ath10k_dbg(ar, ATH10K_DBG_PCI,
-			   "[%i] next: 0x%x buf: 0x%x sz: %i len: %i count: %i free: %i\n",
-			   i, le32_to_cpu(dbuf.next), le32_to_cpu(dbuf.buffer),
-			   le32_to_cpu(dbuf.bufsize), len,
-			   le32_to_cpu(dbuf.count), le32_to_cpu(dbuf.free));
+		ath10k_warn(ar, "[%i] next: 0x%x buf: 0x%x sz: %i len: %i count: %i free: %i\n",
+			    i, le32_to_cpu(dbuf.next), le32_to_cpu(dbuf.buffer),
+			    le32_to_cpu(dbuf.bufsize), len,
+			    le32_to_cpu(dbuf.count), le32_to_cpu(dbuf.free));
 		if (dbuf.buffer == 0 || len == 0)
 			goto next;
 
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
