Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvSDy-00062X-UO
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 14:45:15 +0000
Subject: [PATCH v3 0/7] ath10k: add support for new wmi-tlv backend
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 1 Dec 2014 16:44:42 +0200
Message-ID: <20141201144400.18248.62714.stgit@potku.adurom.net>
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

here's v3 of Michal's patches to add WMI TLV interface support to
ath10k.

v3:

* add ATH10K_FW_IE_WMI_OP_VERSION

* deprecate ATH10K_FW_FEATURE_WMI_10* feature flags

* remove ATH10K_FW_FEATURE_WMI_TLV, functionality replaced by
  ATH10K_FW_IE_WMI_OP_VERSION

* remove struct ieee80211_iface_combination ath10k_tlv_if_comb[] & co.
  Those can be added in a different patch.

* add SVCSTR() for STA_RX_IPA_OFFLOAD_SUPPORT, MDNS_OFFLOAD and SAP_AUTH_OFFLOAD

---

Kalle Valo (3):
      ath10k: create ath10k_core_init_features()
      ath10k: add ATH10K_FW_IE_WMI_OP_VERSION
      ath10k: set max_num_pending_tx in ath10k_core_init_firmware_features()

Michal Kazior (4):
      ath10k: implement intermediate event args
      ath10k: introduce wmi ops
      ath10k: make some wmi functions public
      ath10k: implement wmi-tlv backend


 drivers/net/wireless/ath/ath10k/Makefile   |    1 
 drivers/net/wireless/ath/ath10k/ce.c       |    2 
 drivers/net/wireless/ath/ath10k/core.c     |   62 +
 drivers/net/wireless/ath/ath10k/core.h     |   10 
 drivers/net/wireless/ath/ath10k/debug.c    |    1 
 drivers/net/wireless/ath/ath10k/htt_tx.c   |    5 
 drivers/net/wireless/ath/ath10k/hw.h       |   20 
 drivers/net/wireless/ath/ath10k/mac.c      |    2 
 drivers/net/wireless/ath/ath10k/spectral.c |    1 
 drivers/net/wireless/ath/ath10k/testmode.c |    5 
 drivers/net/wireless/ath/ath10k/wmi-ops.h  |  821 ++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c  | 2218 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h  | 1380 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c      | 1375 +++++++++++------
 drivers/net/wireless/ath/ath10k/wmi.h      |  268 +++
 15 files changed, 5560 insertions(+), 611 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-ops.h
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-tlv.c
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-tlv.h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
