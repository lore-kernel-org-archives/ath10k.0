Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YajEt-0004OZ-5R
 for ath10k@lists.infradead.org; Wed, 25 Mar 2015 11:12:47 +0000
Subject: [PATCH v2 0/2] ath10k: add ATH10K_FW_IE_HTT_OP_VERSION
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 25 Mar 2015 13:12:13 +0200
Message-ID: <20150325110835.30133.509.stgit@x230>
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
Cc: linux-wireless@vger.kernel.org

My proposal how to solve the differences between HTT interfaces by adding
ATH10K_FW_IE_HTT_OP_VERSION. Based on Rajkumar's "ath10k: fix htt t2h message
conflicts among firmware revisions", I just added the new IE and bumped up the
FW API.

For now only compile tested, I will run proper tests later.

---

Kalle Valo (1):
      ath10k: bump up FW API to 5

Rajkumar Manoharan (1):
      ath10k: add ATH10K_FW_IE_HTT_OP_VERSION


 drivers/net/wireless/ath/ath10k/core.c   |   18 ++++
 drivers/net/wireless/ath/ath10k/htt.c    |   98 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt.h    |  130 ++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/htt_rx.c |   20 +++--
 drivers/net/wireless/ath/ath10k/hw.h     |   22 +++++
 drivers/net/wireless/ath/ath10k/pci.c    |    1 
 6 files changed, 256 insertions(+), 33 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
