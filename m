Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XX6Xi-0007P3-2f
 for ath10k@lists.infradead.org; Thu, 25 Sep 2014 10:44:58 +0000
Received: by mail-wi0-f180.google.com with SMTP id q5so9115430wiv.1
 for <ath10k@lists.infradead.org>; Thu, 25 Sep 2014 03:44:32 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/4] ath10k: fix/cleanup fw stats
Date: Thu, 25 Sep 2014 12:33:46 +0200
Message-Id: <1411641230-18785-1-git-send-email-michal.kazior@tieto.com>
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

This cleans up and fixes fw stats aggregation.


Michal Kazior (4):
  ath10k: split wmi stats parsing
  ath10k: rename fw_stats related stuff
  ath10k: request fw_stats once on open
  ath10k: fix fw stats processing

 drivers/net/wireless/ath/ath10k/core.h  |  26 +-
 drivers/net/wireless/ath/ath10k/debug.c | 476 ++++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/debug.h |   7 +-
 drivers/net/wireless/ath/ath10k/wmi.c   | 190 ++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h   |  24 +-
 5 files changed, 483 insertions(+), 240 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
