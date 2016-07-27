Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSO5Z-0002VS-Pq
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 12:37:30 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 0/4] ath10k: Padding related clean ups in rx
Date: Wed, 27 Jul 2016 18:06:42 +0530
Message-ID: <1469623006-13178-1-git-send-email-vthiagar@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

This patch set adds abstraction for rx_hw_desc processing so that
we can make use of newer desc fields notifying padding information
which is done on rx payload. "ath10k: Properly remove padding from
the start of rx payload" fixes padding related bug in ethernet decap
mode for QCA99X0, QCA9984 qnd QCA4019 but even fixing this bug will
not make ethernet decap mode work, there needs to be some more fix
wich would follow this patch series.

Vasanthakumar Thiagarajan (4):
  ath10k: Move ath10k_hw_params definition to hw.h
  ath10k: Add provision for Rx descriptor abstraction
  ath10k: Properly remove padding from the start of rx payload
  ath10k: Remove 4-addr padding related hw_param configuration

 drivers/net/wireless/ath/ath10k/core.c   | 21 ++++++----
 drivers/net/wireless/ath/ath10k/core.h   | 48 +--------------------
 drivers/net/wireless/ath/ath10k/htt_rx.c | 36 +++++++++-------
 drivers/net/wireless/ath/ath10k/hw.c     | 13 ++++++
 drivers/net/wireless/ath/ath10k/hw.h     | 71 +++++++++++++++++++++++++++++---
 5 files changed, 114 insertions(+), 75 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
