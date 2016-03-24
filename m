Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj6Am-0000s6-9b
 for ath10k@lists.infradead.org; Thu, 24 Mar 2016 14:23:41 +0000
Subject: [PATCH 0/4] ath10k: fix recent checkpatch warnings
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 24 Mar 2016 16:23:07 +0200
Message-ID: <20160324142217.15808.22638.stgit@potku.adurom.net>
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

I updated checkpatch and noticed that there are few new warnings.

---

Kalle Valo (4):
      ath10k: fix checkpatch warnings related to spaces
      ath10k: prefer kernel type 'u64' over 'u_int64_t'
      ath10k: prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
      ath10k: prefer ether_addr_copy() over memcpy()


 drivers/net/wireless/ath/ath10k/ce.c        |    6 +++---
 drivers/net/wireless/ath/ath10k/ce.h        |    2 +-
 drivers/net/wireless/ath/ath10k/core.h      |    6 +++---
 drivers/net/wireless/ath/ath10k/debug.h     |    2 +-
 drivers/net/wireless/ath/ath10k/htc.h       |    4 ++--
 drivers/net/wireless/ath/ath10k/htt.c       |    2 +-
 drivers/net/wireless/ath/ath10k/htt.h       |    4 ++--
 drivers/net/wireless/ath/ath10k/mac.c       |   12 ++++++------
 drivers/net/wireless/ath/ath10k/targaddrs.h |    2 +-
 drivers/net/wireless/ath/ath10k/thermal.h   |    2 +-
 drivers/net/wireless/ath/ath10k/txrx.c      |    4 ++--
 drivers/net/wireless/ath/ath10k/wmi-tlv.h   |    4 ++--
 drivers/net/wireless/ath/ath10k/wmi.c       |    7 +++----
 drivers/net/wireless/ath/ath10k/wmi.h       |   18 +++++++++---------
 14 files changed, 37 insertions(+), 38 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
