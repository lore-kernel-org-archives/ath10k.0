Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97eH-0006KC-2L
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 06:00:05 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/4] ath10k: fixes
Date: Tue, 13 Aug 2013 07:59:34 +0200
Message-ID: <1376373578-2180-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
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

This patchset contains some bugfixes and
improvements.

v2:
 * fix indentation
 * use a comment instead of a no-op if clause


Michal Kazior (4):
  ath10k: fix HTT service setup
  ath10k: fix HTC endpoint worker starvation
  ath10k: implement 802.3 SNAP rx decap type A-MSDU handling
  ath10k: plug possible memory leak in WMI

 drivers/net/wireless/ath/ath10k/htc.c    |   25 +++++++++++++------------
 drivers/net/wireless/ath/ath10k/htc.h    |    3 ++-
 drivers/net/wireless/ath/ath10k/htt_rx.c |   12 ++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.c    |    1 +
 4 files changed, 26 insertions(+), 15 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
