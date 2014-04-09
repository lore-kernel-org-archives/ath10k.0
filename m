Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpQM-0004GS-K9
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:08:07 +0000
Received: by mail-ee0-f45.google.com with SMTP id d17so1688096eek.4
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:07:39 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/4] ath10k: AP-related fixes
Date: Wed,  9 Apr 2014 12:01:21 +0200
Message-Id: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
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

This is a bunch of fixes I've found while
investigating tx credit issues.

I've only experienced problem fixed by 4/4
firsthand. Other patches are preemptive fixes :-)


Michal Kazior (4):
  ath10k: make sure to not leak beacon dma mapping
  ath10k: make sure to not use invalid beacon pointer
  ath10k: prevent beacon memory leak
  ath10k: fix firmware recovery with ap interface

 drivers/net/wireless/ath/ath10k/mac.c | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c |  3 +++
 2 files changed, 19 insertions(+)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
