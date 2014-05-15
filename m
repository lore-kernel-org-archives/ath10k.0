Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WktIZ-00089c-7O
 for ath10k@lists.infradead.org; Thu, 15 May 2014 10:54:04 +0000
Received: by mail-ee0-f45.google.com with SMTP id d49so517197eek.4
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 03:53:40 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 2/2] ath10k: setup AMSDU subframes to 1
Date: Thu, 15 May 2014 12:53:06 +0200
Message-Id: <1400151186-24949-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, while1eq1@gmail.com, markaswift@gmail.com

Fore test purpose only.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 75b3dfb..1e492a1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -847,6 +847,8 @@ int ath10k_core_start(struct ath10k *ar)
 	if (status)
 		goto err_disconnect_htc;
 
+	WARN_ON(ath10k_htt_h2t_aggr_cfg_msg(&ar->htt, 64, 1));
+
 	status = ath10k_debug_start(ar);
 	if (status)
 		goto err_disconnect_htc;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
