Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC20H-0000DM-Hf
 for ath10k@lists.infradead.org; Wed, 21 Aug 2013 06:34:50 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: fixes
Date: Wed, 21 Aug 2013 08:34:11 +0200
Message-ID: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
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

This patchset addresses some throughput issues.


Pozdrawiam / Best regards,
Michal Kazior.


Michal Kazior (3):
  ath10k: make the workqueue multithreaded
  ath10k: move htt rx processing to worker
  ath10k: fix issues on non-preemptible systems

 drivers/net/wireless/ath/ath10k/core.c   |    4 ++-
 drivers/net/wireless/ath/ath10k/core.h   |    7 ++++
 drivers/net/wireless/ath/ath10k/htc.c    |    4 +++
 drivers/net/wireless/ath/ath10k/htt.h    |    3 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c |   58 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi.c    |    4 +++
 6 files changed, 72 insertions(+), 8 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
