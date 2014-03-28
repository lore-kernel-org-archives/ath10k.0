Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTRPB-0003oB-9R
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 07:40:46 +0000
Received: by mail-ee0-f47.google.com with SMTP id b15so3674053eek.20
 for <ath10k@lists.infradead.org>; Fri, 28 Mar 2014 00:40:21 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/3] ath10k: ce fixes
Date: Fri, 28 Mar 2014 08:34:22 +0100
Message-Id: <1395992065-10086-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
References: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
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


v2:
 * add a new patch (result of splitting)
 * fix commit message


Michal Kazior (3):
  ath10k: convert pci_alloc_consistent() to dma_alloc_coherent()
  ath10k: split ce initialization and allocation
  ath10k: deinit copy engine before resetting

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
