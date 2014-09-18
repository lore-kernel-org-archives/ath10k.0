Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUbp1-0001y1-IB
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 13:32:32 +0000
Received: by mail-wi0-f179.google.com with SMTP id cc10so1039926wib.6
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 06:32:07 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/9] ath10k: mostly cleanups
Date: Thu, 18 Sep 2014 15:21:18 +0200
Message-Id: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
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

Here's a bunch of clean up patches for WMI and a
single fix. I'm including the fix in this patchset
because one of the clean up patches depends on it.


Michal Kazior (9):
  ath10k: fix tx/rx chainmask init
  ath10k: remove unused pdev_set_channel command
  ath10k: deduplicate wmi_channel code
  ath10k: deduplicate host mem chunk code
  ath10k: relocate wmi attach/deatch functions
  ath10k: deduplicate wmi service ready logic
  ath10k: clean up phyerr code
  ath10k: unify wmi event function names
  ath10k: re-work scan start command building

 drivers/net/wireless/ath/ath10k/core.h     |   4 +-
 drivers/net/wireless/ath/ath10k/debug.c    |   2 +-
 drivers/net/wireless/ath/ath10k/debug.h    |   4 +-
 drivers/net/wireless/ath/ath10k/mac.c      |  10 +-
 drivers/net/wireless/ath/ath10k/spectral.c |  34 +-
 drivers/net/wireless/ath/ath10k/spectral.h |   8 +-
 drivers/net/wireless/ath/ath10k/wmi.c      | 823 +++++++++++++----------------
 drivers/net/wireless/ath/ath10k/wmi.h      | 244 ++-------
 8 files changed, 445 insertions(+), 684 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
