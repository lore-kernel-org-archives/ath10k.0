Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7ggN-00017g-Sd
 for ath10k@lists.infradead.org; Sun, 15 Apr 2018 12:23:01 +0000
Received: by mail-lf0-x243.google.com with SMTP id i18-v6so3215612lfc.7
 for <ath10k@lists.infradead.org>; Sun, 15 Apr 2018 05:22:49 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 0/2] ath10k: HTT ops wrappers
Date: Sun, 15 Apr 2018 14:22:26 +0200
Message-Id: <20180415122228.12565-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

These two patches were included in the High latency v4 RFC
submitted a few months ago.

I think it would be appropriate to add them separately since
they are not really related to the HL patches.

This will make the next HL patch set somewhat smaller.

Erik Stromdahl (2):
  ath10k: add inlined wrappers for htt tx ops
  ath10k: add inlined wrappers for htt rx ops

 drivers/net/wireless/ath/ath10k/htt.c    |  4 +-
 drivers/net/wireless/ath/ath10k/htt.h    | 88 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 14 ++--
 drivers/net/wireless/ath/ath10k/htt_tx.c | 12 ++--
 drivers/net/wireless/ath/ath10k/mac.c    |  2 +-
 5 files changed, 104 insertions(+), 16 deletions(-)

-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
