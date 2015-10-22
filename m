Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpHXV-0003PU-Dk
 for ath10k@lists.infradead.org; Thu, 22 Oct 2015 15:12:25 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 0/4] ath10k: remove shadow copy engine descriptors
Date: Thu, 22 Oct 2015 20:36:38 +0530
Message-ID: <1445526402-28522-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Below series remove shadow copy of CE descriptors for source ring.
Removing the shadow copy should reduce d-cache pressure and memory
usage of the driver.

Rajkumar Manoharan (4):
  ath10k: use local memory instead of shadow descriptor in ce_send
  ath10k: remove send completion validation in diag read/write
  ath10k: cleanup copy engine send completion
  ath10k: remove shadow copy of CE descriptors for source ring

 drivers/net/wireless/ath/ath10k/ce.c  | 57 +++++------------------------------
 drivers/net/wireless/ath/ath10k/ce.h  | 16 ++--------
 drivers/net/wireless/ath/ath10k/pci.c | 53 +++++---------------------------
 3 files changed, 17 insertions(+), 109 deletions(-)

-- 
2.6.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
