Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDv3p-0004K9-GN
 for ath10k@lists.infradead.org; Mon, 26 Aug 2013 11:34:18 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 0/3] ath10k: initial per-VDEV FW statistics implementation
Date: Mon, 26 Aug 2013 13:33:31 +0200
Message-ID: <1377516815-12660-1-git-send-email-bartosz.markowski@tieto.com>
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

FW 1.0.0.716 brings per-VDEV statistics. This patch-set implements
debugfs mechanism to fetch those. There's still few more fileds we
can read from the FW stats event, which are not covered here.

Please note there's an ABI change in wmi_peer_stats structure, hence
the PEER statistics will be corrupted if used with older firmware
(e.g. 1.0.0.636)

Bartosz Markowski (3):
  ath10k: update wmi_request_stats_cmd structure
  ath10k: update wal_dbg_tx_stats structure
  ath10k: implement per-VDEV FW statistics

 drivers/net/wireless/ath/ath10k/core.h  |   18 +++++++++
 drivers/net/wireless/ath/ath10k/debug.c |   42 ++++++++++++++++---
 drivers/net/wireless/ath/ath10k/wmi.h   |   67 ++++++++++++++++++++++++++-----
 3 files changed, 113 insertions(+), 14 deletions(-)

-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
