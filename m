Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJOKu-0005XT-Ab
 for ath10k@lists.infradead.org; Tue, 10 Sep 2013 13:50:33 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/7] ath10k: improve TX path
Date: Tue, 10 Sep 2013 15:49:56 +0200
Message-ID: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
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

This patchset addresses two issues:

 * system/userspace starvation on heavy briding
   UDP TX
 * unstable/inconsistent UDP TX throughput

In short the patchset simplifies TX path by
removing HTC TX workers, makes WMI commands block
and makes ath10k more responsive to queues
becoming full. This contributes to both improved
throughput and makes the system more responsive
under heavy UDP TX load.

Max stable briding TX (ath10k as TX):
 UDP w/o patchset: 520mbps
 UDP w/  patchset: 570mbps

 TCP w/o patchset: 350mbps
 TCP w/  patchset: 400mbps

Measured with two 2x2 cards, one acting as an AP
on AP135 board, the other as a STA on a core i5
laptop. The AP135 was passing traffic from a
station on LAN/eth1, to the STA/wlan0.


Michal Kazior (7):
  ath10k: simplify HTC credits calculation
  ath10k: add HTC TX credits replenishing notification
  ath10k: make WMI commands block by design
  ath10k: simplify HTC command submitting
  ath10k: improve beacon submission latency
  ath10k: remove wmi pending count limit
  ath10k: remove wmi event worker thread

 drivers/net/wireless/ath/ath10k/core.h  |    7 +-
 drivers/net/wireless/ath/ath10k/htc.c   |  215 +++++++------------------------
 drivers/net/wireless/ath/ath10k/htc.h   |    5 +-
 drivers/net/wireless/ath/ath10k/mac.c   |   16 +--
 drivers/net/wireless/ath/ath10k/trace.h |   11 +-
 drivers/net/wireless/ath/ath10k/wmi.c   |  197 +++++++++++++---------------
 drivers/net/wireless/ath/ath10k/wmi.h   |    5 +-
 7 files changed, 156 insertions(+), 300 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
