Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVKHA-0000Cj-8I
 for ath10k@lists.infradead.org; Tue, 10 Mar 2015 13:32:48 +0000
Received: by labmn12 with SMTP id mn12so1664862lab.8
 for <ath10k@lists.infradead.org>; Tue, 10 Mar 2015 06:32:25 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2] ath10k: fix PMG by using AES-CMAC/IGTK software crypto
Date: Tue, 10 Mar 2015 14:32:19 +0100
Message-Id: <1425994339-15864-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

While testing with older supplicant, .drv_set_key() was failing due to
higher than ath10k firmware could handle key_index (WMI_MAX_KEY_INDEX == 3).

--
wpa_driver_nl80211_set_key: ifindex=15 alg=4 addr=0x7f02b129fbe3 key_idx=4 set_tx=0 seq_len=6 key_len=16
    broadcast key
nl80211: set_key failed; err=-22 Invalid argument)
wlan0: WPA: Failed to configure IGTK to the driver
wlan0: RSN: Failed to configure IGTK
--

In order to fix this case (PMF: AES-CMAC/IGTK) force the AES_CMAC cipher to
be handled by software.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1138f4f8923f..5a3129010951 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -66,8 +66,8 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
 		arg.key_cipher = WMI_CIPHER_WEP;
 		break;
 	case WLAN_CIPHER_SUITE_AES_CMAC:
-		/* this one needs to be done in software */
-		return 1;
+		WARN_ON(1);
+		return -EINVAL;
 	default:
 		ath10k_warn(ar, "cipher %d is not supported\n", key->cipher);
 		return -EOPNOTSUPP;
@@ -3995,6 +3995,10 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	int ret = 0;
 	u32 flags = 0;
 
+	/* this one needs to be done in software */
+	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC)
+		return 1;
+
 	if (key->keyidx > WMI_MAX_KEY_INDEX)
 		return -ENOSPC;
 
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
