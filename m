Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zw8jn-0008NY-Cb
 for ath10k@lists.infradead.org; Tue, 10 Nov 2015 13:13:29 +0000
Received: by lbces9 with SMTP id es9so49794727lbc.2
 for <ath10k@lists.infradead.org>; Tue, 10 Nov 2015 05:13:01 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/9] ath10k: clean up ath10k_skb_cb
Date: Tue, 10 Nov 2015 14:10:46 +0100
Message-Id: <1447161055-2283-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
References: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
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


v2:
 * fix a bug (patch 7/9 introduced)


Michal Kazior (9):
  ath10k: merge is_protected with nohwcrypt
  ath10k: rename function to adhere to naming convention
  ath10k: remove txmode from skb_cb
  ath10k: remove is_offchan
  ath10k: remove freq from skb_cb
  ath10k: pack up flags in skb_cb
  ath10k: fix tx header parsing
  ath10k: replace vdev_id and tid in skb cb
  ath10k: store msdu_id instead of txbuf pointers

 drivers/net/wireless/ath/ath10k/core.h   |  28 +++-----
 drivers/net/wireless/ath/ath10k/htt.h    |   4 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 112 ++++++++++++++++++-----------
 drivers/net/wireless/ath/ath10k/mac.c    | 119 ++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/mac.h    |   1 +
 drivers/net/wireless/ath/ath10k/txrx.c   |  15 ++--
 drivers/net/wireless/ath/ath10k/wmi.c    |  22 ++++--
 7 files changed, 173 insertions(+), 128 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
