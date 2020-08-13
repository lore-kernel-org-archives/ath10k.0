Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69ov-0005uW-9U
 for ath10k@lists.infradead.org; Thu, 13 Aug 2020 09:46:54 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 0/3] ath10k: correct tx/rx bitrate for QCA6174 PCIe and SDIO
Date: Thu, 13 Aug 2020 17:47:06 +0800
Message-Id: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

iw wlan0 station dump not show the correct tx/rx bitrate of QCA6174
PCIe and SDIO, it is because it has 1 check for WMI_SERVICE_PEER_STATS
and 1 return for empty arsta->txrate, so change to pass the check and
remove the return, then iw wlan0 station dump show correct tx/rx bitrate
for QCA6174 SDIO.

After that, set true for supports_peer_stats_info of QCA6174 PCIe, then
it show same correct tx/rx bitrate.

Wen Gong (3):
  ath10k: add wmi service peer stat info for wmi tlv
  ath10k: remove return for NL80211_STA_INFO_TX_BITRATE
  ath10k: enable supports_peer_stats_info for QCA6174 PCI devices

 drivers/net/wireless/ath/ath10k/core.c    |  1 +
 drivers/net/wireless/ath/ath10k/mac.c     | 21 ++++++++++-----------
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  2 ++
 3 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
