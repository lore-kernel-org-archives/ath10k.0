Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4byS-00044O-2e
 for ath10k@lists.infradead.org; Mon, 15 Jun 2015 21:31:21 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 8B31F40B4B8
 for <ath10k@lists.infradead.org>; Mon, 15 Jun 2015 14:30:58 -0700 (PDT)
Message-ID: <557F4412.7000105@candelatech.com>
Date: Mon, 15 Jun 2015 14:30:58 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Updated CT firmware uploaded.
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
To: ath10k <ath10k@lists.infradead.org>

Changes since last email of this nature:

Fixed firmware to pay attention to the non-standard TIDS in
station mode.  This allows host to properly request
HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST and have it actually work.

This fixes the station disconnect regressions we saw in the last
firmware beta.

You may need this (below) patch to your kernel as well.  Or, maybe this problem
only happened when using our CT kernel due to some other private patches
we carry.  I don't do much testing on stock kernels, but please do report
any problems or success on whatever kernels you use.

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c

index 3199445..29851d2 100644 (file)


--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1916,6 +1916,9 @@ static u8 ath10k_tx_h_get_tid(struct ieee80211_hdr *hdr)
        if (ieee80211_is_mgmt(hdr->frame_control))
                return HTT_DATA_TX_EXT_TID_MGMT;

+       if (ieee80211_is_nullfunc(hdr->frame_control))
+               return HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST;
+
        if (!ieee80211_is_data_qos(hdr->frame_control))
                return HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST;


And note:  For anyone doing IBSS/ADHOC with my firmware, please use
the beta builds until I can do an official version-14 release.

http://www.candelatech.com/ath10k.php

http://www.candelatech.com/downloads/ath10k-fw-beta/

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
