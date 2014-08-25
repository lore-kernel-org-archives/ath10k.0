Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLrWn-00055p-Dh
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 10:29:33 +0000
Received: by mail-la0-f49.google.com with SMTP id hz20so12625934lab.36
 for <ath10k@lists.infradead.org>; Mon, 25 Aug 2014 03:29:09 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/3] ath10k: ce fixes 2014-08-08
Date: Mon, 25 Aug 2014 12:19:20 +0200
Message-Id: <1408961963-3682-1-git-send-email-michal.kazior@tieto.com>
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

This removes implicit endianess in some places.
I'd love to get rid of it from
ath10k_pci_diag_access* as well but let's fix
ath10k_pci_diag_mem_* first.

Note: This is based on my logging patch and fw
crash dump fix.

v2:
 * rebased
 * some fixes in patch [3/3] (see notes there)


Michal Kazior (3):
  ath10k: move pci init structures
  ath10k: dont duplicate service-pipe mapping
  ath10k: make target endianess more explicit

 drivers/net/wireless/ath/ath10k/pci.c | 408 +++++++++++++++++-----------------
 drivers/net/wireless/ath/ath10k/pci.h |  18 +-
 2 files changed, 209 insertions(+), 217 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
