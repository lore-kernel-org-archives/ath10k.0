Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YctU6-0007Nh-LS
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 10:33:27 +0000
Received: by lagg8 with SMTP id g8so9195444lag.1
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2015 03:33:02 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v6 0/7] ath10k: add multi-channel support
Date: Tue, 31 Mar 2015 10:26:19 +0000
Message-Id: <1427797586-5132-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

New qca6174 with wmi-tlv firmware supports
multi-channel operation. To make use of it
ath10k needs a few changes: implement mac80211's
chanctx API and rework tx queue control a bit.


Changes since RFC:
 * I've sent `ath10k: defer AP self-peer removal
   wait` separately now because it's not really
   required for multi-channel per se

v2:
 * fix null deref after rebasing
 * fix commit log typo

v3:
 * remove some duplication wrt mac80211 [Johannes]
 * small fixes

v4:
 * rebased
 * fix STA CSA
 * drop ar->arvifs data_lock protection patch
 * drop ar->arvifs for vif iteration in favour of
   ieee80211_iterate_active_interfaces()
 * small refactor in monitor recalc
 * add a patch to fix fw resource allocation for
   multi-vif/chan

v5:
 * rebased on top of pending branch
 * 12 char commit ids
 * increase vif limit to 3 in ifcombs

v6:
 * fix rcu locking
 * rebased on master branch
   (mind the cfg80211_get_bss conflict when
    applying to pending branch)

Michal Kazior (7):
  ath10k: allow empty ssid vdev config
  ath10k: implement chanctx API
  ath10k: implement adaptive qcs command
  ath10k: rework tx queue locking
  ath10k: implement tx pause wmi event
  ath10k: enable multi-channel on supported devices
  ath10k: allocate fw resources for iface combinations

 drivers/net/wireless/ath/ath10k/core.h    |  18 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 100 +++-
 drivers/net/wireless/ath/ath10k/htt_tx.c  |   4 +-
 drivers/net/wireless/ath/ath10k/hw.h      |   6 +-
 drivers/net/wireless/ath/ath10k/mac.c     | 956 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/mac.h     |  14 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  16 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  88 ++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  46 ++
 drivers/net/wireless/ath/ath10k/wmi.c     |  18 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |   1 +
 11 files changed, 1126 insertions(+), 141 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
