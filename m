Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x234.google.com ([2a00:1450:4013:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WijqS-0006zJ-B9
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:24:09 +0000
Received: by mail-ee0-f52.google.com with SMTP id e53so2578719eek.25
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:23:41 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: recovery fixes 2014-05-09
Date: Fri,  9 May 2014 14:15:44 +0200
Message-Id: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
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

Here's is a bunch of fixes for recovery/hw
restart. This notably fixes a bug Ben has hit some
time ago.

I also have some improvements for recovery code as
well in a follow up patchset that I'll be sending
separately.


Michal Kazior (5):
  ath10k: clean up start() callback
  ath10k: perform hw restart lazily
  ath10k: drain tx before restarting hw
  ath10k: protect wep tx key setup
  ath10k: dont configure bssid for ap mode

 drivers/net/wireless/ath/ath10k/core.c |   5 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 103 +++++++++++++++++++++------------
 2 files changed, 70 insertions(+), 38 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
