Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7LMi-0001nn-Nb
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 08:14:37 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/4] ath10k: cleanups
Date: Thu, 8 Aug 2013 10:14:06 +0200
Message-ID: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
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

This patchset contains a few non-functional clean
ups.

Michal Kazior (4):
  ath10k: clean up monitor start code
  ath10k: use sizeof(*var) in kmalloc
  ath10k: clean up PCI completion states
  ath10k: print errcode when CE ring setup fails

 drivers/net/wireless/ath/ath10k/ce.c  |   15 +++++++++------
 drivers/net/wireless/ath/ath10k/mac.c |    3 ---
 drivers/net/wireless/ath/ath10k/pci.c |   24 ++++++++++++++++--------
 drivers/net/wireless/ath/ath10k/pci.h |   13 +++++++------
 4 files changed, 32 insertions(+), 23 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
