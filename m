Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXOGY-0004Uz-EO
 for ath10k@lists.infradead.org; Sat, 09 May 2020 12:07:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH net-next 2/2] ath10k: fix ath10k_pci struct layout
Date: Sat,  9 May 2020 14:06:33 +0200
Message-Id: <20200509120707.188595-2-arnd@arndb.de>
In-Reply-To: <20200509120707.188595-1-arnd@arndb.de>
References: <20200509120707.188595-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

gcc-10 correctly points out a bug with a zero-length array in
struct ath10k_pci:

drivers/net/wireless/ath/ath10k/ahb.c: In function 'ath10k_ahb_remove':
drivers/net/wireless/ath/ath10k/ahb.c:30:9: error: array subscript 0 is outside the bounds of an interior zero-length array 'struct ath10k_ahb[0]' [-Werror=zero-length-bounds]
   30 |  return &((struct ath10k_pci *)ar->drv_priv)->ahb[0];
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/net/wireless/ath/ath10k/ahb.c:13:
drivers/net/wireless/ath/ath10k/pci.h:185:20: note: while referencing 'ahb'
  185 |  struct ath10k_ahb ahb[0];
      |                    ^~~

The last addition to the struct ignored the comments and added
new members behind the array that must remain last.

Change it to a flexible-array member and move it last again to
make it work correctly, prevent the same thing from happening
again (all compilers warn about flexible-array members in the
middle of a struct) and get it to build without warnings.

Fixes: 521fc37be3d8 ("ath10k: Avoid override CE5 configuration for QCA99X0 chipsets")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/pci.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index e3cbd259a2dc..862d0901c5b8 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -178,15 +178,16 @@ struct ath10k_pci {
 	 */
 	u32 (*targ_cpu_to_ce_addr)(struct ath10k *ar, u32 addr);
 
+	struct ce_attr *attr;
+	struct ce_pipe_config *pipe_config;
+	struct ce_service_to_pipe *serv_to_pipe;
+
 	/* Keep this entry in the last, memory for struct ath10k_ahb is
 	 * allocated (ahb support enabled case) in the continuation of
 	 * this struct.
 	 */
-	struct ath10k_ahb ahb[0];
+	struct ath10k_ahb ahb[];
 
-	struct ce_attr *attr;
-	struct ce_pipe_config *pipe_config;
-	struct ce_service_to_pipe *serv_to_pipe;
 };
 
 static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
-- 
2.26.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
