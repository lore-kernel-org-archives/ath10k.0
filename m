Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjF2v-0006aX-5D
 for ath10k@lists.infradead.org; Thu, 02 Mar 2017 00:56:42 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 37B1240A5ED
 for <ath10k@lists.infradead.org>; Wed,  1 Mar 2017 16:56:19 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: ath10k bug in station mode with regard to TX-BEAMFORMER?
Message-ID: <8f2382ad-4778-f32d-762c-09c543e93afd@candelatech.com>
Date: Wed, 1 Mar 2017 16:56:18 -0800
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

I have a user with an AP that advertises itself as a MU-BEAMFORMEE (and not MU-BEAMFORMER).
My station firmware on 9984 is crashing because it tries to set up MU-MIMO tx logic as
best as I can figure.

Does the patch below look like a good idea?

If so, I'll do it up official.  Unfortunately, I don't have a good way to
test this locally, so this is just based on my vague understanding of this
feature...

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 219daaee..5aefc8a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5372,6 +5372,7 @@ static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)
  {
         u32 value = 0;
         struct ath10k *ar = arvif->ar;
+       struct ieee80211_vif *vif = arvif->vif;
         int nsts;
         int sound_dim;

@@ -5391,17 +5392,21 @@ static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)
         if (!value)
                 return 0;

-       if (ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE)
+       if ((ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE) &&
+           (vif->type != NL80211_IFTYPE_STATION))
                 value |= WMI_VDEV_PARAM_TXBF_SU_TX_BFER;

-       if (ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE)
+       if ((ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE) &&
+           (vif->type != NL80211_IFTYPE_STATION))
                 value |= (WMI_VDEV_PARAM_TXBF_MU_TX_BFER |
                           WMI_VDEV_PARAM_TXBF_SU_TX_BFER);

-       if (ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE)
+       if ((ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE) &&
+           (vif->type == NL80211_IFTYPE_STATION))
                 value |= WMI_VDEV_PARAM_TXBF_SU_TX_BFEE;

-       if (ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE)
+       if ((ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE) &&
+               (vif->type == NL80211_IFTYPE_STATION))
                 value |= (WMI_VDEV_PARAM_TXBF_MU_TX_BFEE |
                           WMI_VDEV_PARAM_TXBF_SU_TX_BFEE);


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
