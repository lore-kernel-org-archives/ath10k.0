Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpa1p-0001T6-Op
 for ath10k@lists.infradead.org; Wed, 28 May 2014 09:20:10 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id DD9C881841
 for <ath10k@lists.infradead.org>; Wed, 28 May 2014 12:19:45 +0300 (EEST)
Subject: [RFC PATCH 0/2] ath10k: testmode support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 28 May 2014 12:19:44 +0300
Message-ID: <20140528091832.8030.93169.stgit@potku.adurom.net>
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

Hi,

here's how I'm thinking we should implement testmode support to ath10k. Please
comment.

---

Kalle Valo (2):
      ath10k: make ath10k_wmi_cmd_send() public
      ath10k: add testmode


 drivers/net/wireless/ath/ath10k/Makefile   |    2 
 drivers/net/wireless/ath/ath10k/core.c     |   66 ++++--
 drivers/net/wireless/ath/ath10k/core.h     |   17 +-
 drivers/net/wireless/ath/ath10k/debug.h    |    1 
 drivers/net/wireless/ath/ath10k/hw.h       |    1 
 drivers/net/wireless/ath/ath10k/mac.c      |   10 +
 drivers/net/wireless/ath/ath10k/testmode.c |  312 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/testmode.h |   45 ++++
 drivers/net/wireless/ath/ath10k/wmi.c      |   11 +
 drivers/net/wireless/ath/ath10k/wmi.h      |    4 
 10 files changed, 446 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
