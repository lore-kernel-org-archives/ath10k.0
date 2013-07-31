Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4SC6-0007fM-L6
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:55:45 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: fixes
Date: Wed, 31 Jul 2013 10:55:10 +0200
Message-ID: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
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

This is a batch up of a few fixes for ath10k
driver I had in my queue for some time now.


Michal Kazior (5):
  ath10k: prevent using invalid ringbuffer indexes
  ath10k: make sure to use passive scan when n_ssids is 0
  ath10k: advertise more conservative intf combinations
  ath10k: zero arvif memory on add_interface()
  ath10k: fix failpath in MSI-X setup

 drivers/net/wireless/ath/ath10k/ce.c  |    5 +++++
 drivers/net/wireless/ath/ath10k/mac.c |   16 +++++++++++++---
 drivers/net/wireless/ath/ath10k/pci.c |    7 ++++++-
 3 files changed, 24 insertions(+), 4 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
