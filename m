Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vr7GY-0006NZ-Rl
 for ath10k@lists.infradead.org; Thu, 12 Dec 2013 14:29:28 +0000
Received: by mail-ea0-f172.google.com with SMTP id q10so228351ead.17
 for <ath10k@lists.infradead.org>; Thu, 12 Dec 2013 06:28:30 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: fix host corruption
Date: Thu, 12 Dec 2013 15:24:18 +0100
Message-Id: <1386858261-16037-1-git-send-email-michal.kazior@tieto.com>
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

This patchset aims at fixing (or at least
reducing) the frequency of a (apparently) strange
HW bug.

The bug happens in some workloads with different
frequency with different hardware spinoffs. It is
triggered by a cold reset after HW/FW has been
excercised with some work.

On x86 this could be a hang, on AP135 it is a data
bus error.


Michal Kazior (3):
  ath10k: fix device initialization routine
  ath10k: zero device DRAM to avoid host hangs
  ath10k: zero CE config upon deinit

 drivers/net/wireless/ath/ath10k/ce.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/hw.h  |   7 ++
 drivers/net/wireless/ath/ath10k/pci.c | 143 ++++++++++++++++++++++++++++++----
 3 files changed, 164 insertions(+), 13 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
