Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1kUe-0006i5-QL
 for ath10k@lists.infradead.org; Fri, 30 Mar 2018 03:14:22 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH 0/2] ath10k: support MAC address randomization in scan
Date: Fri, 30 Mar 2018 11:13:58 +0800
Message-Id: <1522379640-6442-1-git-send-email-cjhuang@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

The feature MAC address randomization depends on the firmware
capability, if the firmware indicates WMI_SERVICE_SPOOF_MAC_SUPPORT
service the host driver will report it to upper layer. The service
bit is above the 128 bit limit so a new service check macro is needed.

Carl Huang (2):
  ath10k: Add WMI_SERVICE_AVAILABLE_EVENT support
  ath10k: support MAC address randomization in scan

 drivers/net/wireless/ath/ath10k/mac.c     |  17 ++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  46 ++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  63 ++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 357 +++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.c     |  26 ++-
 drivers/net/wireless/ath/ath10k/wmi.h     |  18 +-
 6 files changed, 520 insertions(+), 7 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
