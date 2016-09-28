Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpOka-0006cg-La
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 23:58:57 +0000
From: Thomas Pedersen <twp@qca.qualcomm.com>
Subject: [PATCH 4/4] mac80211: mesh: decrease max drift
Date: Wed, 28 Sep 2016 16:56:31 -0700
Message-ID: <20160928235631.9197-5-twp@qca.qualcomm.com>
In-Reply-To: <20160928235631.9197-1-twp@qca.qualcomm.com>
References: <20160928235631.9197-1-twp@qca.qualcomm.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Thomas Pedersen <twp@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>

The old value was 30ms, which means mesh sync will treat
any value below as merely TSF drift. This isn't really
reasonable (typical drift is < 10us/s) since people
probably want to adjust TSF in smaller increments (for ie.
beacon collision avoidance) without mesh sync fighting
back.

Change max drift adjustment to 0.8ms, so manual TSF
adjustments can be made in 1ms increments, with some
margin.

Signed-off-by: Thomas Pedersen <twp@qca.qualcomm.com>
---
 net/mac80211/mesh_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/mesh_sync.c b/net/mac80211/mesh_sync.c
index 22ca43c..faca22c 100644
--- a/net/mac80211/mesh_sync.c
+++ b/net/mac80211/mesh_sync.c
@@ -28,7 +28,7 @@
  * could be, for instance, in case a neighbor is restarted and its TSF counter
  * reset.
  */
-#define TOFFSET_MAXIMUM_ADJUSTMENT 30000		/* 30 ms */
+#define TOFFSET_MAXIMUM_ADJUSTMENT 800		/* 0.8 ms */
 
 struct sync_method {
 	u8 method;
-- 
2.10.0.297.gf6727b0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
