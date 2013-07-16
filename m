Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyzr6-0003VY-72
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:39:29 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 00/10] ath10k: device setup refactor
Date: Tue, 16 Jul 2013 09:38:49 +0200
Message-ID: <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1371041642-20273-1-git-send-email-michal.kazior@tieto.com>
References: <1371041642-20273-1-git-send-email-michal.kazior@tieto.com>
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

This is a respin of my patchset that addresses
hibernation issues.

This is also groundwork for proper hw recovery
that I'm going to post too.

v4:
 * update comments in pci logic decoupling
 * add missing commit message for one of the patches
 * update commit message for free_vdev_map patch

Michal Kazior (10):
  ath10k: decouple pci start/stop logic
  ath10k: decouple core start/stop logic
  ath10k: allow deferred regd update
  ath10k: reset BMI state upon init
  ath10k: decouple suspend code
  ath10k: move free_vdev_map initialization
  ath10k: make sure all resources are freed upon ath10k_stop()
  ath10k: defer hw setup to start/stop mac80211 hooks
  ath10k: store firmware files in memory
  ath10k: skip fw stats debugfs interface if device is down

 drivers/net/wireless/ath/ath10k/bmi.c   |    6 +
 drivers/net/wireless/ath/ath10k/bmi.h   |    1 +
 drivers/net/wireless/ath/ath10k/core.c  |  249 +++++++++++++++++----------
 drivers/net/wireless/ath/ath10k/core.h  |   16 +-
 drivers/net/wireless/ath/ath10k/debug.c |   30 ++--
 drivers/net/wireless/ath/ath10k/hif.h   |   39 +++++
 drivers/net/wireless/ath/ath10k/mac.c   |  151 ++++++++++++++++-
 drivers/net/wireless/ath/ath10k/pci.c   |  283 +++++++++++++------------------
 8 files changed, 497 insertions(+), 278 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
