Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmHo0-0004wq-Pc
 for ath10k@lists.infradead.org; Wed, 14 Oct 2015 08:53:05 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH 0/2 v2] ath10k: print firwmare stats specific to firmware
 version
Date: Wed, 14 Oct 2015 14:22:31 +0530
Message-ID: <1444812751-11103-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

Currently printing fw stats in ath10k is common to all firmware versions.
Printing all the stats might lead to confusion because some of the stats
are firmware specific and when printed will have 0's.
Below patchset prints firmware stats specific to firmware.

v2:
        > All the filtered functions moved to wmi.c
        > Added firmware stats support for 10.4 firmware.

Manikanta (2):
  ath10k: Make fw stats prints specific to firmware version
  ath10k: add fw_stats support to 10.4 firmware

 drivers/net/wireless/ath/ath10k/core.h    |   12 +
 drivers/net/wireless/ath/ath10k/debug.c   |  267 +------------
 drivers/net/wireless/ath/ath10k/debug.h   |    3 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   13 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |    1 +
 drivers/net/wireless/ath/ath10k/wmi.c     |  588 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  144 +++++++
 7 files changed, 769 insertions(+), 259 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
