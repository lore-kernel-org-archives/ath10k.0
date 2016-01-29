Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aP6sC-0002Wa-72
 for ath10k@lists.infradead.org; Fri, 29 Jan 2016 11:05:52 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 0/2] add hw param and wmi changes for qca4019
Date: Fri, 29 Jan 2016 16:35:10 +0530
Message-ID: <1454065512-8238-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

This patch series includes hw param and wmi changes needed for qca4019.

Raja Mani (2):
  ath10k: add qca4019 hw params
  ath10k: populate qca4019 fw specific wmi init params

 drivers/net/wireless/ath/ath10k/core.c      | 34 +++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/core.h      |  6 +++++
 drivers/net/wireless/ath/ath10k/hw.h        | 14 +++++++-----
 drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
 drivers/net/wireless/ath/ath10k/wmi.c       | 12 +++++-----
 drivers/net/wireless/ath/ath10k/wmi.h       |  1 -
 6 files changed, 55 insertions(+), 15 deletions(-)

-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
