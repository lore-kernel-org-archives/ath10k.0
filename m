Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jideE-000116-JX
 for ath10k@lists.infradead.org; Tue, 09 Jun 2020 12:46:36 +0000
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 05/17] drivers: net: Fix trivial spelling
Date: Tue,  9 Jun 2020 13:45:58 +0100
Message-Id: <20200609124610.3445662-6-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
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
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wenwen Wang <wenwen@cs.uga.edu>, Jiri Kosina <trivial@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Martin Habets <mhabets@solarflare.com>, "open list:NETWORKING DRIVERS WIRELESS" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>, linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jakub Kicinski <kuba@kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, Shannon Nelson <snelson@pensando.io>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/net/wan/lmc/lmc_main.c        | 2 +-
 drivers/net/wireless/ath/ath10k/usb.c | 2 +-
 drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
 drivers/net/wireless/cisco/airo.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index a20f467ca48a..842def21e089 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -2063,7 +2063,7 @@ static void lmc_driver_timeout(struct net_device *dev, unsigned int txqueue)
     /*
      * Chip seems to have locked up
      * Reset it
-     * This whips out all our decriptor
+     * This whips out all our descriptor
      * table and starts from scartch
      */
 
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index b7daf344d012..05a620ff6fe2 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -824,7 +824,7 @@ static int ath10k_usb_setup_pipe_resources(struct ath10k *ar,
 
 	ath10k_dbg(ar, ATH10K_DBG_USB, "usb setting up pipes using interface\n");
 
-	/* walk decriptors and setup pipes */
+	/* walk descriptors and setup pipes */
 	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
 		endpoint = &iface_desc->endpoint[i].desc;
 
diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
index 53b66e9434c9..5372e948e761 100644
--- a/drivers/net/wireless/ath/ath6kl/usb.c
+++ b/drivers/net/wireless/ath/ath6kl/usb.c
@@ -311,7 +311,7 @@ static int ath6kl_usb_setup_pipe_resources(struct ath6kl_usb *ar_usb)
 
 	ath6kl_dbg(ATH6KL_DBG_USB, "setting up USB Pipes using interface\n");
 
-	/* walk decriptors and setup pipes */
+	/* walk descriptors and setup pipes */
 	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
 		endpoint = &iface_desc->endpoint[i].desc;
 
diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco/airo.c
index 827bb6d74815..e3ad77666ba8 100644
--- a/drivers/net/wireless/cisco/airo.c
+++ b/drivers/net/wireless/cisco/airo.c
@@ -2450,7 +2450,7 @@ static void mpi_unmap_card(struct pci_dev *pci)
 
 /*************************************************************
  *  This routine assumes that descriptors have been setup .
- *  Run at insmod time or after reset  when the decriptors
+ *  Run at insmod time or after reset when the descriptors
  *  have been initialized . Returns 0 if all is well nz
  *  otherwise . Does not allocate memory but sets up card
  *  using previously allocated descriptors.
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
