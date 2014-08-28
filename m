Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMxZV-0002Rx-Hl
 for ath10k@lists.infradead.org; Thu, 28 Aug 2014 11:08:54 +0000
Received: by mail-lb0-f175.google.com with SMTP id u10so676326lbd.6
 for <ath10k@lists.infradead.org>; Thu, 28 Aug 2014 04:08:31 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: monitor fixes
Date: Thu, 28 Aug 2014 12:58:15 +0200
Message-Id: <1409223497-19946-1-git-send-email-michal.kazior@tieto.com>
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

This cleans up the monitor code a bit and
introduces a workaround for a fw bug (leading to a
fw crash) when station interface associates while
a monitor vdev is running.

People have been complaining about the fw crash
for some time now. I guess we have no choice but
to make a workaround in ath10k. The most common
usecase that will benefit from this fix is
probably 4addr sta briding.


Michal Kazior (2):
  ath10k: fix monitor start/stop sequences
  ath10k: stop monitor vdev for sta assoc

 drivers/net/wireless/ath/ath10k/core.h |   1 -
 drivers/net/wireless/ath/ath10k/mac.c  | 131 +++++++++++++++------------------
 2 files changed, 58 insertions(+), 74 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
