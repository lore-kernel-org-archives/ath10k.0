Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Co5-0001kQ-KT
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:46:35 +0000
Received: by mail-we0-f171.google.com with SMTP id q58so8945769wes.2
 for <ath10k@lists.infradead.org>; Thu, 10 Jul 2014 04:46:06 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFT/RFC 0/5] ath10k: handle/report A-MSDU as a skb list
Date: Thu, 10 Jul 2014 13:45:09 +0200
Message-Id: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, denton.gentry@gmail.com

This is prototype, how we can handle A-MSDU as a skb list in mac80211.
No changes in mac80211 reordering code required in such case, also
we don't need to build one big frame using memcpy ...
With such prototype tid_agg_rx->reorder_buf[sn] will describe exactly
one MPDU (with included A-MSDU subframes if skb->next) and detection of duplicated
frames will work correctly. So, reordering should works correctly.

I tested this with A-MPDU and A-MSDU run together (A-MSDU frame up to 10k) - TCP STA -> AP.
I used ath10k STA with unlocked A-MSDU limit in RC in firmware.
Didn't notice any problems.

@Denton could you check this prototype in your env please

TODO:
mac80211 - release correctly A-MSDU list in case of problems (errors)
verify crypted networks + A-MSDU
introduce test code to ath10k driver that we can test mac80211 reordering implementation


Janusz Dziedzic (5):
  ath10k: amsdu rx, buid one big frame
  mac80211: add option to handle amsdu as a list of skb
  cfg80211: allow RX amsdu to be reported as a list
  ath10k: report amsdu as a skb list
  ath10k: rx, don't pass frames with invalid FCS

 drivers/net/wireless/ath/ath10k/htt_rx.c |   62 ++++++++++++++++----------
 include/net/mac80211.h                   |    4 ++
 net/mac80211/ieee80211_i.h               |    1 +
 net/mac80211/main.c                      |    2 +-
 net/mac80211/rx.c                        |   70 ++++++++++++++++++++++++++++--
 net/wireless/util.c                      |   44 +++++++++++++++++++
 6 files changed, 155 insertions(+), 28 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
