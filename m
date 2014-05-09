Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wik8w-0000wo-1V
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:43:14 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so2708861eei.28
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:42:51 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/7] ath10k: recovery improvements 2014-05-09
Date: Fri,  9 May 2014 14:35:50 +0200
Message-Id: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
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

This depends on my `ath10k: recovery fixes
2014-05-09`.

Hopefully the split makes it a little saner to
review.

Please note: `ath10k: make wmi timeout trigger hw
restart` effectively hides the mgmt tx / htc
credit starvation issue that was discussed
recently. My intention is to make the driver more
robust and as a side effect it makes the
starvation issue less painful. If desired so
the patch can be easily ignored in the series as
nothing depends on it.


Michal Kazior (7):
  ath10k: move restart_work call
  ath10k: introduce core restart symbol
  ath10k: drain wmi quickly upon hw restart
  ath10k: wake up everything on core restart
  ath10k: reduce timeout values
  ath10k: make wmi timeout trigger hw restart
  ath10k: remove old unused defines

 drivers/net/wireless/ath/ath10k/core.c | 27 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/core.h |  7 +++++--
 drivers/net/wireless/ath/ath10k/htt.c  |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  8 +++-----
 drivers/net/wireless/ath/ath10k/pci.c  |  3 +--
 drivers/net/wireless/ath/ath10k/txrx.c |  2 +-
 drivers/net/wireless/ath/ath10k/wmi.c  | 17 ++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h  |  4 ++--
 8 files changed, 54 insertions(+), 16 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
