Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x233.google.com ([2a00:1450:4013:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlJM3-00056n-5K
 for ath10k@lists.infradead.org; Tue, 26 Nov 2013 14:11:07 +0000
Received: by mail-ea0-f179.google.com with SMTP id r15so3578159ead.38
 for <ath10k@lists.infradead.org>; Tue, 26 Nov 2013 06:10:43 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/3] ath10k: fixes 2013-11-22
Date: Tue, 26 Nov 2013 14:57:37 +0100
Message-Id: <1385474260-22385-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
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

This has some fixes I've stacked in my local repo.
There are no dependencies between them.

v2:
 * refined commit messages

Michal Kazior (3):
  ath10k: use nss provided by mac80211
  ath10k: implement sta_rc_update()
  ath10k: fix Tx status clearing

 drivers/net/wireless/ath/ath10k/mac.c  | 88 +++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/txrx.c |  2 +-
 drivers/net/wireless/ath/ath10k/wmi.h  |  6 +++
 3 files changed, 93 insertions(+), 3 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
