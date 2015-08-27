Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f178.google.com ([209.85.223.178])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZUusZ-0004Bo-IS
 for ath10k@lists.infradead.org; Thu, 27 Aug 2015 10:58:00 +0000
Received: by iodt126 with SMTP id t126so52456862iod.2
 for <ath10k@lists.infradead.org>; Thu, 27 Aug 2015 03:57:31 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH 0/3] mesh support for ath10k
Date: Thu, 27 Aug 2015 06:57:01 -0400
Message-Id: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
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
To: linux-wireless@vger.kernel.org
Cc: Bob Copeland <me@bobcopeland.com>, ath10k@lists.infradead.org

Hello,

This was previously sent to ath10k ML, now adding linux-wireless for
wider review.  Patch 3 gained a minor change since then to check for
raw mode feature flag from the firmware.

This patchset implements mesh support on ath10k.  There aren't many
changes required to the driver, now that most of the required raw-mode
support is upstream.

I've tested VHT multihop on openwrt with the appropriate patches
backported.

Regarding performance: I currently get about 75 Mbps with udp iperf
due to small aggregates, which leaves a lot to be desired.  Some users,
however, have reported 300+ Mbps [1], so this is potentially solvable.

[1] http://thread.gmane.org/gmane.linux.drivers.mesh.open80211s/3963

Bob Copeland (3):
  ath10k: enable monitor when OTHER_BSS requested
  ath10k: check for encryption before adding MIC_LEN
  ath10k: implement mesh support

 drivers/net/wireless/ath/ath10k/core.c   |  6 ++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c |  3 ++-
 drivers/net/wireless/ath/ath10k/mac.c    | 34 +++++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
