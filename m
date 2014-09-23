Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWLXv-0000Rm-5Z
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 08:34:04 +0000
Received: by mail-wi0-f179.google.com with SMTP id d1so4526925wiv.12
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 01:33:41 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/3] ath10k: dump hex bytes with dev string prefix
Date: Tue, 23 Sep 2014 10:22:53 +0200
Message-Id: <1411460574-5424-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411460574-5424-1-git-send-email-michal.kazior@tieto.com>
References: <1411460574-5424-1-git-send-email-michal.kazior@tieto.com>
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

This makes it easier to debug hex dumps on systems
with more than a single ath10k device.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * merge 2 scnprintfs into 1 [Kalle]

 drivers/net/wireless/ath/ath10k/debug.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index f1e5916..1110f0f 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1264,11 +1264,26 @@ void ath10k_dbg_dump(struct ath10k *ar,
 		     const char *msg, const char *prefix,
 		     const void *buf, size_t len)
 {
+	char linebuf[256];
+	unsigned int linebuflen;
+	const void *ptr;
+
 	if (ath10k_debug_mask & mask) {
 		if (msg)
 			ath10k_dbg(ar, mask, "%s\n", msg);
 
-		print_hex_dump_bytes(prefix, DUMP_PREFIX_OFFSET, buf, len);
+		for (ptr = buf; (ptr - buf) < len; ptr += 16) {
+			linebuflen = 0;
+			linebuflen += scnprintf(linebuf + linebuflen,
+						sizeof(linebuf) - linebuflen,
+						"%s%08x: ",
+						(prefix ? prefix : ""),
+						(unsigned int)(ptr - buf));
+			hex_dump_to_buffer(ptr, len - (ptr - buf), 16, 1,
+					   linebuf + linebuflen,
+					   sizeof(linebuf) - linebuflen, true);
+			dev_printk(KERN_DEBUG, ar->dev, "%s\n", linebuf);
+		}
 	}
 
 	/* tracing code doesn't like null strings :/ */
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
