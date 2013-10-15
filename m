Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW9e3-0001G0-MG
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 18:47:05 +0000
Subject: [PATCH 0/7] ath10k: fix WMI atomic usage
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 15 Oct 2013 21:46:37 +0300
Message-ID: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
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

Some WMI calls were made in atomic contex, these patches fix
those. Please review.

---

Kalle Valo (2):
      ath10k: fix ath10k_bss_assoc() to not sleep in atomic context
      ath10k: add might_sleep() to ath10k_wmi_cmd_send()

Michal Kazior (5):
      ath10k: use workqueue to set WEP TX key
      ath10k: fix add_interface failure handling
      ath10k: track vif list internally
      ath10k: fix scheduling while atomic config bug
      ath10k: remove unnecessary checks


 drivers/net/wireless/ath/ath10k/core.c |    2 
 drivers/net/wireless/ath/ath10k/core.h |    7 +
 drivers/net/wireless/ath/ath10k/mac.c  |  312 +++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/wmi.c  |    2 
 4 files changed, 178 insertions(+), 145 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
