Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRILy-0001JW-Lo
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 09:04:20 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/4] ath10k: clean ups
Date: Wed, 2 Oct 2013 11:03:37 +0200
Message-ID: <1380704621-4670-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380292706-3609-1-git-send-email-michal.kazior@tieto.com>
References: <1380292706-3609-1-git-send-email-michal.kazior@tieto.com>
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

First two patches are non-functional changes.

The latter two should remove some overhead from TX
path and CE processing. Nothing extraordinary.


PATCH v2:
 * add commit messages for patch #1 and #2 (Kalle)


Michal Kazior (4):
  ath10k: split tid calculation from tx function
  ath10k: split vdev_id calculation from tx function
  ath10k: remove ce_sendlist_send
  ath10k: remove num_sends_allowed

 drivers/net/wireless/ath/ath10k/ce.c  |   35 ++++++------------------
 drivers/net/wireless/ath/ath10k/ce.h  |   16 +----------
 drivers/net/wireless/ath/ath10k/mac.c |   48 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/pci.c |   25 +++--------------
 drivers/net/wireless/ath/ath10k/pci.h |    3 ---
 5 files changed, 42 insertions(+), 85 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
