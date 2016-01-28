Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOuZ6-0002AD-Sr
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 21:57:35 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2 0/4] ath10k: rename mesh and add abstraction layer
Date: Thu, 28 Jan 2016 13:54:06 -0800
Message-ID: <cover.1454015989.git.poh@qca.qualcomm.com>
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

v2:
 * Rebased. No code changes.

Peter Oh (4):
  ath10k: rename Mesh related service names
  ath10k: update 10.4 WMI service map
  ath10k: use vif->type and vif->p2p for P2P_GO check
  ath10k: add abstraction layer for vdev subtype

 drivers/net/wireless/ath/ath10k/mac.c     | 25 +++++------
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 11 +++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 72 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h     | 67 ++++++++++++++++++++++------
 5 files changed, 151 insertions(+), 25 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
