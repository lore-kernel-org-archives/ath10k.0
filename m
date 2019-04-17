Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGfz6-00087g-Dj
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 08:32:01 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 0/3] Add support for MESH 11S for WCN3990
Date: Wed, 17 Apr 2019 14:01:44 +0530
Message-Id: <1555489907-30117-1-git-send-email-svishnoi@codeaurora.org>
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

Currently, mesh 11s is not supported for WCN3990.
This patchset add the changes to enable the mesh for WCN3990.

Surabhi Vishnoi (3):
  ath10k: Add wmi tlv vdev subtype for mesh in WCN3990
  ath10k: Do not send probe response template for mesh
  ath10k: Add wmi tlv service map for mesh 11s

 drivers/net/wireless/ath/ath10k/mac.c     |  4 ++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 24 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 12 ++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
