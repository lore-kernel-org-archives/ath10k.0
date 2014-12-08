Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy1wV-00008l-MI
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 17:17:52 +0000
Subject: [HACK PATCH 0/4] ath10k: 802.3 frame format support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 8 Dec 2014 19:16:49 +0200
Message-ID: <20141208170804.1001.1804.stgit@potku.adurom.net>
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
To: ath10k@lists.infradead.org

Hi,

some time ago Michal did an experimentation to use 802.3 frame format with
ath10k which needed some really really horrible mac80211 hacks. It would need a
lot of work to get these upstream (if ever), but I'm sending these anyway in
hope it would help to optimise ath10k throughput in slower devices. And who
knows, maybe even find some bottlenecks which we are able to fix in upstream.

I took Michal's patches, rebased them and added Kconfig option to make it
easier to experiment with and without the feature. I did only a quick test that
ping works, but I'm sure this is broken n+1 different ways.

I would be very interested to hear any comments or findings.

---

Michal Kazior (4):
      mac80211: rx
      mac8011: tx
      ath10k: rx
      ath10k: tx


 drivers/net/wireless/ath/ath10k/Kconfig  |    8 ++++++
 drivers/net/wireless/ath/ath10k/core.h   |    6 +++++
 drivers/net/wireless/ath/ath10k/htt_rx.c |   40 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c |   12 +++++++++
 drivers/net/wireless/ath/ath10k/mac.c    |   29 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c    |    9 +++++++
 include/net/mac80211.h                   |    5 ++++
 net/mac80211/rx.c                        |   10 ++++++++
 net/mac80211/status.c                    |    5 ++++
 net/mac80211/tx.c                        |   15 +++++++++++
 10 files changed, 139 insertions(+)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
