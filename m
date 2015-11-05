Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuGGv-0006Y6-Pc
 for ath10k@lists.infradead.org; Thu, 05 Nov 2015 08:51:55 +0000
Received: by lbbes7 with SMTP id es7so30377507lbb.2
 for <ath10k@lists.infradead.org>; Thu, 05 Nov 2015 00:51:29 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2 0/4] update ath10k support for QCA9377 chips
Date: Thu,  5 Nov 2015 09:50:39 +0100
Message-Id: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

* Clarifying the naming scheme for QCA9377 targets
* Adding the dev_id mathod (RFC) as a HW identification helper
* updating missing hw_params for 1.1 target

---

Notes:
  v2:
   * rebase
   * fix the whitespace mess in patch 4/4 [Kalle]

Bartosz Markowski (4):
  ath10k: fix the currently supported QCA9377 target version name
  ath10k: update missing hw_params of QCA9377 hw1.1
  ath10k: introduce dev_id to hw_params
  ath10k: add QCA9377 hw1.0 support

 drivers/net/wireless/ath/ath10k/core.c | 49 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/hw.h   | 17 ++++++++++--
 drivers/net/wireless/ath/ath10k/pci.c  |  8 ++----
 4 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
