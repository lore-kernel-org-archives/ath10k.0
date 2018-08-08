Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnLtU-0002aZ-U7
 for ath10k@lists.infradead.org; Wed, 08 Aug 2018 10:40:46 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2 0/2] Change sk_pacing_shift in ieee80211_hw for best tx
 throughput
Date: Wed,  8 Aug 2018 18:40:00 +0800
Message-Id: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org

Add a field for ath10k to adjust the sk_pacing_shift, mac80211 set
the default value to 8, and ath10k will change it to 6. Then mac80211
will use the changed value 6 as sk_pacing_shift since 6 is the best
value for tx throughput by test result.

Wen Gong (2):
  mac80211: Change sk_pacing_shift saved to ieee80211_hw
  ath10k: Set sk_pacing_shift to 6 for 11AC WiFi chips

 drivers/net/wireless/ath/ath10k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath10k/hw.h   | 3 +++
 drivers/net/wireless/ath/ath10k/mac.c  | 4 ++++
 include/net/mac80211.h                 | 5 +++++
 net/mac80211/main.c                    | 2 ++
 net/mac80211/tx.c                      | 2 +-
 6 files changed, 21 insertions(+), 1 deletion(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
