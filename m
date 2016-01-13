Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJNdl-0002k5-KZ
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 15:47:18 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 0/7] Add support for Per STA Rx duration
Date: Wed, 13 Jan 2016 21:16:27 +0530
Message-ID: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

*Enable parsing of rx_duration as part of peer stats support
 by the new 10.2.4 firmware
*Add support to dump per STA rx_duration  (usecs)
*Pre-requisite cleanups
*For calculating total rx-duration in host, enable provision to
 support periodic peer stats update.
*Also enable mac80211 debugfs entry to track per STA rx duration(usecs)

Mohammed Shafi Shajakhan (7):
  ath10k: Add support for parsing per STA rx_duration for 10.2.4
  ath10k: Fix naming Peer stats rssi_changed field in 10.2.4
  ath10k: Cleanup setting pdev paramaters
  ath10k: Rename few function names of firmware stats
  ath10k: Provision to support periodic peer stats update
  ath10k: Enable periodic peer stats update
  ath10k: Add debugfs support for Per STA total rx duration

 drivers/net/wireless/ath/ath10k/core.h        |    2 ++
 drivers/net/wireless/ath/ath10k/debug.c       |   28 ++++++++++-------
 drivers/net/wireless/ath/ath10k/debug.h       |    6 ++++
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   41 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c         |   32 +++++++++++++------
 drivers/net/wireless/ath/ath10k/wmi.c         |   22 +++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.h         |   14 ++++++++-
 7 files changed, 122 insertions(+), 23 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
