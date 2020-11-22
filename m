Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgsmQ-0001nA-P8
 for ath10k@lists.infradead.org; Sun, 22 Nov 2020 17:04:03 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] ath10k: Release some resources in an error handling path
Date: Sun, 22 Nov 2020 18:03:58 +0100
Message-Id: <20201122170358.1346065-1-christophe.jaillet@wanadoo.fr>
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
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, erik.stromdahl@gmail.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Should an error occur after calling 'ath10k_usb_create()', it should be
undone by a corresponding 'ath10k_usb_destroy()' call

Fixes: 4db66499df91 ("ath10k: add initial USB support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative and compile tested only.
---
 drivers/net/wireless/ath/ath10k/usb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 0b47c3a09794..19b9c27e30e2 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1011,7 +1011,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
 		ath10k_warn(ar, "failed to register driver core: %d\n", ret);
-		goto err;
+		goto err_usb_destroy;
 	}
 
 	/* TODO: remove this once USB support is fully implemented */
@@ -1019,6 +1019,9 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 
 	return 0;
 
+err_usb_destroy:
+	ath10k_usb_destroy(ar);
+
 err:
 	ath10k_core_destroy(ar);
 
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
