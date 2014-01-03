Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz2Tb-0004Ia-27
 for ath10k@lists.infradead.org; Fri, 03 Jan 2014 10:59:40 +0000
Subject: [PATCH 0/3] ath10k: firmware dbglog and debug print events
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 03 Jan 2014 12:59:13 +0200
Message-ID: <20140103105718.13474.70922.stgit@potku.adurom.net>
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

Here are two new interfaces, dbglog and debug print events, to help with
firmware debugging on ath10k. Please review.

---

Kalle Valo (3):
      ath10k: handle WMI debug print events
      ath10k: add trace event for WMI_DEBUG_MESG_EVENTID
      ath10k: add debugfs file to control firmware dbglog


 drivers/net/wireless/ath/ath10k/core.h  |    2 +
 drivers/net/wireless/ath/ath10k/debug.c |   66 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/trace.h |   21 ++++++++
 drivers/net/wireless/ath/ath10k/wmi.c   |   79 +++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.h   |   49 +++++++++++++++++++
 5 files changed, 213 insertions(+), 4 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
