Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XygdH-0007vv-RA
 for ath10k@lists.infradead.org; Wed, 10 Dec 2014 12:44:44 +0000
Received: by mail-wi0-f175.google.com with SMTP id l15so11101225wiw.8
 for <ath10k@lists.infradead.org>; Wed, 10 Dec 2014 04:44:18 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: a bunch of STA-related fixes
Date: Wed, 10 Dec 2014 13:31:49 +0100
Message-Id: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
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


Michal Kazior (5):
  ath10k: improve 11b coex
  ath10k: fix STA u-APSD
  ath10k: prevent invalid ps timeout config
  ath10k: enable per-vif sta powersave
  ath10k: advertise p2p dev support

 drivers/net/wireless/ath/ath10k/core.c |  6 ---
 drivers/net/wireless/ath/ath10k/mac.c  | 89 ++++++++++++++++++++++++++++------
 2 files changed, 74 insertions(+), 21 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
