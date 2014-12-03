Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw50O-0006t7-7x
 for ath10k@lists.infradead.org; Wed, 03 Dec 2014 08:09:48 +0000
Subject: [PATCH v4 0/8] ath10k: add support for new wmi-tlv backend
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 3 Dec 2014 10:09:16 +0200
Message-ID: <20141203080803.31187.85059.stgit@potku.adurom.net>
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

here's v4 of Michal's patches to add WMI TLV interface support to
ath10k.

v4:

* fix error handling for ath10k_core_init_firmware_features()

* ar->htt.max_num_pending_tx = TARGET_TLV_NUM_MSDU_DESC

* use enum ath10k_fw_wmi_op_version op_version in struct ath10k_wmi

* add ATH10K_FW_WMI_OP_VERSION_UNSET

* add ATH10K_FW_WMI_OP_VERSION_MAX


v3:

* add ATH10K_FW_IE_WMI_OP_VERSION

* deprecate ATH10K_FW_FEATURE_WMI_10* feature flags

* remove ATH10K_FW_FEATURE_WMI_TLV, functionality replaced by
  ATH10K_FW_IE_WMI_OP_VERSION

* remove struct ieee80211_iface_combination ath10k_tlv_if_comb[] & co.
  Those can be added in a different patch.

* add SVCSTR() for STA_RX_IPA_OFFLOAD_SUPPORT, MDNS_OFFLOAD and SAP_AUTH_OFFLOAD


---

Kalle Valo (4):
      ath10k: clean up error handling in ath10k_core_probe_fw()
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
 drivers/net/wireless/ath/ath10k/core.c     |  105 +
 drivers/net/wireless/ath/ath10k/core.h     |   10 
 drivers/net/wireless/ath/ath10k/debug.c    |    1 
 drivers/net/wireless/ath/ath10k/htt_tx.c   |    5 
 drivers/net/wireless/ath/ath10k/hw.h       |   26 
 drivers/net/wireless/ath/ath10k/mac.c      |    2 
 drivers/net/wireless/ath/ath10k/spectral.c |    1 
 drivers/net/wireless/ath/ath10k/testmode.c |    5 
 drivers/net/wireless/ath/ath10k/wmi-ops.h  |  821 ++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c  | 2218 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h  | 1380 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c      | 1375 +++++++++++------
 drivers/net/wireless/ath/ath10k/wmi.h      |  268 +++
 15 files changed, 5597 insertions(+), 623 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-ops.h
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-tlv.c
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-tlv.h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
