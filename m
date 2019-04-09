Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDwBB-0001kk-Ia
 for ath10k@lists.infradead.org; Tue, 09 Apr 2019 19:13:10 +0000
Received: by mail-lj1-x241.google.com with SMTP id f23so15549920ljc.0
 for <ath10k@lists.infradead.org>; Tue, 09 Apr 2019 12:13:08 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 0/6] ath10k: SDIO and high latency patches from Silex
Date: Tue,  9 Apr 2019 21:08:45 +0200
Message-Id: <20190409190851.4557-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This series adds a few more fixes for SDIO and high latency devices.

I have had these on my private tree for quite some time now so they
should be considered fairly well tested.

4 out of 6 patches are from Alagu Sankar at Silex.
I have made some adjustments to some of them in order to make them
smaller and easier to review.

Alagu Sankar (4):
  ath10k: use clean packet headers
  ath10k: high latency fixes for beacon buffer
  ath10k: sdio: read RX packets in bundles
  ath10k: sdio: add MSDU ID allocation in HTT TX path

Erik Stromdahl (2):
  ath10k: sdio: add missing error check
  ath10k: sdio: replace skb_trim with explicit set of skb->len

 drivers/net/wireless/ath/ath10k/htc.c    |  1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c |  4 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 16 ++++-
 drivers/net/wireless/ath/ath10k/hw.c     |  2 +
 drivers/net/wireless/ath/ath10k/mac.c    | 31 +++++++---
 drivers/net/wireless/ath/ath10k/sdio.c   | 78 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/sdio.h   |  2 +
 7 files changed, 109 insertions(+), 25 deletions(-)

-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
