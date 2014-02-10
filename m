Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCtcB-0001xe-Of
 for ath10k@lists.infradead.org; Mon, 10 Feb 2014 16:21:48 +0000
Received: by mail-ea0-f169.google.com with SMTP id h10so3143554eak.14
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 08:21:25 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH 0/3] ath10k: reduce number of host corruptions
Date: Mon, 10 Feb 2014 17:14:21 +0100
Message-Id: <1392048864-13352-1-git-send-email-marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org

This patchset reduces frequency of a strange HW bug
in CUS232 boards.

The bug happens in some workloads with different
frequency with different hardware spinoffs. It is
triggered by a cold reset after HW/FW has been
excercised with some work. On x86 this could be a hang,
on AP135 it is a data bus error. Frequency of problem
is reduced in driver by calling first warm reset
instead of cold reset. When warm reset fails then
driver will call cold reset. 

Marek Puzyniak (2):
  ath10k: refactor suspend/resume functions
  ath10k: suspend hardware before reset

Michal Kazior (1):
  ath10k: fix device initialization routine

 drivers/net/wireless/ath/ath10k/core.c |  30 +++++++-
 drivers/net/wireless/ath/ath10k/core.h |   4 +-
 drivers/net/wireless/ath/ath10k/hw.h   |   6 ++
 drivers/net/wireless/ath/ath10k/mac.c  |  43 ++++++-----
 drivers/net/wireless/ath/ath10k/pci.c  | 134 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.c  |   4 +-
 drivers/net/wireless/ath/ath10k/wmi.h  |   2 +-
 7 files changed, 187 insertions(+), 36 deletions(-)

-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
