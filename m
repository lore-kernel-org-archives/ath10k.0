Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnTqq-0000hm-SB
 for ath10k@lists.infradead.org; Thu, 22 May 2014 14:20:10 +0000
Received: by mail-ee0-f47.google.com with SMTP id c13so2731269eek.34
 for <ath10k@lists.infradead.org>; Thu, 22 May 2014 07:19:44 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: async pci probing
Date: Thu, 22 May 2014 16:12:33 +0200
Message-Id: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
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

Recently I've tried to built ath10k into kernel.
Thus I've discovered it doesn't play nice.

Are there any gotchas I should be aware of and
might've missed while changing this sort of thing?


Michal Kazior (2):
  ath10k: relocate core create/destroy functions
  ath10k: make core registering async

 drivers/net/wireless/ath/ath10k/core.c | 170 ++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |   2 +
 drivers/net/wireless/ath/ath10k/pci.c  |   2 -
 3 files changed, 96 insertions(+), 78 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
