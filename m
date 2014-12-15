Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0NxY-0003J2-32
 for ath10k@lists.infradead.org; Mon, 15 Dec 2014 05:12:40 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 0/5] ath10k: Add thermal mitigation support
Date: Mon, 15 Dec 2014 10:41:09 +0530
Message-ID: <1418620274-3081-1-git-send-email-rmanohar@qti.qualcomm.com>
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

The following patches add thermal sensor and thermal cooling device
support in ath10k. For sensor, hwmon interface is used. For controlling
temperature cooling device interface is used. For thermal mitigation,
tx throttling is done using hw MAC quiet time setting.

WMI support for reading temperature is available from 10.2.4 firmware
onwards. The firmware can be downloaded from

https://github.com/kvalo/ath10k-firmware/tree/master/10.2.4/untested

Rajkumar Manoharan (5):
  ath10k: add 10.2.4 firmware support
  ath10k: add wmi support for pdev_set_quiet_mode
  ath10k: add thermal cooling device support
  ath10k: add wmi interface for pdev_get_temperature
  ath10k: add thermal sensor device support

 drivers/net/wireless/ath/ath10k/Makefile  |   1 +
 drivers/net/wireless/ath/ath10k/core.c    |  20 ++-
 drivers/net/wireless/ath/ath10k/core.h    |   8 +
 drivers/net/wireless/ath/ath10k/hw.h      |   1 +
 drivers/net/wireless/ath/ath10k/thermal.c | 238 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/thermal.h |  58 ++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  39 +++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |   3 +
 drivers/net/wireless/ath/ath10k/wmi.c     |  62 ++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  20 ++-
 10 files changed, 448 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/thermal.c
 create mode 100644 drivers/net/wireless/ath/ath10k/thermal.h

-- 
2.1.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
