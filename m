Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZfE5-0007P8-Ol
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 12:11:18 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 0/4] ath10k: Add pktlog support
Date: Thu, 2 Oct 2014 17:42:10 +0530
Message-ID: <1412251934-7011-1-git-send-email-rmanohar@qti.qualcomm.com>
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

This implements the Packet log feature for ath10k.
All tx and rx events and rx descriptor details are
posted to user space by tracepoints.

Rajkumar Manoharan (4):
  ath10k: Add support to configure pktlog filter
  ath10k: add tracing for ath10k_htt_pktlog
  ath10k: add tracing for rx descriptor
  ath10k: add tracing for tx msdu pktlog event

 drivers/net/wireless/ath/ath10k/core.h   |  2 +
 drivers/net/wireless/ath/ath10k/debug.c  | 80 +++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/debug.h  | 15 +++++-
 drivers/net/wireless/ath/ath10k/htt.h    |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c | 47 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h     | 35 +++++++++++++
 drivers/net/wireless/ath/ath10k/trace.h  | 89 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c    | 33 ++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h    |  6 +++
 9 files changed, 306 insertions(+), 3 deletions(-)

-- 
2.1.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
