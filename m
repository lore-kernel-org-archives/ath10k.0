Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWRQO-0000WJ-NB
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 13:46:09 +0000
Subject: [PATCH v2 2/8] ath10k: add sanity checks for monitor management
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 16 Oct 2013 16:45:48 +0300
Message-ID: <20131016134548.25095.6014.stgit@localhost6.localdomain6>
In-Reply-To: <20131016134503.25095.8044.stgit@localhost6.localdomain6>
References: <20131016134503.25095.8044.stgit@localhost6.localdomain6>
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

From: Michal Kazior <michal.kazior@tieto.com>

Add a few checks and warnings to make it easier to
track any kind of monitor vdev mismanagement.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 527343d..da23c3f 100644
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


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
