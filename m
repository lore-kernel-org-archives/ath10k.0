Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLAg7-0007Xj-DO
 for ath10k@lists.infradead.org; Wed, 05 Mar 2014 12:12:03 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so409923eei.14
 for <ath10k@lists.infradead.org>; Wed, 05 Mar 2014 04:11:20 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2] ath10k: do not overwrite max_antenna_gain
Date: Wed,  5 Mar 2014 13:10:33 +0100
Message-Id: <1394021433-19376-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

From: Marek Puzyniak <marek.puzyniak@tieto.com>

Seems like we have an old bug, where we incidently overwrites
the max_antenna_gain we pass to firmware, with zero value.

End of all we are artifically reducing the output power.

This patch removes the excessive assignment on max_antenna_gain,
which is being provided by regulatory domain, and consequently
improves the tx power.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 478e7f6..cb1f7b5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3393,7 +3393,6 @@ int ath10k_wmi_scan_chan_list(struct ath10k *ar,
 		ci->max_power         = ch->max_power;
 		ci->reg_power         = ch->max_reg_power;
 		ci->antenna_max       = ch->max_antenna_gain;
-		ci->antenna_max       = 0;
 
 		/* mode & flags share storage */
 		ci->mode              = ch->mode;
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
