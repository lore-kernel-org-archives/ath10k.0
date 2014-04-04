Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW2Xw-0006we-Eu
 for ath10k@lists.infradead.org; Fri, 04 Apr 2014 11:44:33 +0000
Received: by mail-we0-f170.google.com with SMTP id w61so3302572wes.29
 for <ath10k@lists.infradead.org>; Fri, 04 Apr 2014 04:44:10 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFT 0/4] ath10k: fix flushing and tx stalls
Date: Fri,  4 Apr 2014 13:37:40 +0200
Message-Id: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
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

@Ben: Can you check if this helps you? I tested
this briefly and at least [1/4] seems fixes the
WMI Tx starvation. I'm hoping patches 2-4 help
with your ath10k_flush() failures which I haven't
been successfull in reproducing (but have observed
improvement with purging some frames out of FW/HW
queues).


Michal Kazior (4):
  ath10k: fix wmi-htc tx credit starvation
  ath10k: rework peer accounting
  ath10k: wait for mgmt tx when flushing too
  ath10k: improve tx flushing

 drivers/net/wireless/ath/ath10k/core.h |   7 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 254 +++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/txrx.c |  29 ++--
 drivers/net/wireless/ath/ath10k/wmi.c  |   5 -
 drivers/net/wireless/ath/ath10k/wmi.h  |   4 +
 5 files changed, 253 insertions(+), 46 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
