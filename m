Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUUcM-0006o4-Eb
 for ath10k@lists.infradead.org; Tue, 12 Nov 2019 11:45:55 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH 0/2] ath10k: correct tx bitrate for QCA6174/QCA9377/QCA9888
Date: Tue, 12 Nov 2019 19:45:46 +0800
Message-Id: <1573559148-4844-1-git-send-email-yyuwang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Tx bitrate got by command 'iw wlan0 link' is incorrect.
These 2 patches will fix the issue.

Yu Wang (2):
  ath10k: add ppdu stats support for QCA6174/QCA9377
  ath10k: correct legacy rate in tx stats

 drivers/net/wireless/ath/ath10k/htt.c     |   2 +
 drivers/net/wireless/ath/ath10k/htt.h     |  30 ++++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 113 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath10k/mac.c     |  13 ----
 drivers/net/wireless/ath/ath10k/mac.h     |  11 +++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  15 +++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  42 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |   3 +
 drivers/net/wireless/ath/ath10k/wmi.c     |  46 ++++++++++++
 9 files changed, 232 insertions(+), 43 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
