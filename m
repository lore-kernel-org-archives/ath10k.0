Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOVKw-0000Ha-Nr
 for ath10k@lists.infradead.org; Wed, 27 Jan 2016 19:01:03 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 0/4] ath10k: rename mesh and add abstraction layer
Date: Wed, 27 Jan 2016 10:55:53 -0800
Message-ID: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
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

Split Mesh service to 11s Mesh and non-11s Mesh according to
firmware service bit to help users distinguish 11s Mesh from
non 11s Mesh.
And add abstraction layer for vdev subtype to solve subtype mismatch
and to give flexible compatibility among different firmware revisions.

Peter Oh (4):
  ath10k: rename Mesh related service names
  ath10k: update 10.4 WMI service map
  ath10k: use vif->type and vif->p2p for P2P_GO check
  ath10k: add abstraction layer for vdev subtype

 drivers/net/wireless/ath/ath10k/mac.c     | 25 +++++------
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 11 +++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 72 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h     | 69 +++++++++++++++++++++++------
 5 files changed, 153 insertions(+), 25 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
