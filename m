Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XswiO-0007in-Pn
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 16:42:17 +0000
Subject: [PATCH v2 0/2] ath10k: firmware memory debugfs interface
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 24 Nov 2014 18:41:38 +0200
Message-ID: <20141124164037.29422.14033.stgit@potku.adurom.net>
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

Hi,

this is v2 of Yanbo's firmware memory debugfs interface.

Changelog:

v2:

* split patches into two

* simplify the commit logs

* remove extra #include "hif.h" from debug.c

---

Yanbo Li (2):
      ath10k: add register access debugfs interface
      ath10k: add memory dump debugfs interface


 drivers/net/wireless/ath/ath10k/core.h  |    2 
 drivers/net/wireless/ath/ath10k/debug.c |  188 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hif.h   |   37 ++++++
 drivers/net/wireless/ath/ath10k/pci.c   |    3 
 4 files changed, 230 insertions(+)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
