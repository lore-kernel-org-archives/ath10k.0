Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAIF-0006ir-Ps
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 12:27:19 +0000
Subject: [PATCH v2 0/4] ath10k: silence firmware file probing warnings
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 10 Feb 2017 14:26:20 +0200
Message-ID: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi,

here are patches to make ath10k less spammy during initialisation.

v2:

* RFC -> PATCH

* add new patches:

  ath10k: fetch firmware images in a loop
  ath10k: add directory to board data error message
  ath10k: convert warning about non-existent OTP board id to debug message

---

Erik Stromdahl (1):
      ath10k: fetch firmware images in a loop

Kalle Valo (2):
      ath10k: add directory to board data error message
      ath10k: convert warning about non-existent OTP board id to debug message

Michal Kazior (1):
      ath10k: silence firmware file probing warnings


 drivers/net/wireless/ath/ath10k/core.c     |   68 +++++++++++++---------------
 drivers/net/wireless/ath/ath10k/hw.h       |    4 ++
 drivers/net/wireless/ath/ath10k/testmode.c |    5 ++
 3 files changed, 40 insertions(+), 37 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
