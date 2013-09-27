Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPbJw-00033p-6e
 for ath10k@lists.infradead.org; Fri, 27 Sep 2013 16:55:13 +0000
Subject: [PATCH v3 0/3] ath10k: implement FW IE support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 27 Sep 2013 19:54:48 +0300
Message-ID: <20130927164636.2570.24076.stgit@localhost6.localdomain6>
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

v3:

* resend with changes really listed in v2

---

Kalle Valo (3):
      ath10k: rename board_data in struct ath10k
      ath10k: store separate pointers for firmware data
      ath10k: implement firmware IE container support


 drivers/net/wireless/ath/ath10k/core.c |  241 +++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/core.h |   12 +-
 drivers/net/wireless/ath/ath10k/hw.h   |   19 +++
 drivers/net/wireless/ath/ath10k/wmi.c  |    3 
 4 files changed, 251 insertions(+), 24 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
