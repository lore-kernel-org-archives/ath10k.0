Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDsYm-0000Tq-Fl
 for ath10k@lists.infradead.org; Mon, 26 Aug 2013 08:54:05 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/4] ath10k: fixes
Date: Mon, 26 Aug 2013 10:53:21 +0200
Message-ID: <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This patchset addresses some throughput/stability
issues.

v2:
 * add new patch
 * fix WARNING due to wrong ieee80211_rx() usage


Pozdrawiam / Best regards,
Michal Kazior.


Michal Kazior (4):
  ath10k: synchronize tx/rx reporting to mac80211
  ath10k: make the workqueue multithreaded
  ath10k: move htt rx processing to worker
  ath10k: fix issues on non-preemptible systems

 drivers/net/wireless/ath/ath10k/core.c   |    5 ++-
 drivers/net/wireless/ath/ath10k/core.h   |   10 ++++++
 drivers/net/wireless/ath/ath10k/htc.c    |    4 +++
 drivers/net/wireless/ath/ath10k/htt.h    |    3 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c |   58 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/txrx.c   |    6 +++-
 drivers/net/wireless/ath/ath10k/wmi.c    |    4 +++
 7 files changed, 81 insertions(+), 9 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
