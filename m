Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmrQA-00062P-RV
 for ath10k@lists.infradead.org; Tue, 07 Aug 2018 02:08:35 +0000
Received: by mail-pf1-x442.google.com with SMTP id l9-v6so7738265pff.9
 for <ath10k@lists.infradead.org>; Mon, 06 Aug 2018 19:08:19 -0700 (PDT)
Date: Mon, 6 Aug 2018 19:08:14 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: ath10k: antenna bitmask support?
Message-ID: <20180807020813.GA185137@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Ben Greear <greearb@candelatech.com>

Hi all,

I'm looking at ancient changes like this:

commit 5572a95b4b5768187652a346356e39e7542ca6e0
Author: Ben Greear <greearb@candelatech.com>
Date:   Mon Nov 24 16:22:10 2014 +0200

    ath10k: apply chainmask settings to vdev on creation

since I see that some firmwares seem to crash a lot if you apply certain
chainmask settings (e.g., 0x2).

Is it really expected that you can set gaps in the chainmask or not? I
ask because I've been trying to use this for doing some antenna
configuration verification (e.g., disable all but one antenna and see
what happens), and this works as expected on APs I have running IPQ8064
(QCA988X?), but it crashes the firmware on IPQ4019.

I similarly wonder about this opinionated statement in
ath10k_check_chain_mask():

        /* It is not clear that allowing gaps in chainmask
         * is helpful.  Probably it will not do what user
         * is hoping for, so warn in that case.
         */

It seems like we should reject unexpected values (-EINVAL) if they're
really not supported. But then, I've found differences depending on the
chipset it would seem, so I guess I'd have to figure out which chipsets
(or firmwares?) support which features...

On a related note, if we *do* support "gaps" in these bitmasks, wouldn't
that mean we're handling 0x6, 0xa, etc., incorrectly in
get_nss_from_chainmask()? My prototype patch (untested so far) would be:

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 836e0a47b94a..3b557d3dc036 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -19,6 +19,7 @@
 #include "mac.h"
 
 #include <net/mac80211.h>
+#include <linux/bitops.h>
 #include <linux/etherdevice.h>
 #include <linux/acpi.h>
 
@@ -4905,13 +4906,7 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
 
 static u32 get_nss_from_chainmask(u16 chain_mask)
 {
-	if ((chain_mask & 0xf) == 0xf)
-		return 4;
-	else if ((chain_mask & 0x7) == 0x7)
-		return 3;
-	else if ((chain_mask & 0x3) == 0x3)
-		return 2;
-	return 1;
+	return max_t(u32, hweight16(chain_mask & 0xf), 1);
 }
 
 static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
