Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCB4v-0005t2-DA
 for ath10k@lists.infradead.org; Sat, 20 May 2017 20:34:23 +0000
Received: by mail-lf0-x241.google.com with SMTP id m18so2393486lfj.0
 for <ath10k@lists.infradead.org>; Sat, 20 May 2017 13:33:59 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 0/3] ath10k usb support
Date: Sat, 20 May 2017 22:33:27 +0200
Message-Id: <1495312410-9937-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This is the 2nd version of the ath10k USB RFC. There are only minor updates
since last version.

The main difference when compared to the previous RFC is that the
high latency stuff that is common between USB and SDIO has been moved out
of this patchset and into another (separate) patchset.

I was actually thinking about squashing all the patches into one, but
decided not to do so since I wanted usb.h, usb.c and the update Kconfig +
Makefile in one separate patch.

Perhaps patch 1 and 2 should be squashed?

Erik Stromdahl (3):
  ath10k: various usb related definitions
  ath10k: different fw file names for usb
  ath10k: add initial USB support

 drivers/net/wireless/ath/ath10k/Kconfig  |    7 +
 drivers/net/wireless/ath/ath10k/Makefile |    3 +
 drivers/net/wireless/ath/ath10k/core.c   |    1 +
 drivers/net/wireless/ath/ath10k/core.h   |    3 +
 drivers/net/wireless/ath/ath10k/debug.h  |    2 +
 drivers/net/wireless/ath/ath10k/usb.c    | 1128 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/usb.h    |  128 ++++
 7 files changed, 1272 insertions(+)
 create mode 100644 drivers/net/wireless/ath/ath10k/usb.c
 create mode 100644 drivers/net/wireless/ath/ath10k/usb.h

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
