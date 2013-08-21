Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC2Md-0000jI-KJ
 for ath10k@lists.infradead.org; Wed, 21 Aug 2013 06:57:56 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/6] ath10k: CE cleanups
Date: Wed, 21 Aug 2013 08:57:23 +0200
Message-ID: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This patchset contains non-functional changes
except patch #1 which changes memory allocation
from dynamic to static.

There is still some more to clean up in PCI/CE
but it's probably better to keep patchsets compact
and more frequent.


Pozdrawiam / Best regards,
Michal Kazior.


Michal Kazior (6):
  ath10k: use inline ce_state structure
  ath10k: remove ce_op_state
  ath10k: remove unused ce_attr parameters
  ath10k: rename hif_ce_pipe_info to ath10k_pci_pipe
  ath10k: rename ce_state to ath10k_ce_pipe
  ath10k: rename ce_ring_state to ath10k_ce_ring

 drivers/net/wireless/ath/ath10k/ce.c  |  107 +++++++++++++++------------------
 drivers/net/wireless/ath/ath10k/ce.h  |   56 ++++++-----------
 drivers/net/wireless/ath/ath10k/pci.c |   78 ++++++++++++------------
 drivers/net/wireless/ath/ath10k/pci.h |   17 +++---
 4 files changed, 116 insertions(+), 142 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
