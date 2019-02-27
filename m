Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gytOw-0005k1-9w
 for ath10k@lists.infradead.org; Wed, 27 Feb 2019 07:13:11 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 0/2] Add support for per peer HTT tx stats for WCN3990 
Date: Wed, 27 Feb 2019 12:42:59 +0530
Message-Id: <1551251581-21193-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

WCN3990 firmware sends the HTT_TLV_T2H_MSG_TYPE_PEER_STATS in tlv
format so the handling of this message has to be done in different
manner.

This patchset adds support to attach rx_ops based on htt version
and adds the handling of HTT_TLV_T2H_MSG_TYPE_PEER_STATS message
based on HTT version.

Surabhi Vishnoi (2):
  ath10k: Add support for adding htt_rx_ops based on htt_version
  ath10k: Add support for per peer HTT tx stats for WCN3990

 drivers/net/wireless/ath/ath10k/htt.c     |   2 +
 drivers/net/wireless/ath/ath10k/htt.h     |  67 +++++++++++-
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 165 ++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/hw.c      |  45 +++++++-
 drivers/net/wireless/ath/ath10k/hw.h      |  34 ++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |   3 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  33 ++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |   3 -
 8 files changed, 340 insertions(+), 12 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
