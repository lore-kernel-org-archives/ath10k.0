Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFYk-0000M1-6o
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:45:58 +0000
Received: by mail-lb0-x236.google.com with SMTP id oh2so23414924lbb.3
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:45:37 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 00/13] ath10k: implement push-pull tx model
Date: Thu, 21 Jan 2016 14:46:33 +0100
Message-Id: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
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

This adds support for the new logic where host
tells firmware how many frames are queued for each
station/tid and then firmware asks host to submit
frames for given station/tid.

The patch count is a bit high but I tried
splitting the patches as much as possible to keep
them short and easy to review. Hopefully it's not
going to be a huge headache.

Note: This depends on my other patches:

 http://lists.infradead.org/pipermail/ath10k/2016-January/006675.html
 http://lists.infradead.org/pipermail/ath10k/2016-January/006729.html
 http://thread.gmane.org/gmane.linux.kernel.wireless.general/147504

I'm posting this prior to the above getting merged
to get early feedback. 

For convienence I'm providing a branch on github
which contains all dependencies and the patchset
itself:

  https://github.com/kazikcz/linux/tree/ath10k-pull-push


Michal Kazior (13):
  ath10k: refactor tx code
  ath10k: unify txpath decision
  ath10k: refactor tx pending management
  ath10k: maintain peer_id for each sta and vif
  ath10k: add fast peer_map lookup
  ath10k: add new htt message generation/parsing logic
  ath10k: implement wake_tx_queue
  ath10k: implement updating shared htt txq state
  ath10k: add txq placeholder
  ath10k: implement flushing of pending frames in txqs
  ath10k: store txq in skb_cb
  ath10k: keep track of queue depth per txq
  ath10k: implement push-pull tx

 drivers/net/wireless/ath/ath10k/core.h   |  13 +
 drivers/net/wireless/ath/ath10k/htt.h    |  21 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c | 302 +++++++++++++++-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 257 ++++++++++----
 drivers/net/wireless/ath/ath10k/mac.c    | 581 +++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/mac.h    |   6 +
 drivers/net/wireless/ath/ath10k/txrx.c   |  11 +-
 7 files changed, 1060 insertions(+), 131 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
