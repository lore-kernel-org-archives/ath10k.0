Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRY1G-0003ey-FR
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 09:19:43 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 0/4] ath10k: sdio: add support for rx/tx bitrate reporting
Date: Thu, 23 Apr 2020 17:18:52 +0800
Message-Id: <20200423091856.24297-1-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

iw wlan0 link/iw wlan0 station dump show the wrong bitrate for rx/tx.
wrong example:
rx bitrate: 6.0 MBit/s
tx bitrate: 2.8 MBit/s

These patches correct them.
rx bitrate: 234.0 MBit/s VHT-MCS 3 80MHz VHT-NSS 2
rx bitrate: 40.5 MBit/s MCS 2 40MHz
rx bitrate: 72.2 MBit/s MCS 7 short GI
rx bitrate: 54.0 MBit/s
rx bitrate: 48.0 MBit/s

tx bitrate: 54.0 MBit/s

Wen Gong (4):
  ath10k: enable firmware peer stats info for wmi tlv
  ath10k: add rx bitrate report for SDIO
  ath10k: add bitrate parse for peer stats info
  ath10k: correct tx bitrate of iw for SDIO

 drivers/net/wireless/ath/ath10k/core.c    |   2 +
 drivers/net/wireless/ath/ath10k/core.h    |  25 +++
 drivers/net/wireless/ath/ath10k/hw.h      |   3 +
 drivers/net/wireless/ath/ath10k/mac.c     | 216 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  30 +++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 121 ++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 110 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |   9 +
 8 files changed, 516 insertions(+)

-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
