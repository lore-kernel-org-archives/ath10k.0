Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0ggo-0000CM-B3
 for ath10k@lists.infradead.org; Fri, 14 Sep 2018 05:30:49 +0000
Date: Fri, 14 Sep 2018 07:18:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: [ath6kl:pending 11/35]
 drivers/net/wireless/ath/ath10k/htt_rx.c:2544:6-14:
 WARNING: Unsigned expression compared with zero: rate_idx < 0 (fwd)
Message-ID: <alpine.DEB.2.21.1809140717440.2440@hadrien>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org

rate_idx on line 2544 will not be less than 0.

julia

---------- Forwarded message ----------
Date: Fri, 14 Sep 2018 13:15:09 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [ath6kl:pending 11/35]
    drivers/net/wireless/ath/ath10k/htt_rx.c:2544:6-14: WARNING: Unsigned
    expression compared with zero: rate_idx < 0

CC: kbuild-all@01.org
CC: ath10k@lists.infradead.org
TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   958d7cecb5b17019c865b0ecaf55d409a16768ab
commit: 0189dbd71cbd18386c7395e41c5816ae541f3e8a [11/35] ath10k: get the legacy rate index to update the txrate table
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago

>> drivers/net/wireless/ath/ath10k/htt_rx.c:2544:6-14: WARNING: Unsigned expression compared with zero: rate_idx < 0

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=0189dbd71cbd18386c7395e41c5816ae541f3e8a
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 0189dbd71cbd18386c7395e41c5816ae541f3e8a
vim +2544 drivers/net/wireless/ath/ath10k/htt_rx.c

