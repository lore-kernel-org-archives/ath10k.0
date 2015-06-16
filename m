Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4jBL-00030w-Ot
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 05:13:08 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 00/10] Add QCA99X0 support
Date: Tue, 16 Jun 2015 10:42:12 +0530
Message-ID: <1434431542-14724-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

This patch set adds changes for QCA99X0 chip in pci probe,
Copy Engine init and firmware downloads. Since it is still
work in progress the support for this chip is not yet
advertised in pci device table.

Vasanthakumar Thiagarajan (10):
  ath10k: Add a table to store hw specific values
  ath10k: Add new reg_address/mask to hw register table
  ath10k: Add hw register/values for QCA99X0 chip
  ath10k: Copy Engine related changes for QCA99X0
  ath10k: Make target cpu address to CE address conversion chip specific
  ath10k: Add chip reset sequence for QCA99X0
  ath10k: Extend CE src desc flags for interrupt indication
  ath10k: Fix BMI communication timeout for QCA99X0
  ath10k: Add support for code swap
  ath10k: Add BMI param value to execute otp to hw_param

 drivers/net/wireless/ath/ath10k/Makefile    |   3 +-
 drivers/net/wireless/ath/ath10k/bmi.h       |   2 +-
 drivers/net/wireless/ath/ath10k/ce.c        |   1 +
 drivers/net/wireless/ath/ath10k/ce.h        |  17 ++-
 drivers/net/wireless/ath/ath10k/core.c      |  52 ++++++-
 drivers/net/wireless/ath/ath10k/core.h      |   9 ++
 drivers/net/wireless/ath/ath10k/hw.c        |  86 +++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h        |  61 ++++++--
 drivers/net/wireless/ath/ath10k/pci.c       | 180 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/pci.h       |  12 --
 drivers/net/wireless/ath/ath10k/swap.c      | 208 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/swap.h      |  72 ++++++++++
 drivers/net/wireless/ath/ath10k/targaddrs.h |   3 +
 13 files changed, 659 insertions(+), 47 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/swap.c
 create mode 100644 drivers/net/wireless/ath/ath10k/swap.h

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
