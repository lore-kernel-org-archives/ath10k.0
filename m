Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXqAa-0005v6-1W
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:55:53 +0000
Received: by mail-ee0-f43.google.com with SMTP id e53so1724922eek.30
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:55:27 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFTv2 0/5] ath10k: ath10k: fix flushing and tx stalls
Date: Wed,  9 Apr 2014 12:48:46 +0200
Message-Id: <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

After digging around I've found what seems to be
the problem with WMI Tx credit starvation and
inability to properly flush Tx in ath10k_flush().

Long story short: if a client that was asleep (as
per what firmware thinks) goes out of range (or
just stops responding) then Tx rots in FW/HW
queues for a few seconds before it's discarded.
For WMI Tx credits this means management frames
eat up Tx credits for a few seconds (causing other
WMI commands to timeout and return -EAGAIN/-11).
For HTT Tx this means NullFunc frames would get
stuck for a few seconds before completion was
received.

v2:
 * added tx replenishment patch
 * added conf_mutex locking
 * change condition for flushing mgmt tx


Michal Kazior (5):
  ath10k: always request htc tx replenishment
  ath10k: fix wmi-htc tx credit starvation
  ath10k: rework peer accounting
  ath10k: wait for mgmt tx when flushing too
  ath10k: improve tx flushing

 drivers/net/wireless/ath/ath10k/core.h |   7 +-
 drivers/net/wireless/ath/ath10k/htc.c  |  15 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 275 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/txrx.c |  29 ++--
 drivers/net/wireless/ath/ath10k/wmi.c  |   5 -
 drivers/net/wireless/ath/ath10k/wmi.h  |   4 +
 6 files changed, 275 insertions(+), 60 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
