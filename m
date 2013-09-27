Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXyn-0003Hg-4X
 for ath10k@lists.infradead.org; Fri, 27 Sep 2013 13:21:10 +0000
Subject: [PATCH v2 0/3] ath10k: implement FW IE support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 27 Sep 2013 16:20:43 +0300
Message-ID: <20130927131812.20789.9941.stgit@localhost6.localdomain6>
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

FW IE format is needed for ath10k automatically detect what features the
firmware image supports. This is important especially with 10.x firmwares which
has a different interface.

Please review.

v2:

* added accidentally dropped board file loading (michal)

* check that ATH10K_FW_IE_FW_IMAGE is available, fail otherwise

---

Kalle Valo (3):
      ath10k: rename board_data in struct ath10k
      ath10k: store separate pointers for firmware data
      ath10k: implement firmware IE container support


 drivers/net/wireless/ath/ath10k/core.c |  210 +++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/core.h |   12 ++
 drivers/net/wireless/ath/ath10k/hw.h   |   19 +++
 drivers/net/wireless/ath/ath10k/wmi.c  |    3 
 4 files changed, 220 insertions(+), 24 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