cec17c38 Anilkumar Kolli          2016-11-23  2505
cec17c38 Anilkumar Kolli          2016-11-23  2506  static void
cec17c38 Anilkumar Kolli          2016-11-23  2507  ath10k_update_per_peer_tx_stats(struct ath10k *ar,
cec17c38 Anilkumar Kolli          2016-11-23  2508  				struct ieee80211_sta *sta,
cec17c38 Anilkumar Kolli          2016-11-23  2509  				struct ath10k_per_peer_tx_stats *peer_stats)
cec17c38 Anilkumar Kolli          2016-11-23  2510  {
cec17c38 Anilkumar Kolli          2016-11-23  2511  	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
0189dbd7 Anilkumar Kolli          2018-09-04  2512  	u8 rate = 0, rate_idx = 0, sgi;
cec17c38 Anilkumar Kolli          2016-11-23  2513  	struct rate_info txrate;
cec17c38 Anilkumar Kolli          2016-11-23  2514
cec17c38 Anilkumar Kolli          2016-11-23  2515  	lockdep_assert_held(&ar->data_lock);
cec17c38 Anilkumar Kolli          2016-11-23  2516
cec17c38 Anilkumar Kolli          2016-11-23  2517  	txrate.flags = ATH10K_HW_PREAMBLE(peer_stats->ratecode);
cec17c38 Anilkumar Kolli          2016-11-23  2518  	txrate.bw = ATH10K_HW_BW(peer_stats->flags);
cec17c38 Anilkumar Kolli          2016-11-23  2519  	txrate.nss = ATH10K_HW_NSS(peer_stats->ratecode);
cec17c38 Anilkumar Kolli          2016-11-23  2520  	txrate.mcs = ATH10K_HW_MCS_RATE(peer_stats->ratecode);
cec17c38 Anilkumar Kolli          2016-11-23  2521  	sgi = ATH10K_HW_GI(peer_stats->flags);
cec17c38 Anilkumar Kolli          2016-11-23  2522
c1dd8016 Sven Eckelmann           2017-05-19  2523  	if (txrate.flags == WMI_RATE_PREAMBLE_VHT && txrate.mcs > 9) {
c1dd8016 Sven Eckelmann           2017-05-19  2524  		ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats",  txrate.mcs);
c1dd8016 Sven Eckelmann           2017-05-19  2525  		return;
c1dd8016 Sven Eckelmann           2017-05-19  2526  	}
c1dd8016 Sven Eckelmann           2017-05-19  2527
c1dd8016 Sven Eckelmann           2017-05-19  2528  	if (txrate.flags == WMI_RATE_PREAMBLE_HT &&
c1dd8016 Sven Eckelmann           2017-05-19  2529  	    (txrate.mcs > 7 || txrate.nss < 1)) {
c1dd8016 Sven Eckelmann           2017-05-19  2530  		ath10k_warn(ar, "Invalid HT mcs %hhd nss %hhd peer stats",
c1dd8016 Sven Eckelmann           2017-05-19  2531  			    txrate.mcs, txrate.nss);
cec17c38 Anilkumar Kolli          2016-11-23  2532  		return;
cec17c38 Anilkumar Kolli          2016-11-23  2533  	}
cec17c38 Anilkumar Kolli          2016-11-23  2534
0f8a2b77 Mohammed Shafi Shajakhan 2017-01-13  2535  	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
0f8a2b77 Mohammed Shafi Shajakhan 2017-01-13  2536
cec17c38 Anilkumar Kolli          2016-11-23  2537  	if (txrate.flags == WMI_RATE_PREAMBLE_CCK ||
cec17c38 Anilkumar Kolli          2016-11-23  2538  	    txrate.flags == WMI_RATE_PREAMBLE_OFDM) {
cec17c38 Anilkumar Kolli          2016-11-23  2539  		rate = ATH10K_HW_LEGACY_RATE(peer_stats->ratecode);
cec17c38 Anilkumar Kolli          2016-11-23  2540  		/* This is hacky, FW sends CCK rate 5.5Mbps as 6 */
0189dbd7 Anilkumar Kolli          2018-09-04  2541  		if (rate == 6 && txrate.flags == WMI_RATE_PREAMBLE_CCK)
0189dbd7 Anilkumar Kolli          2018-09-04  2542  			rate = 5;
0189dbd7 Anilkumar Kolli          2018-09-04  2543  		rate_idx = ath10k_get_legacy_rate_idx(ar, rate);
0189dbd7 Anilkumar Kolli          2018-09-04 @2544  		if (rate_idx < 0)
0189dbd7 Anilkumar Kolli          2018-09-04  2545  			return;
cd591027 Mohammed Shafi Shajakhan 2017-01-12  2546  		arsta->txrate.legacy = rate;
cec17c38 Anilkumar Kolli          2016-11-23  2547  	} else if (txrate.flags == WMI_RATE_PREAMBLE_HT) {
cec17c38 Anilkumar Kolli          2016-11-23  2548  		arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
c1dd8016 Sven Eckelmann           2017-05-19  2549  		arsta->txrate.mcs = txrate.mcs + 8 * (txrate.nss - 1);
cec17c38 Anilkumar Kolli          2016-11-23  2550  	} else {
cec17c38 Anilkumar Kolli          2016-11-23  2551  		arsta->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
cec17c38 Anilkumar Kolli          2016-11-23  2552  		arsta->txrate.mcs = txrate.mcs;
cec17c38 Anilkumar Kolli          2016-11-23  2553  	}
cec17c38 Anilkumar Kolli          2016-11-23  2554
cec17c38 Anilkumar Kolli          2016-11-23  2555  	if (sgi)
cec17c38 Anilkumar Kolli          2016-11-23  2556  		arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
cec17c38 Anilkumar Kolli          2016-11-23  2557
cec17c38 Anilkumar Kolli          2016-11-23  2558  	arsta->txrate.nss = txrate.nss;
91493e8e Christian Lamparter      2018-03-28  2559  	arsta->txrate.bw = ath10k_bw_to_mac80211_bw(txrate.bw);
cec17c38 Anilkumar Kolli          2016-11-23  2560  }
cec17c38 Anilkumar Kolli          2016-11-23  2561

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
