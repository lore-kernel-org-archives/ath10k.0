Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtFij-0005B8-IN
 for ath10k@lists.infradead.org; Mon, 02 Nov 2015 14:04:27 +0000
Received: by lffz202 with SMTP id z202so62208875lff.3
 for <ath10k@lists.infradead.org>; Mon, 02 Nov 2015 06:04:01 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/8] ath10k: clean up ath10k_skb_cb
Date: Mon,  2 Nov 2015 15:03:00 +0100
Message-Id: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
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

The ath10k_skb_cb structure wasn't really space
efficient. Some stuff is removed or replaced with
more compact representation.

This cleanup is necessary for future features.

The size of ath10k_skb_cb:

          before   after
 x86-32   26       12
 x86-64   34       20


Michal Kazior (8):
  ath10k: merge is_protected with nohwcrypt
  ath10k: rename function to adhere to naming convention
  ath10k: remove txmode from skb_cb
  ath10k: remove is_offchan
  ath10k: remove freq from skb_cb
  ath10k: pack up flags in skb_cb
  ath10k: replace vdev_id and tid in skb cb
  ath10k: store msdu_id instead of txbuf pointers

 drivers/net/wireless/ath/ath10k/core.h   |  27 +++----
 drivers/net/wireless/ath/ath10k/htt.h    |   3 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 111 ++++++++++++++++++-----------
 drivers/net/wireless/ath/ath10k/mac.c    | 116 +++++++++++++++----------------
 drivers/net/wireless/ath/ath10k/mac.h    |   1 +
 drivers/net/wireless/ath/ath10k/txrx.c   |   7 +-
 drivers/net/wireless/ath/ath10k/wmi.c    |  22 ++++--
 7 files changed, 165 insertions(+), 122 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
