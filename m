Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gId5j-0002Js-SG
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 17:18:45 +0000
Received: by mail-pg1-x542.google.com with SMTP id w7so1240591pgp.13
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 10:18:29 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/3] ath10k: assign 'n_cipher_suites' for WCN3990
Date: Fri,  2 Nov 2018 10:17:47 -0700
Message-Id: <20181102171749.38680-1-briannorris@chromium.org>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

Commit 2ea9f12cefe4 ("ath10k: add new cipher suite support") added a new
n_cipher_suites HW param with a fallback value and a warning log. Commit
03a72288c546 ("ath10k: wmi: add hw params entry for wcn3990") later
added WCN3990 HW entries, but it missed the n_cipher_suites.

Rather than seeing this warning every boot

  ath10k_snoc 18800000.wifi: invalid hw_params.n_cipher_suites 0

let's provide the appropriate value.

Cc: Rakesh Pillai <pillair@qti.qualcomm.com>
Cc: Govind Singh <govinds@qti.qualcomm.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index da607febfd82..bdc81f1cdb94 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -561,6 +561,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_ops = &wcn3990_ops,
 		.decap_align_bytes = 1,
 		.num_peers = TARGET_HL_10_TLV_NUM_PEERS,
+		.n_cipher_suites = 8,
 		.ast_skid_limit = TARGET_HL_10_TLV_AST_SKID_LIMIT,
 		.num_wds_entries = TARGET_HL_10_TLV_NUM_WDS_ENTRIES,
 		.target_64bit = true,
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
