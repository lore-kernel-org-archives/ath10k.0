Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b0dqO-0007XT-87
 for ath10k@lists.infradead.org; Wed, 11 May 2016 23:47:08 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 18/21] ath10k: Note limitation on beaconing vdevs.
Date: Wed, 11 May 2016 10:02:30 -0700
Message-Id: <1462986153-16318-19-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

This only pertains to CT firmware, as standard firmware
can't do anywhere near this many vdevs anyway.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 373f2ee..f1bfb3a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1343,6 +1343,22 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif,
 	arg.channel.max_reg_power = chandef->chan->max_reg_power * 2;
 	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
 
+	/* CT Firmware can support 32+ VDEVS, but can only support
+	 * beacon-ing devs with dev ids 0 - 31 due to firmware limitations.
+	 * Create VAPs first and all should be well...likely most people
+	 * won't ever hit this anyway, but some day the vdev ID allocation
+	 * could be made smarter to make it more likely to work no matter the
+	 * order the vdevs are created. --Ben
+	 */
+	if ((arvif->vdev_type == WMI_VDEV_TYPE_AP) ||
+	    (arvif->vdev_type == WMI_VDEV_TYPE_IBSS)) {
+		if (arg.vdev_id > 31) {
+			ath10k_warn(ar, "failed to start vdev %i  Beaconing VIFS must have IDs <= 31 to work-around firmware limitations.\n",
+				    arg.vdev_id);
+			return -EINVAL;
+		}
+	}
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
 		arg.ssid_len = arvif->u.ap.ssid_len;
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
