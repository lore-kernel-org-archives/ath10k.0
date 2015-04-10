Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yggvs-0004v9-2u
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 21:57:48 +0000
Message-ID: <55284744.80105@candelatech.com>
Date: Fri, 10 Apr 2015 14:57:24 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] ath10k: enable ibss-rsn
References: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
 <1428672203-8604-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1428672203-8604-5-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 04/10/2015 06:23 AM, Michal Kazior wrote:
> From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> 
> With latest additions to the driver it seems
> viable to enable support for IBSS-RSN.
> 
> It seems to work on QCA988X and 999.999.0.636 but
> is a bit slow to exchange RSN keys for some
> reason. This may be a firmware quirk or ath10k is
> missing something. Nevertheless it makes sense to
> finally enable IBSS-RSN in ath10k even if somewhat
> handicapped.
> 
> QCA6174 firmware doesn't seem to be able to Tx
> EAPOL frames at all now (they get stuck in hw
> queues for some reason) so it never gets to set
> the keys in driver. It's fairly safe to assume that
> once this is fixed IBSS-RSN will work with QCA6174
> firmware without any additional changes. Hence no
> special handling for advertising
> IEEE80211_HW_SUPPORTS_PER_STA_GTK and
> WIPHY_FLAG_IBSS_RSN is done now.

With your patches (though not certain they are all needed on my firmware
now), and this patch below, my 10.1 system seems to be doing IBSS + RSN properly.

In case you are seeing any issues with small packets on your IBSS systems, I would
be curious to know your results if you gave this patch a try.

Without this, I see runt frames received on the peer (ARP responses in this particular case).

I was also seeing similarly corrupted EAPOL frames from what I can tell.

I don't really know why this is required, or if it is required for more than just
IBSS + RSN at this point.

[greearb@ben-dt2 ath10k]$ git diff
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d3add01..853bf55 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2631,6 +2631,19 @@ static void ath10k_tx(struct ieee80211_hw *hw,
        struct ieee80211_vif *vif = info->control.vif;
        struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;

+
+       if (vif && vif->type == NL80211_IFTYPE_ADHOC) {
+               static int my_zlen = 78;
+               /* This nasty little hack fixes IBSS + RSN with small
+                * frames frames (ARP, etc) on 10.1 (CT) firmware.
+                * Shouldn't hurt any firmware, and may help other as well. --Ben
+                */
+               if (skb->len < my_zlen) {
+                       if (skb_put_padto(skb, my_zlen))
+                               return; /* skb was consumed by skb_padto on error */
+               }
+       }
+
        /* We should disable CCK RATE due to P2P */
        if (info->flags & IEEE80211_TX_CTL_NO_CCK_RATE)
                ath10k_dbg(ar, ATH10K_DBG_MAC, "IEEE80211_TX_CTL_NO_CCK_RATE\n");


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
