Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD9ha-0004F7-Vy
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 11:09:15 +0000
Received: by laar3 with SMTP id r3so244402042laa.0
 for <ath10k@lists.infradead.org>; Thu, 09 Jul 2015 04:08:46 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/6] ath10k: random fixes 2015-07-09
Date: Thu,  9 Jul 2015 13:08:33 +0200
Message-Id: <1436440119-30231-1-git-send-email-michal.kazior@tieto.com>
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

I've done most of the patches while testing P2P
but they aren't limited to that scope.

There are no inter-dependencies within the patchset
so single patches should be easily cherry-pickable
in case, e.g. some patches raise concerns or are
decided to be dropped during review.


Michal Kazior (6):
  ath10k: don't set cck/ofdm scan flags
  ath10k: limit multi-vif ps more aggresivelly
  ath10k: fix hw roc expiration notifcation
  ath10k: update vdev ps state on start
  ath10k: fix per-vif queue locking
  ath10k: tweak interface combinations

 drivers/net/wireless/ath/ath10k/core.h    |   1 +
 drivers/net/wireless/ath/ath10k/mac.c     | 115 ++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/mac.h     |   6 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  32 +++++++--
 drivers/net/wireless/ath/ath10k/wmi.c     |   1 -
 5 files changed, 99 insertions(+), 56 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
