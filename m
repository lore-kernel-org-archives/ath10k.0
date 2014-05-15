Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkrM4-0002sY-Pu
 for ath10k@lists.infradead.org; Thu, 15 May 2014 08:49:33 +0000
Received: by mail-ee0-f50.google.com with SMTP id e51so400174eek.23
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 01:49:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/5] ath10k: recovery fixes 2014-05-09
Date: Thu, 15 May 2014 10:41:59 +0200
Message-Id: <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
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

v2:
 * minor code style adjustments
 * extra comment
 * sanity check in wep key worker


Michal Kazior (5):
  ath10k: clean up start() callback
  ath10k: perform hw restart lazily
  ath10k: drain tx before restarting hw
  ath10k: protect wep tx key setup
  ath10k: dont configure bssid for ap mode

 drivers/net/wireless/ath/ath10k/core.c |   5 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 117 ++++++++++++++++++++++-----------
 2 files changed, 83 insertions(+), 39 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
