Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwwAH-00017H-KF
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 18:00:06 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2] cfg80211: add VHT support for Mesh
Date: Thu, 12 Nov 2015 09:59:12 -0800
Message-ID: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Add NL80211_EXT_FEATURE_VHT_MESH flag to allow drivers
to indicate support for VHT in Mesh mode.
This flag will be used by wireless drivers to indicate
the capability of VHT Mesh support and wpa_supplicant to inspect
wireless drivers' capability of VHT Mesh.
In addition to this patch, separate patches to ath10k driver and
wpa_supplicant are also sent out.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

---
v2:
	- updated commit message for details
---
 include/uapi/linux/nl80211.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 1f0b4cf..4a16ed5 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4389,12 +4389,14 @@ enum nl80211_feature_flags {
 /**
  * enum nl80211_ext_feature_index - bit index of extended features.
  * @NL80211_EXT_FEATURE_VHT_IBSS: This driver supports IBSS with VHT datarates.
+ * @NL80211_EXT_FEATURE_VHT_MESH: This driver supports Mesh with VHT datarates.
  *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
  */
 enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_VHT_IBSS,
+	NL80211_EXT_FEATURE_VHT_MESH,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
