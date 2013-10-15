Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW8UJ-0007Rz-JA
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 17:32:56 +0000
Received: by mail-pd0-f170.google.com with SMTP id x10so9225413pdj.15
 for <ath10k@lists.infradead.org>; Tue, 15 Oct 2013 10:32:33 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/7] ath10k: fix NSS reporting in RX
Date: Tue, 15 Oct 2013 10:29:53 -0700
Message-Id: <1381858196-17000-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
References: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
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

NSTS values reported in the VHT-SIG-A1 are 0
through 7 but they actually describe number of
streams 1 through 8.

1SS frames were dropped. This patch fixes this.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 5ae373a..c511f91 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -183,7 +183,7 @@ static void process_rx_rates(struct ath10k *ar, struct htt_rx_info *info,
 		/* VHT-SIG-A1 in info 1, VHT-SIG-A2 in info2
 		   TODO check this */
 		mcs = (info2 >> 4) & 0x0F;
-		nss = (info1 >> 10) & 0x07;
+		nss = ((info1 >> 10) & 0x07) + 1;
 		bw = info1 & 3;
 		sgi = info2 & 1;
 
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
