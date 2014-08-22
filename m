Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKoBi-0003S6-Lw
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 12:43:27 +0000
Received: by mail-la0-f50.google.com with SMTP id pi18so9946022lab.37
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 05:43:04 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/5] ath10k: fixes 2014-08-07, part 3
Date: Fri, 22 Aug 2014 14:33:13 +0200
Message-Id: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
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

This is part 3 (of 3) of my patches. Split for
your reviewing pleasure.

This is related to start/restart sequences.

This is based on:
  [PATCH v2 0/6] ath10k: fixes 2014-08-07, part 2

v2:
 * patch [2/5] replaced
 * fixes, see notes


Michal Kazior (5):
  ath10k: rework posting pci rx buffers
  ath10k: update comment regarding warm reset
  ath10k: ignore ar_pci->started in pipe cleanup
  ath10k: remove ar_pci->started
  ath10k: flush hif buffers before recovery

 drivers/net/wireless/ath/ath10k/ce.c   |  71 +++++----
 drivers/net/wireless/ath/ath10k/ce.h   |  16 +-
 drivers/net/wireless/ath/ath10k/core.c |   1 +
 drivers/net/wireless/ath/ath10k/pci.c  | 259 +++++++++++++++------------------
 drivers/net/wireless/ath/ath10k/pci.h  |   4 +-
 5 files changed, 165 insertions(+), 186 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
