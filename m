Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAu4v-0006n8-TC
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 09:49:58 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 0/3] Add support for suspend/resume and WOW for WCN3990
 chipset
Date: Fri, 12 Oct 2018 15:19:35 +0530
Message-Id: <20181012094938.14734-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

This series adds support for driver suspend/resume and wake over wlan support
for WCN3990 chipset. CE2 is configured as wakeup source before driver suspend
and FW can wake up application processor on Magic packet/Deauth/AP lost.

change since v1:
  Log enhancement in "ath10k: Enable bus layer suspend/resume for WCN3990" patch.

Govind Singh (3):
  ath10k: Enable bus layer suspend/resume for WCN3990
  ath10k: Disable interface pause wow config for integrated chipset
  ath10k: Request credit report if flow control enabled on ep

 drivers/net/wireless/ath/ath10k/htc.c     |  3 +-
 drivers/net/wireless/ath/ath10k/snoc.c    | 45 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  2 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  7 ++++
 4 files changed, 56 insertions(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
