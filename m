Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWLXs-0000Qf-6M
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 08:34:00 +0000
Received: by mail-wg0-f43.google.com with SMTP id y10so4202100wgg.26
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 01:33:37 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/3] ath10k: debug improvements
Date: Tue, 23 Sep 2014 10:22:51 +0200
Message-Id: <1411460574-5424-1-git-send-email-michal.kazior@tieto.com>
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


v2:
 * merge scnprintfs

Michal Kazior (3):
  ath10k: print wmi version info
  ath10k: dump hex bytes with dev string prefix
  ath10k: add debug dump for pci rx

 drivers/net/wireless/ath/ath10k/debug.c | 25 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/pci.c   |  6 ++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
