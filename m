Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpOkV-0006aI-W1
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 23:58:52 +0000
From: Thomas Pedersen <twp@qca.qualcomm.com>
Subject: [PATCH 0/4] ath10k: fix mesh sync operation
Date: Wed, 28 Sep 2016 16:56:27 -0700
Message-ID: <20160928235631.9197-1-twp@qca.qualcomm.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Thomas Pedersen <twp@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>

This patchset introduces a new ieee80211_op offset_tsf(), which gives
the driver a s64 TSF offset for TSF adjustment. This is more accurate
than programming absolute TSF since programming delay is avoided.

ath10k can't get the current TSF or program an absolute TSF, so we
remove those ops to not mislead the stack and hopefully avoid future
bugs.

Tested on QCA4019 with firmware 10.4-3.2.1-0033. After this change
Toffset remains stable to within 5us.

Thomas Pedersen (4):
  mac80211: add offset_tsf driver op
  ath10k: implement offset_tsf ieee80211_op
  ath10k: remove set/get_tsf ieee80211_ops
  mac80211: mesh: decrease max drift

 drivers/net/wireless/ath/ath10k/mac.c     | 45 +++++++++++--------------------
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 -
 drivers/net/wireless/ath/ath10k/wmi.c     |  6 ++---
 drivers/net/wireless/ath/ath10k/wmi.h     |  8 +++++-
 include/net/mac80211.h                    |  8 ++++++
 net/mac80211/debugfs_netdev.c             | 12 ++++++---
 net/mac80211/driver-ops.c                 | 15 +++++++++++
 net/mac80211/driver-ops.h                 |  3 +++
 net/mac80211/mesh_sync.c                  | 12 ++++++---
 net/mac80211/trace.h                      | 26 ++++++++++++++++++
 10 files changed, 94 insertions(+), 42 deletions(-)

-- 
2.10.0.297.gf6727b0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
