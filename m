Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaOAw-0000oA-A6
 for ath10k@lists.infradead.org; Tue, 24 Mar 2015 12:43:19 +0000
Received: by labto5 with SMTP id to5so50622026lab.0
 for <ath10k@lists.infradead.org>; Tue, 24 Mar 2015 05:42:55 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: don't call quiet mode if it's not implemented
Date: Tue, 24 Mar 2015 12:40:17 +0000
Message-Id: <1427200817-7407-1-git-send-email-michal.kazior@tieto.com>
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

qca6174 and wmi-tlv doesn't have quiet mode
implemented. Don't even attempt to call it. This
fixes a warning when bringing first interface up:

  failed to set quiet mode period 100 duarion 0 enabled 0 ret -95

Fixes: 8515b5c79a54 ("ath10k: configure thermal throttle while powering up")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    (based on pending branch)

 drivers/net/wireless/ath/ath10k/thermal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 01bae867cae9..1a899d70dc5d 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -140,6 +140,9 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (!ar->wmi.ops->gen_pdev_set_quiet_mode)
+		return;
+
 	if (ar->state != ATH10K_STATE_ON)
 		return;
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
