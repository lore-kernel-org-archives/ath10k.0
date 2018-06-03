Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPXe0-0006Un-Sc
 for ath10k@lists.infradead.org; Sun, 03 Jun 2018 18:22:22 +0000
Received: by mail-lf0-x242.google.com with SMTP id t134-v6so21772368lff.6
 for <ath10k@lists.infradead.org>; Sun, 03 Jun 2018 11:22:10 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v5 00/12] ath10k high latency
Date: Sun,  3 Jun 2018 20:20:17 +0200
Message-Id: <20180603182029.8914-1-erik.stromdahl@gmail.com>
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

Changes since v4:

I have tried to reduce the number of patches to a
minimum for getting high latency up and running.

The hw_params items for the two QCA9377 based devices
included in the previous patchset (one Linksys USB and
one SDIO device) have been skipped, and thus there is
no board-2.bin support.

I have planned to submit them in separate patches later
(together with board-2.bin support).

USB might be even more broken due to a lot of ugly
special cases beeing removed.

The main issue with USB right now is that there are no
TX_COMPL_IND's from fw.

The special cases for handling this have been removed.
If needed, they could be added back in a future patch.

The rename of the *is_high_latency* boolean to ATH10K_HTT_MODE
ended up in a rename to ATH10K_DEV_TYPE instead,
 since this is not only related to HTT.

The start_once patch was removed as well.
SDIO seems to work well without it.
If needed by USB, we can add it in a future patch.

Erik Stromdahl (12):
  ath10k: add struct ath10k_bus_params
  ath10k: add device type enum to ath10k_bus_params
  ath10k: add bus type check in ath10k_init_hw_params
  ath10k: use hw_params.num_peers for num_tids in TLV init
  ath10k: add per target config of max_num_peers
  ath10k: DMA related fixes for high latency devices
  ath10k: add HTT TX HL ops
  ath10k: add HTT RX HL ops
  ath10k: htt: RX ring config HL support
  ath10k: htt: High latency TX support
  ath10k: htt: High latency RX support
  ath10k: wmi: disable softirq's while calling ieee80211_rx

 drivers/net/wireless/ath/ath10k/ahb.c     |   9 +-
 drivers/net/wireless/ath/ath10k/core.c    |  39 ++++--
 drivers/net/wireless/ath/ath10k/core.h    |  22 +--
 drivers/net/wireless/ath/ath10k/htc.c     |  19 ++-
 drivers/net/wireless/ath/ath10k/htt.h     |  47 +++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 135 ++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/htt_tx.c  | 155 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h      |   9 ++
 drivers/net/wireless/ath/ath10k/pci.c     |  13 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h |  15 +++
 drivers/net/wireless/ath/ath10k/sdio.c    |   8 +-
 drivers/net/wireless/ath/ath10k/snoc.c    |   5 +-
 drivers/net/wireless/ath/ath10k/txrx.c    |   3 +-
 drivers/net/wireless/ath/ath10k/usb.c     |   7 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |   5 +-
 drivers/net/wireless/ath/ath10k/wmi.c     |   3 +-
 16 files changed, 444 insertions(+), 50 deletions(-)

-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
