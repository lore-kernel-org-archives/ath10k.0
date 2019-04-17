Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGq1o-0007F7-8W
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 19:15:29 +0000
Received: by mail-lf1-x143.google.com with SMTP id k18so10787976lfj.13
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 12:15:27 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH v2 0/5] ath10k: SDIO and high latency patches from Silex
Date: Wed, 17 Apr 2019 21:14:58 +0200
Message-Id: <20190417191503.18814-1-erik.stromdahl@gmail.com>
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

changes since v1:

Patch "ath10k: use clean packet headers" was renamed to
"ath10k: add initialization of HTC header" and PLL stuff was removed.

Patch "ath10k: sdio: add MSDU ID allocation in HTT TX path"
was removed since it became redundant after I had added Kalle's and
Wen's patches to my tree.

Patch "ath10k: sdio: replace skb_trim with explicit set of skb->len"
was rewritten and renamed to "ath10k: sdio: remove skb_trim in TX path"

Alagu Sankar (3):
  ath10k: add initialization of HTC header
  ath10k: high latency fixes for beacon buffer
  ath10k: sdio: read RX packets in bundles

Erik Stromdahl (2):
  ath10k: sdio: add missing error check
  ath10k: sdio: remove skb_trim in TX path

 drivers/net/wireless/ath/ath10k/htc.c  |   1 +
 drivers/net/wireless/ath/ath10k/mac.c  |  31 ++++++--
 drivers/net/wireless/ath/ath10k/sdio.c | 103 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/sdio.h |   4 +
 4 files changed, 112 insertions(+), 27 deletions(-)

-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
