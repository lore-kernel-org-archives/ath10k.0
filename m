Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3KC-0000qZ-KL
 for ath10k@lists.infradead.org; Tue, 28 Oct 2014 09:44:25 +0000
Received: by mail-lb0-f181.google.com with SMTP id w7so236783lbi.26
 for <ath10k@lists.infradead.org>; Tue, 28 Oct 2014 02:44:00 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 0/4] ath10k: pci related fixes 2014-10-09
Date: Tue, 28 Oct 2014 10:32:04 +0100
Message-Id: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
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

This is a partial re-spin which includes the
not-yet-applied patches that fix/change warm
reset.

v3:
 * change CE ring cleanup (new patch #1)


Michal Kazior (4):
  ath10k: change ce ring cleanup logic
  ath10k: make warm reset a bit safer and faster
  ath10k: split reset logic from power up
  ath10k: don't reset chip on power_down

 drivers/net/wireless/ath/ath10k/ce.c  |   6 -
 drivers/net/wireless/ath/ath10k/pci.c | 345 +++++++++++++++++-----------------
 2 files changed, 176 insertions(+), 175 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
