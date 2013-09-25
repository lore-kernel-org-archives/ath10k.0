Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOlYY-0002Rf-62
 for ath10k@lists.infradead.org; Wed, 25 Sep 2013 09:38:51 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 00/13] ath10k: dual-firmware support (MAIN and 10.X)
Date: Wed, 25 Sep 2013 11:37:58 +0200
Message-ID: <1380101891-18312-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This patch-set adds framework for dynamic support of 10.X FW branch.

The major changes covered by this work:
* dynamic WMI structures
* WMI cmd/event definitions from 10.x FW track
* memory host chunks feature
* management frames path over WMI for 10.x
* WMI RX events handling for MAIN and 10.X split
* target config split (LARGE AP feature for 10.x)
* scan start sctructure split
* dynamic VDEV and PDEV parameters structures

TODO:
* add FW IEs to identify (runtime) which FW ath10k deals with

Bartosz Markowski (13):
  ath10k: introduce dynamic WMI structures
  ath10k: add wmi_10x_<cmd/event> definitions
  ath10k: warn if give WMI command is not supported
  ath10k: implement WMI events handling frame for both firmwares
  ath10k: split ath10k_wmi_service_ready_event_rx
  ath10k: drop the fw versioning sanity check
  ath10k: implement host memory chunks
  ath10k: bring back the WMI path for mgmt frames
  ath10k: split wmi_cmd_init path
  ath10k: add TARGET values for 10.x firmware
  ath10k: introduce dynamic vdev parameters
  ath10k: introduce dynamic pdev parameters
  ath10k: handle FW API differences for scan structures

 drivers/net/wireless/ath/ath10k/core.c   |   29 +-
 drivers/net/wireless/ath/ath10k/core.h   |   23 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |    4 +-
 drivers/net/wireless/ath/ath10k/hw.h     |   37 +-
 drivers/net/wireless/ath/ath10k/mac.c    |   93 ++-
 drivers/net/wireless/ath/ath10k/wmi.c    | 1129 ++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.h    |  969 ++++++++++++++++++++++++-
 7 files changed, 2160 insertions(+), 124 deletions(-)

-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
