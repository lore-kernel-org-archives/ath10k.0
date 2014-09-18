Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUbsf-0004GG-Ta
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 13:36:18 +0000
Received: by mail-we0-f169.google.com with SMTP id w61so934840wes.14
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 06:35:55 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: debug improvements
Date: Thu, 18 Sep 2014 15:25:18 +0200
Message-Id: <1411046721-20510-1-git-send-email-michal.kazior@tieto.com>
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

This adds extra prints and information for
debugging purposes.


Michal Kazior (3):
  ath10k: print wmi version info
  ath10k: dump hex bytes with dev string prefix
  ath10k: add debug dump for pci rx

 drivers/net/wireless/ath/ath10k/debug.c | 29 ++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/pci.c   |  6 ++++++
 2 files changed, 32 insertions(+), 3 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
