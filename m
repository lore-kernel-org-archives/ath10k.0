Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1Zyvmc-0000XS-Mk
 for ath10k@lists.infradead.org; Wed, 18 Nov 2015 05:59:55 +0000
Received: by lbblt2 with SMTP id lt2so18429743lbb.3
 for <ath10k@lists.infradead.org>; Tue, 17 Nov 2015 21:59:29 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 0/9] ath10k: clean up ath10k_skb_cb
Date: Wed, 18 Nov 2015 06:59:14 +0100
Message-Id: <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
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


v3:
 * rebase

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
 drivers/net/wireless/ath/ath10k/htt_tx.c | 116 +++++++++++++++++++-----------
 drivers/net/wireless/ath/ath10k/mac.c    | 117 ++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/txrx.c   |  15 ++--
 drivers/net/wireless/ath/ath10k/wmi.c    |  22 ++++--
 6 files changed, 173 insertions(+), 129 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
