Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW8UG-0007Ro-1I
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 17:32:52 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so9325802pab.26
 for <ath10k@lists.infradead.org>; Tue, 15 Oct 2013 10:32:30 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/7] ath10k: add sanity checks for monitor management
Date: Tue, 15 Oct 2013 10:29:51 -0700
Message-Id: <1381858196-17000-3-git-send-email-michal.kazior@tieto.com>
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

Add a few checks and warnings to make it easier to
track any kind of monitor vdev mismanagement.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9f26fcf..1878e8f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -516,6 +516,11 @@ static int ath10k_monitor_start(struct ath10k *ar, int vdev_id)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (!ar->monitor_present) {
+		ath10k_warn("mac montor stop -- monitor is not present\n");
+		return -EINVAL;
+	}
+
 	arg.vdev_id = vdev_id;
 	arg.channel.freq = channel->center_freq;
 	arg.channel.band_center_freq1 = ar->hw->conf.chandef.center_freq1;
@@ -566,6 +571,16 @@ static int ath10k_monitor_stop(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (!ar->monitor_present) {
+		ath10k_warn("mac montor stop -- monitor is not present\n");
+		return -EINVAL;
+	}
+
+	if (!ar->monitor_enabled) {
+		ath10k_warn("mac montor stop -- monitor is not enabled\n");
+		return -EINVAL;
+	}
+
 	ret = ath10k_wmi_vdev_down(ar, ar->monitor_vdev_id);
 	if (ret)
 		ath10k_warn("Monitor vdev down failed: %d\n", ret);
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
