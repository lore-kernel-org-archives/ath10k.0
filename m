Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW8UE-0007Rf-H5
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 17:32:51 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so9410141pad.14
 for <ath10k@lists.infradead.org>; Tue, 15 Oct 2013 10:32:26 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/7] ath10k: fixes 2013-10-15
Date: Tue, 15 Oct 2013 10:29:49 -0700
Message-Id: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
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

This is a bunch of fixes I've had queued up for
some time now. I was reluctant to send them
without some additional checks and because some of
the fixes are not ideal. At least we can get a
discussion going if anything raises any serious
concern.


Michal Kazior (7):
  ath10k: prevent starting monitor without a vdev
  ath10k: add sanity checks for monitor management
  ath10k: fix endianess in prints
  ath10k: fix NSS reporting in RX
  ath10k: fix NULL deref upon early FW crash
  ath10k: fix device initialization routine
  ath10k: fix FW crashes on heavy TX on 10.1.389 AP FW

 drivers/net/wireless/ath/ath10k/ce.c     |  11 +++
 drivers/net/wireless/ath/ath10k/core.c   |   3 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  11 +--
 drivers/net/wireless/ath/ath10k/hw.h     |   7 ++
 drivers/net/wireless/ath/ath10k/mac.c    |  24 +++++-
 drivers/net/wireless/ath/ath10k/pci.c    | 130 +++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/txrx.c   |   2 +-
 drivers/net/wireless/ath/ath10k/wmi.c    |  16 ++--
 8 files changed, 134 insertions(+), 70 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
