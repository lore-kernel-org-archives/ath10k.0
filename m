Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPXX8-0005hh-BV
 for ath10k@lists.infradead.org; Thu, 04 Sep 2014 13:57:07 +0000
Subject: [PATCH v3 0/2] ath10k: testmode support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 04 Sep 2014 16:56:41 +0300
Message-ID: <20140904135447.26750.52873.stgit@potku.adurom.net>
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

new version of ath10k testmode support. Only functionality changes were in
ath10k_tm_cmd_utf_start(). The user space interface didn't change from v2.

v3:

* remove false "fall through" comment in ath10k_start() (Michal)

* fix multiline comment style (Michal)

* put testmode interface definitions to testmode_uapi.h (or similar) (Johannes)

* document __set_bit(ar->fw_features) better (Michal)

* ath10k_tm_cmd_utf_start(): return ar->fw_feature value if there's an error

* free firmware in ath10k_tm_cmd_utf_start() when an error happens (Michal)

* ath10k_tm_cmd_utf_start(): move hif_power_down() to err_power_down label


v2:

* check error from ath10k_wmi_alloc_skb() (Michal)

* int err -> int ret (Michal)

* fix conflicts in core.c

* add ar->testmode.utf_monitor to check if ath10k_tm_event_wmi()
  should deliver WMI events or not

* print mode in ath10k_download_fw() log messages

* set ar->testmode.utf to NULL after it's released (Michal)

* release ar->testmode.utf also in ath10k_tm_cmd_utf_stop()

* rename ath10k_testmode_unregister() to ath10k_testmode_destroy()

* call ath10k_core_stop() in ath10k_testmode_destroy() (Michal)

* document wmi packet format in testmode commands (Michal)

* consume WMI packets so that mac80211 calls are not made in UTF mode (Michal)

* force to use 10x WMI interface with UTF firmware

* API change: remove ATH10K_TM_CMD_EVENT_WMI, use ATH10K_TM_CMD_WMI also for events

* API change: add major and minor version numbers to
  ATH10K_TM_CMD_GET_VERSION for the user space more easily to detect
  interface changes

* use conf_mutex in ath10k_tm_cmd_wmi()

* print "UTF firmware started" and "UTF firmware stopped"

* print "testmode %d" in ath10k_print_driver_info()

* don't call ath10k_wait_for_suspend() in UTF mode


---

Kalle Valo (2):
      ath10k: make ath10k_wmi_cmd_send() public
      ath10k: add testmode


 drivers/net/wireless/ath/ath10k/Makefile     |    1 
 drivers/net/wireless/ath/ath10k/core.c       |   88 ++++--
 drivers/net/wireless/ath/ath10k/core.h       |   22 +-
 drivers/net/wireless/ath/ath10k/debug.c      |    5 
 drivers/net/wireless/ath/ath10k/debug.h      |    1 
 drivers/net/wireless/ath/ath10k/hw.h         |    2 
 drivers/net/wireless/ath/ath10k/mac.c        |    9 +
 drivers/net/wireless/ath/ath10k/testmode.c   |  375 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/testmode.h   |   46 +++
 drivers/net/wireless/ath/ath10k/testmode_i.h |   70 +++++
 drivers/net/wireless/ath/ath10k/wmi.c        |   22 +-
 drivers/net/wireless/ath/ath10k/wmi.h        |    4 
 12 files changed, 612 insertions(+), 33 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.h
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode_i.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
