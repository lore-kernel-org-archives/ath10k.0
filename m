Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXqgv-0007mn-7r
 for ath10k@lists.infradead.org; Tue, 17 Mar 2015 12:33:51 +0000
Received: by ladw1 with SMTP id w1so7148541lad.0
 for <ath10k@lists.infradead.org>; Tue, 17 Mar 2015 05:33:21 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 1/7] ath10k: allow empty ssid vdev config
Date: Tue, 17 Mar 2015 12:30:42 +0000
Message-Id: <1426595448-1630-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1426595448-1630-1-git-send-email-michal.kazior@tieto.com>
References: <1426595448-1630-1-git-send-email-michal.kazior@tieto.com>
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

It doesn't make much sense to reject a valid
firmware configuration combination.

Since SSID isn't known early on it might make
sense to allow driver to start vdev without SSID
and restart it later.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 --
 drivers/net/wireless/ath/ath10k/wmi.c     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 3eec042..fa3eb1b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1486,8 +1486,6 @@ ath10k_wmi_tlv_op_gen_vdev_start(struct ath10k *ar,
 	void *ptr;
 	u32 flags = 0;
 
-	if (WARN_ON(arg->ssid && arg->ssid_len == 0))
-		return ERR_PTR(-EINVAL);
 	if (WARN_ON(arg->hidden_ssid && !arg->ssid))
 		return ERR_PTR(-EINVAL);
 	if (WARN_ON(arg->ssid_len > sizeof(cmd->ssid.ssid)))
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 54430a1..7b3e6ca 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4286,8 +4286,6 @@ ath10k_wmi_op_gen_vdev_start(struct ath10k *ar,
 	const char *cmdname;
 	u32 flags = 0;
 
-	if (WARN_ON(arg->ssid && arg->ssid_len == 0))
-		return ERR_PTR(-EINVAL);
 	if (WARN_ON(arg->hidden_ssid && !arg->ssid))
 		return ERR_PTR(-EINVAL);
 	if (WARN_ON(arg->ssid_len > sizeof(cmd->ssid.ssid)))
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
