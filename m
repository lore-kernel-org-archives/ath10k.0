Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z72uR-0004SB-Dq
 for ath10k@lists.infradead.org; Mon, 22 Jun 2015 14:41:17 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH v2 00/10] introduce wmi support for qca99X0
Date: Mon, 22 Jun 2015 20:10:08 +0530
Message-ID: <1434984018-24057-1-git-send-email-rmani@qti.qualcomm.com>
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

v2 changes:
   - Synced wmi service/cmd/event/pdev/vdev ids to most
     stable 10.4 firmware.

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
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  90 +++
 drivers/net/wireless/ath/ath10k/wmi.c     | 879 +++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h     | 859 ++++++++++++++++++++++++++++-
 7 files changed, 1896 insertions(+), 6 deletions(-)

-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
