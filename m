Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNYw-0000Yl-4r
 for ath10k@lists.infradead.org; Tue, 29 Oct 2019 09:13:15 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V9 0/3] mac80211: add 802.11 encapsulation offloading
Date: Tue, 29 Oct 2019 10:13:01 +0100
Message-Id: <20191029091304.7330-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>

This series picks up prior work from QCA. The patch is currently shipped
inside QSDK as part of the wlan-open package.

Changes in V9
* implement comments from Johannes
* add tx status reporting
* let the driver decide if tx frag will break encap mode
* use true/false for bool values
* move use_4addr check to driver

Changes in V8
* fix double locking when setting frag threshold

Changes in V7
* dont mask out monitor support when encap is available. Instead turn encap
  of if a monitor device is brought up or already present

Changes in V6
* the conditional masking out monitor support was inverse

Changes in V5
* implement comments from Johannes

Changes in V4
* disable encap when TKIP is used instead of refusing TKIP
* use a flag inside tx_info instead of an extra element
* move 4addr detection into ieee80211_set_hw_80211_encap()
* ieee80211_tx_dequeue() was dropping out to early

Changes in V3
* rebase on latest kernel
* various code style clean ups
* give some of the variables and functions more obvious names
* move the code that disables support for non-linear frames to the core
* disable monitor and tkip support

John Crispin (3):
  mac80211: move store skb ack code to its own function
  mac80211: add hw 80211 encapsulation offloading support
  ath10k: add tx hw 802.11 encapusaltion offloading support

 drivers/net/wireless/ath/ath10k/core.c   |  11 ++
 drivers/net/wireless/ath/ath10k/core.h   |   3 +
 drivers/net/wireless/ath/ath10k/htt_tx.c |  24 ++-
 drivers/net/wireless/ath/ath10k/mac.c    |  76 ++++++--
 drivers/net/wireless/ath/ath10k/txrx.c   |  11 +-
 include/net/mac80211.h                   |  39 ++++
 net/mac80211/debugfs.c                   |   1 +
 net/mac80211/ieee80211_i.h               |   9 +
 net/mac80211/iface.c                     |  68 +++++++
 net/mac80211/key.c                       |   7 +
 net/mac80211/status.c                    |  74 +++++++
 net/mac80211/tx.c                        | 233 ++++++++++++++++++++---
 12 files changed, 506 insertions(+), 50 deletions(-)

-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
