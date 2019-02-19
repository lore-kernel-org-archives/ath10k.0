Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwBxm-0003hU-Cx
 for ath10k@lists.infradead.org; Tue, 19 Feb 2019 20:26:00 +0000
Received: by mail-it1-x142.google.com with SMTP id m137so9389001ita.0
 for <ath10k@lists.infradead.org>; Tue, 19 Feb 2019 12:25:57 -0800 (PST)
Received: from hash (CPE30b5c2fb365b-CM18593342f28f.cpe.net.cable.rogers.com.
 [99.232.51.173])
 by smtp.gmail.com with ESMTPSA id q12sm7400317ioi.54.2019.02.19.12.25.55
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Feb 2019 12:25:55 -0800 (PST)
Received: from bob by hash with local (Exim 4.92-RC4)
 (envelope-from <me@bobcopeland.com>) id 1gwBxi-0007Q1-Ps
 for ath10k@lists.infradead.org; Tue, 19 Feb 2019 15:25:54 -0500
Date: Tue, 19 Feb 2019 15:25:54 -0500
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH RFC] out-of-order frames
Message-ID: <20190219202554.GA5065@localhost>
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

Hi all,

I'm seeing an issue with ath10k delivering frames out of order.  In encrypted
networks, this is resulting in a ton of drops due to PN checks in mac80211
when some predecessor frames are dropped due to FCS fail, while later frames
are processed without waiting.

Some notes / observations:

 - This is on a 4.14.94 kernel:

[   12.454034] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
[   12.487148] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00104 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 4317698a

 - I _very_ infrequently see the firmware indication that results in
   ath10k_htt_rx_addba() being called.  This, despite seeing lots of
   successful ADDBA Request frames between the STAs captured on a
   third-party monitor.  For example, I might see one indication, or
   none at all, while seeing dozens of BA sessions established on the
   monitor.

 - Because of the above, the mac80211 reorder buffer is never used (tid_rx
   is null).  Yet ath10k evidently relies on it, e.g. this comment:

    /* Ignore this event because mac80211 takes care of Rx
     * aggregation reordering.
     */

 - excerpt of printks showing that frame a81 is being processed
   after frame a85 was processed.   If firmware has its own reorder
   buffer, it's not working:

ieee80211_crypto_ccmp_decrypt: pn err: 00 00 00 00 15 e8  (q 0 seq a81 flag e8120a prev: q 0 seq a85)
ieee80211_crypto_ccmp_decrypt: pn err2 00 00 00 00 16 08

   [patch for those trace_printk()s: http://paste.debian.net/1069009/]

 - I can pretend there is a BA session when the station is added via the
   following hack, and it makes the issues go away (at least until mac80211
   decides to end the BA session) but I'd rather not rely on this:

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 47e0cb59b948..0d8c4378db9f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6075,6 +6075,15 @@ static int ath10k_mac_tdls_vifs_count(struct ieee80211_hw *hw)
 	return num_tdls_vifs;
 }
 
+static void ath10k_init_ba_offload(struct ieee80211_vif *vif,
+				   const u8 *addr)
+{
+	int i;
+
+	for (i = 0; i < IEEE80211_NUM_TIDS; i++)
+		ieee80211_start_rx_ba_session_offl(vif, addr, i);
+}
+
 static int ath10k_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
@@ -6163,6 +6172,8 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			goto exit;
 		}
 
+		ath10k_init_ba_offload(vif, sta->addr);
+
 		arsta->peer_id = find_first_bit(peer->peer_ids,
 						ATH10K_MAX_NUM_PEER_IDS);
 


Does this sound familiar to anyone?  Is there possibly an updated firmware
or software fix for this?

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
