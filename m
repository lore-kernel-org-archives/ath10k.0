Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from exchange.luceor.com ([178.33.245.144])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7Jd1-0006dn-Rt
 for ath10k@lists.infradead.org; Fri, 11 Dec 2015 09:04:40 +0000
From: Simon Malthieu <simon.malthieu@luceor.com>
Subject: ath10k and mac80211 number of chains meaning
Message-ID: <566A9186.6020807@luceor.com>
Date: Fri, 11 Dec 2015 10:04:06 +0100
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

I would like to know the exact meaning of "chains" member of struct 
sta_info. mac80211 sta_info.h states :

"@chains: chains ever used for RX from this station"

In ath9k, it is incremented when testing each value of the chain_signal 
array (code here is ath9k common.c) :

if (rssi != ATH9K_RSSI_BAD) {
             rxs->chains |= BIT(j);
             rxs->chain_signal[j] = ah->noise + rssi;
         }

I did this in ath10k (htt-rx.c l.874) on the model of a patch published 
on the mailing list :

static void ath10k_htt_rx_h_signal(struct ath10k *ar,
                    struct ieee80211_rx_status *status,
                    struct htt_rx_desc *rxd)
{
     u8 signal_per_chain;
     int i;
     for (i = 0; i< IEEE80211_MAX_CHAINS; i++)
     {
         signal_per_chain = rxd->ppdu_start.rssi_chains[i].pri20_mhz;
         if (signal_per_chain != ATH10K_RSSI_BAD) // = 0x80
         {
             status->chains |= BIT(i);
             status->chain_signal[i] = ATH10K_DEFAULT_NOISE_FLOOR + 
signal_per_chain;
         }
     }
     /* FIXME: Get real NF */
     status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
              rxd->ppdu_start.rssi_comb;
     status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
}

But when I configure the number of antennas (iw phy0 set antennas - iw 
3.15) lower than the maximum of antennas, chains doesn't change, i.e. 
there is still a correct value in chain_signal of the disabled antennas 
(the value is not updated though).

I don't understand how a signal value can be received from a STA if the 
antennas configuration doesn't allow it.

If it is not a bug, should i check rx_chain_mask in the driver to verify 
the antennas configuration instead of chains ?

Thanks for your help

Simon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
