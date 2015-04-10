Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgZ1W-0001sJ-G4
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 13:31:07 +0000
Received: by lbbqq2 with SMTP id qq2so13668121lbb.3
 for <ath10k@lists.infradead.org>; Fri, 10 Apr 2015 06:30:43 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/4] ath10k: fix multiple key static wep with ibss
Date: Fri, 10 Apr 2015 13:23:21 +0000
Message-Id: <1428672203-8604-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
References: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
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

Apparently firmware requires both pairwise and
groupwise keys to be installed per-peer for static
WEP in IBSS. This wasn't necessary for AP mode
(and installing both doesn't seem to break AP
mode thus there's no special handling).

Also there seems to be some kind of issue with
mapping tx/rx keys in firmware properly which
resulted in wrong keys being used and broken
communication between devices.

It can be argued the vdev param part is more of a
workaround than a real fix. However I couldn't
figure out how to fix this differently. It works
and isn't super ugly.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6664bcc9ba88..93f753cb839a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -230,9 +230,13 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 		flags = 0;
 		flags |= WMI_KEY_PAIRWISE;
 
-		/* set TX_USAGE flag for default key id */
-		if (arvif->def_wep_key_idx == i)
-			flags |= WMI_KEY_TX_USAGE;
+		ret = ath10k_install_key(arvif, arvif->wep_keys[i], SET_KEY,
+					 addr, flags);
+		if (ret)
+			return ret;
+
+		flags = 0;
+		flags |= WMI_KEY_GROUP;
 
 		ret = ath10k_install_key(arvif, arvif->wep_keys[i], SET_KEY,
 					 addr, flags);
@@ -244,6 +248,27 @@ static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
 		spin_unlock_bh(&ar->data_lock);
 	}
 
+	/* In some cases (notably with static WEP IBSS with multiple keys)
+	 * multicast Tx becomes broken. Both pairwise and groupwise keys are
+	 * installed already. Using WMI_KEY_TX_USAGE in different combinations
+	 * didn't seem help. Using def_keyid vdev parameter seems to be
+	 * effective so use that.
+	 *
+	 * FIXME: Revisit. Perhaps this can be done in a less hacky way.
+	 */
+	if (arvif->def_wep_key_idx == -1)
+		return 0;
+
+	ret = ath10k_wmi_vdev_set_param(arvif->ar,
+					arvif->vdev_id,
+					arvif->ar->wmi.vdev_param->def_keyid,
+					arvif->def_wep_key_idx);
+	if (ret) {
+		ath10k_warn(ar, "failed to re-set def wpa key idxon vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
