Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH7AR-0002V2-0P
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 08:43:07 +0000
Received: by mail-wg0-f44.google.com with SMTP id z12so25613604wgg.3
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 00:42:44 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/7] ath10k: add multi-channel support
Date: Fri, 30 Jan 2015 09:41:20 +0100
Message-Id: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
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

There are still rough edges (involving seldom
beacon reports from firmware causing beacon loss
in some cases, etc). Hopefully this will be fixed
either in driver or firmware eventually.


Changes since RFC:
 * I've sent `ath10k: defer AP self-peer removal
   wait` separately now because it's not really 
   required for multi-channel per se


Michal Kazior (7):
  ath10k: allow empty ssid vdev config
  ath10k: implement chanctx API
  ath10k: implement adaptive qcs command
  ath10k: protect ar->arvifs linking with data_lock
  ath10k: rework tx queue locking
  ath10k: implement tx pause wmi event
  ath10k: enable multi-channel on supported devices

 drivers/net/wireless/ath/ath10k/core.c    |   1 +
 drivers/net/wireless/ath/ath10k/core.h    |  16 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |  87 +++-
 drivers/net/wireless/ath/ath10k/htt_tx.c  |  11 +-
 drivers/net/wireless/ath/ath10k/mac.c     | 672 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/mac.h     |  57 +++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  16 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 118 +++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  46 ++
 drivers/net/wireless/ath/ath10k/wmi.c     |  18 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |   1 +
 11 files changed, 958 insertions(+), 85 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
