Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gACIq-00060G-6x
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 11:05:23 +0000
Date: Wed, 10 Oct 2018 14:05:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath10k: get the legacy rate index to update the txrate
 table
Message-ID: <20181010110501.GA21235@mwanda>
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
To: akolli@codeaurora.org
Cc: ath10k@lists.infradead.org

Hello Anilkumar Kolli,

The patch 0189dbd71cbd: "ath10k: get the legacy rate index to update
the txrate table" from Sep 4, 2018, leads to the following static
checker warning:

	drivers/net/wireless/ath/ath10k/htt_rx.c:2788 ath10k_update_per_peer_tx_stats()
	warn: impossible condition '(rate_idx < 0) => (0-255 < 0)'

drivers/net/wireless/ath/ath10k/htt_rx.c
  2750  static void
  2751  ath10k_update_per_peer_tx_stats(struct ath10k *ar,
  2752                                  struct ieee80211_sta *sta,
  2753                                  struct ath10k_per_peer_tx_stats *peer_stats)
  2754  {
  2755          struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
  2756          u8 rate = 0, rate_idx = 0, sgi;
                ^^           ^^^^^^^^

  2757          struct rate_info txrate;
  2758  
  2759          lockdep_assert_held(&ar->data_lock);
  2760  
  2761          txrate.flags = ATH10K_HW_PREAMBLE(peer_stats->ratecode);
  2762          txrate.bw = ATH10K_HW_BW(peer_stats->flags);
  2763          txrate.nss = ATH10K_HW_NSS(peer_stats->ratecode);
  2764          txrate.mcs = ATH10K_HW_MCS_RATE(peer_stats->ratecode);
  2765          sgi = ATH10K_HW_GI(peer_stats->flags);
  2766  
  2767          if (txrate.flags == WMI_RATE_PREAMBLE_VHT && txrate.mcs > 9) {
  2768                  ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats",  txrate.mcs);
  2769                  return;
  2770          }
  2771  
  2772          if (txrate.flags == WMI_RATE_PREAMBLE_HT &&
  2773              (txrate.mcs > 7 || txrate.nss < 1)) {
  2774                  ath10k_warn(ar, "Invalid HT mcs %hhd nss %hhd peer stats",
  2775                              txrate.mcs, txrate.nss);
  2776                  return;
  2777          }
  2778  
  2779          memset(&arsta->txrate, 0, sizeof(arsta->txrate));
  2780  
  2781          if (txrate.flags == WMI_RATE_PREAMBLE_CCK ||
  2782              txrate.flags == WMI_RATE_PREAMBLE_OFDM) {
  2783                  rate = ATH10K_HW_LEGACY_RATE(peer_stats->ratecode);
  2784                  /* This is hacky, FW sends CCK rate 5.5Mbps as 6 */
  2785                  if (rate == 6 && txrate.flags == WMI_RATE_PREAMBLE_CCK)
  2786                          rate = 5;
  2787                  rate_idx = ath10k_get_legacy_rate_idx(ar, rate);
  2788                  if (rate_idx < 0)
                            ^^^^^^^^^^^^
Impossible

  2789                          return;
  2790                  arsta->txrate.legacy = rate;
  2791          } else if (txrate.flags == WMI_RATE_PREAMBLE_HT) {
  2792                  arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
  2793                  arsta->txrate.mcs = txrate.mcs + 8 * (txrate.nss - 1);

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
