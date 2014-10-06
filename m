Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb8IJ-0002A8-5W
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 13:25:43 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 0/4] ath10k: Add tracing for tx and rx frames
Date: Mon, 6 Oct 2014 18:57:00 +0530
Message-ID: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

These changes are the extension of pktlog for dumping tx and rx
frames to user space. I am rebasing Michal's work on top of pktlog.

-Rajkumar

Michal Kazior (3):
  ath10k: add tracepoint for wmi mgmt tx frames
  ath10k: add tracepoint for wmi bcn tx
  ath10k: add htt rx tracepoints

Rajkumar Manoharan (1):
  ath10k: add tracepoint for htt tx frames

 drivers/net/wireless/ath/ath10k/htt_rx.c |  3 +
 drivers/net/wireless/ath/ath10k/htt_tx.c |  3 +-
 drivers/net/wireless/ath/ath10k/trace.h  | 94 ++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.c    |  2 +
 4 files changed, 97 insertions(+), 5 deletions(-)

-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
