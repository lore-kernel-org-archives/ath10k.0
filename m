Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpCCF-0002Jg-9M
 for ath10k@lists.infradead.org; Thu, 31 Jan 2019 13:16:03 +0000
Date: Thu, 31 Jan 2019 14:15:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] ath10k: do not return invalid pointers as a *dentry
Message-ID: <20190131131556.GB19807@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

When calling debugfs functions, they can now return error values if
something went wrong.  If that happens, return a NULL as a *dentry to
the relay core instead of passing it an illegal pointer.

The relay core should be able to handle an illegal pointer, but add this
check to be safe.

Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath10k/spectral.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
index 653b6d013207..4a7fa3e4e99f 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.c
+++ b/drivers/net/wireless/ath/ath10k/spectral.c
@@ -494,6 +494,9 @@ static struct dentry *create_buf_file_handler(const char *filename,
 
 	buf_file = debugfs_create_file(filename, mode, parent, buf,
 				       &relay_file_operations);
+	if (IS_ERR(buf_file))
+		return NULL;
+
 	*is_global = 1;
 	return buf_file;
 }
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
