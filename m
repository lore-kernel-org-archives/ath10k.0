Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([79.140.42.25] helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr2pd-0001Sp-Ut
 for ath10k@lists.infradead.org; Thu, 23 Mar 2017 13:31:16 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH v2 0/3] Channels in licensed bands, noise floor override
Date: Thu, 23 Mar 2017 14:30:45 +0100
Message-Id: <20170323133048.30062-1-sw@simonwunderlich.de>
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
To: ath10k@lists.infradead.org, ath9k-devel@qca.qualcomm.com
Cc: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, linux-wireless@vger.kernel.org, Simon Wunderlich <sw@simonwunderlich.de>

This is the revised series for adding channels in licensed bands and the
noise floor override. Thanks for the previous discussions, I've adopted
suggestions from Zefir and Sebastian accordingly and rebased the series.

For more background info, please check the v1 series:

https://www.spinics.net/lists/linux-wireless/msg160266.html

Cheers,
     Simon
 
Ben Greear (1):
  ath9k: Support channels in licensed bands

Simon Wunderlich (2):
  ath10k: add support for channels in licensed bands
  ath9k: add noise floor override option

 drivers/net/wireless/ath/ath10k/Kconfig      | 20 +++++++++
 drivers/net/wireless/ath/ath10k/core.h       |  4 ++
 drivers/net/wireless/ath/ath10k/mac.c        | 10 +++++
 drivers/net/wireless/ath/ath10k/wmi.c        | 53 +++++++++++++++++-------
 drivers/net/wireless/ath/ath9k/Kconfig       | 20 +++++++++
 drivers/net/wireless/ath/ath9k/calib.c       |  5 ++-
 drivers/net/wireless/ath/ath9k/common-init.c | 15 +++++++
 drivers/net/wireless/ath/ath9k/debug.c       | 62 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath9k/hw.h          |  5 +++
 9 files changed, 177 insertions(+), 17 deletions(-)

-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
