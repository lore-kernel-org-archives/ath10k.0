Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1astbq-0005o5-5H
 for ath10k@lists.infradead.org; Wed, 20 Apr 2016 15:00:07 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 0/4] Add support for QCA9984
Date: Wed, 20 Apr 2016 20:29:12 +0530
Message-ID: <1461164356-9158-1-git-send-email-vthiagar@qti.qualcomm.com>
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

This patch set adds QCA9984/QCA9994 1.0 support. Boot sequence is same as
QCA99X0.

Vasanthakumar Thiagarajan (4):
  ath10k: Move rx_location_info out of struct rx_pkt_end
  ath10k: Clean up growing hw checks during safe and full reset
  ath10k: Define rx_ppdu_end for QCA9984
  ath10k: Enable support for QCA9984

 drivers/net/wireless/ath/ath10k/core.c    | 23 ++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h      | 11 ++++++
 drivers/net/wireless/ath/ath10k/pci.c     | 58 ++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/pci.h     |  6 ++++
 drivers/net/wireless/ath/ath10k/rx_desc.h | 48 ++++++++++++++++++++++++-
 5 files changed, 129 insertions(+), 17 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
