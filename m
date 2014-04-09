Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpVn-0004WT-L5
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:13:50 +0000
Received: by mail-ee0-f53.google.com with SMTP id b57so1689360eek.12
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:13:20 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: improve recovery speed
Date: Wed,  9 Apr 2014 12:07:05 +0200
Message-Id: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
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

Patch 1/3 is just a cleanup I wanted to keep
separate from 2/3 which actually improves recovery
speed.

With this I'm able to recover from a `hard`
simualtion crash in ~3 seconds instead of ~10.

This should decrease the chance of CQM kicking in
on connected clients (due to beacon loss) when
ath10k is acting as AP.


Michal Kazior (3):
  ath10k: differentiate between target init failures
  ath10k: don't wait for device init if it crashed
  ath10k: skip suspending when recovering

 drivers/net/wireless/ath/ath10k/core.c |  6 ++++--
 drivers/net/wireless/ath/ath10k/pci.c  | 17 ++++++++++++++++-
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
