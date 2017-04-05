Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvf2g-0000y1-CC
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:07:47 +0000
Subject: [PATCH 6/7] ath10k: convert __ath10k_sdio_write_async() to use
 ath10k_sdio_write()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 5 Apr 2017 10:07:36 +0300
Message-ID: <149137605651.4898.4712041956291103322.stgit@potku.adurom.net>
In-Reply-To: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
References: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
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

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c |    9 +++++----
 drivers/net/wireless/ath/ath10k/sdio.h |    2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 301355228cfa..8ea1629c7bae 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1304,9 +1304,11 @@ static void __ath10k_sdio_write_async(struct ath10k *ar,
 	int ret;
 
 	skb = req->skb;
-	ret = ath10k_sdio_read_write_sync(ar, req->address,
-					  skb->data, skb->len,
-					  req->request);
+	ret = ath10k_sdio_write(ar, req->address, skb->data, skb->len);
+	if (ret)
+		ath10k_warn(ar, "failed to write skb to 0x%x asynchronously: %d",
+			    req->address, ret);
+
 	if (req->htc_msg) {
 		ep = &ar->htc.endpoint[req->eid];
 		ath10k_htc_notify_tx_completion(ep, skb);
@@ -1355,7 +1357,6 @@ static int ath10k_sdio_prep_async_req(struct ath10k *ar, u32 addr,
 	}
 
 	bus_req->skb = skb;
-	bus_req->request = HIF_WRITE;
 	bus_req->eid = eid;
 	bus_req->address = addr;
 	bus_req->htc_msg = htc_msg;
diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index d1e4f78ddaeb..1bce56447e53 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -110,7 +110,7 @@ struct ath10k_sdio_bus_request {
 
 	/* sdio address */
 	u32 address;
-	u32 request;
+
 	struct sk_buff *skb;
 	enum ath10k_htc_ep_id eid;
 	int status;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
