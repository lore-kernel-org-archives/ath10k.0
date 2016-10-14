Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buza9-0004Zu-4F
 for ath10k@lists.infradead.org; Fri, 14 Oct 2016 10:19:17 +0000
Subject: [PATCH v2 0/2] ath10k: add VHT160 support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 14 Oct 2016 13:18:46 +0300
Message-ID: <20161014101710.5300.21550.stgit@potku.adurom.net>
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

here's v2 of Sebastian's VHT160 patch.

v2:

* cc linux-wireless

* refactor ath10k_peer_assoc_h_phymode()

* fix two rebase issues

* fix checkpatch warnings

---

Kalle Valo (1):
      ath10k: refactor ath10k_peer_assoc_h_phymode()

Sebastian Gottschall (1):
      ath10k: add VHT160 support


 drivers/net/wireless/ath/ath10k/htt_rx.c  |    7 +++-
 drivers/net/wireless/ath/ath10k/mac.c     |   54 +++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |    1 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |    1 +
 drivers/net/wireless/ath/ath10k/wmi.c     |    9 ++++-
 drivers/net/wireless/ath/ath10k/wmi.h     |   27 +++++++++++++--
 6 files changed, 87 insertions(+), 12 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
