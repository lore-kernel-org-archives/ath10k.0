Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPZ9t-0006mE-09
 for ath10k@lists.infradead.org; Fri, 27 Sep 2013 14:36:42 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: fixes
Date: Fri, 27 Sep 2013 16:36:05 +0200
Message-ID: <1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
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

One throughput fix and one bug fix.

The bug fix addresses my oversight when reworking
HTC/WMI. I haven't seen the error yet but I'm
quite certain this should be fixed.


Michal Kazior (1):
  ath10k: fix scheduling while atomic bug

Sujith Manoharan (1):
  ath10k: Fix bug in max. VHT A-MPDU size

 drivers/net/wireless/ath/ath10k/core.h |    4 ++-
 drivers/net/wireless/ath/ath10k/mac.c  |   60 ++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 19 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
