Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqH-0003AI-Ol
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:07 +0000
Received: by mail-ea0-f180.google.com with SMTP id m10so327096eaj.25
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:52:44 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 00/14] ath10k: Refactor rx path little bit
Date: Tue,  4 Mar 2014 13:52:13 +0100
Message-Id: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Refactor rx path, mainly split/reduce calculation we
did before. Now we caculate variable/flags only once
per-ppdu, while before we did some calculations for
each mpdu. Kill some not needed code and fill directly
ieee80211_rx_status structure.
TP veryfication required.

Janusz Dziedzic (14):
  ath10k: add ath10k_htt_rx_amsdu_allowed function
  ath10k: Fill per-ppdu info in rx_info only once
  ath10k: move rx related functions to htt_rx.c
  ath10k: rename process_rx_rates to ath10k_htt_rx_h_rates
  ath10k: introduce ieee80211_rx_status to htt_rx_info
  ath10k: kill signal field in htt_rx_info
  ath10k: setup rx channel per ppdu
  ath10k: kill rate substruct and tsf from htt_rx_info
  ath10k: kill fcs_err from htt_rx_info
  ath10k: kill mic_err/amsdu_more from htt_rx_info
  ath10k: kill status from htt_rx_info
  ath10k: kill encrypt_type from htt_rx_info
  ath10k: return error when ath10k_htt_rx_amsdu_pop() fail
  ath10k: improve way we play with attention flags

 drivers/net/wireless/ath/ath10k/htt.h    |   15 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c |  436 +++++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/txrx.c   |  183 -------------
 drivers/net/wireless/ath/ath10k/txrx.h   |    1 -
 4 files changed, 308 insertions(+), 327 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
