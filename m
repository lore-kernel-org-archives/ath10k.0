Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSPTx-0001EX-7U
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 11:25:25 +0000
Received: by mail-ee0-f54.google.com with SMTP id d49so317334eek.27
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 04:25:03 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: ce fixes
Date: Tue, 25 Mar 2014 12:12:21 +0100
Message-Id: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This addresses memory allocations failures
recently reported by Avery Pennarun.


Michal Kazior (2):
  ath10k: convert pci_alloc_consistent() to dma_alloc_coherent()
  ath10k: split ce initialization and allocation

 drivers/net/wireless/ath/ath10k/ce.c  | 356 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/ce.h  |  15 +-
 drivers/net/wireless/ath/ath10k/pci.c |  88 +++++----
 3 files changed, 264 insertions(+), 195 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
