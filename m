Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x236.google.com ([2a00:1450:4013:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYwFz-0003L0-GC
 for ath10k@lists.infradead.org; Wed, 23 Oct 2013 11:05:45 +0000
Received: by mail-ea0-f182.google.com with SMTP id o10so338003eaj.13
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2013 04:05:20 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: tx power fixes
Date: Wed, 23 Oct 2013 04:02:12 -0700
Message-Id: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
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

This patchset fixes power units used in ath10k and
also make it respect (user) configurable tx power.


Michal Kazior (3):
  ath10k: setup min channel power to a reasonable value
  ath10k: use proper tx power unit
  ath10k: respect power_level values

 drivers/net/wireless/ath/ath10k/mac.c | 44 +++++++++++++++++++++++++----------
 drivers/net/wireless/ath/ath10k/wmi.h |  3 ++-
 2 files changed, 34 insertions(+), 13 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
