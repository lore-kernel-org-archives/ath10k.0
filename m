Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bA22K-0006RG-B7
 for ath10k@lists.infradead.org; Mon, 06 Jun 2016 21:26:16 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Question on "ath10k: document ofdm/5ghz rate offset with a macro"
Message-ID: <5755EA60.7070504@candelatech.com>
Date: Mon, 6 Jun 2016 14:25:52 -0700
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
To: ath10k <ath10k@lists.infradead.org>, Michal Kazior <michal.kazior@tieto.com>

While porting some patches forward, I notice the change below
that renamed the method to "ath10k_mac_sta_has_ofdm_only".  But,
that is not really what that is checking, since it just throws
away the CCK rates (and they might have been there).

Maybe it should just be "ath10k_mac_sta_has_ofdm()" ?

Thanks,
Ben



  ath10k: document ofdm/5ghz rate offset with a macro

     Don't use literal values for offsets. While at it
     rename a function so it is more clear what it
     checks for.

     This finally takes care of the last magic
     5GHz/OFDM offset.

     Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
     Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-------------------- drivers/net/wireless/ath/ath10k/mac.c --------------------
index e62b587..ec26d96 100644
@@ -61,8 +61,11 @@ static struct ieee80211_rate ath10k_rates[] = {
  	{ .bitrate = 540, .hw_value = ATH10K_HW_RATE_OFDM_54M },
  };

-#define ath10k_a_rates (ath10k_rates + 4)
-#define ath10k_a_rates_size (ARRAY_SIZE(ath10k_rates) - 4)
+#define ATH10K_MAC_FIRST_OFDM_RATE_IDX 4
+
+#define ath10k_a_rates (ath10k_rates + ATH10K_MAC_FIRST_OFDM_RATE_IDX)
+#define ath10k_a_rates_size (ARRAY_SIZE(ath10k_rates) - \
+			     ATH10K_MAC_FIRST_OFDM_RATE_IDX)
  #define ath10k_g_rates (ath10k_rates + 0)
  #define ath10k_g_rates_size (ARRAY_SIZE(ath10k_rates))

@@ -2038,10 +2041,10 @@ static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
  		   sta->addr, !!(arg->peer_flags & WMI_PEER_QOS));
  }

-static bool ath10k_mac_sta_has_11g_rates(struct ieee80211_sta *sta)
+static bool ath10k_mac_sta_has_ofdm_only(struct ieee80211_sta *sta)
  {
-	/* First 4 rates in ath10k_rates are CCK (11b) rates. */
-	return sta->supp_rates[IEEE80211_BAND_2GHZ] >> 4;
+	return sta->supp_rates[IEEE80211_BAND_2GHZ] >>
+	       ATH10K_MAC_FIRST_OFDM_RATE_IDX;
  }


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
