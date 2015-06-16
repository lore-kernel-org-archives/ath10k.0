Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4jhx-0000H7-SY
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 05:46:50 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 00/10] introduce wmi support for qca99X0
Date: Tue, 16 Jun 2015 11:15:13 +0530
Message-ID: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
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

qca99X0 uses 10.4 firmware. This patch series adds 10.4 firmware
specific WMI cmds/events/parsing logic. All these patches tested
on top of qca99X0 initial bring up patches.

Raja Mani (10):
  ath10k: include new wmi op version for 10.4 fw
  ath10k: add 10.4 fw wmi service bitmap definition
  ath10k: include 10.4 fw specific wmi cmd and event ids
  ath10k: set 10.4 fw exclusive wmi cmd as unsupported for other fw
    versions
  ath10k: add 10.4 fw wmi vdev cmd ids
  ath10k: add 10.4 fw wmi pdev cmd ids
  ath10k: fill 10.4 fw wmi init cmd default values
  ath10k: handle 10.4 fw wmi mgmt rx event
  ath10k: adjust default peer limits if qcache enabled in 10.4 fw
  ath10k: handle 10.4 fw wmi ready event

 drivers/net/wireless/ath/ath10k/core.c    |   9 +
 drivers/net/wireless/ath/ath10k/core.h    |   2 +
 drivers/net/wireless/ath/ath10k/hw.h      |  61 +++
 drivers/net/wireless/ath/ath10k/mac.c     |   2 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  47 ++
 drivers/net/wireless/ath/ath10k/wmi.c     | 793 +++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h     | 792 ++++++++++++++++++++++++++++-
 7 files changed, 1700 insertions(+), 6 deletions(-)

-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
