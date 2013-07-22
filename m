Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1F0A-0007vw-Vr
 for ath10k@lists.infradead.org; Mon, 22 Jul 2013 12:14:07 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/4] ath10k: fixes
Date: Mon, 22 Jul 2013 14:13:27 +0200
Message-ID: <1374495211-20353-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
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

Here are some fixes for ath10k. The rts threshold
patch addresses my mistake in commit
9aeb6fe53d1f0d6e58658484ce9ad7b59f0ef16b which
caused rts to be always enabled causing throughput
issues in some cases.

v2: first patch is split now into two as requested
    rebased on top of latest github master branch


Michal Kazior (4):
  ath10k: prevent HTC from being used after stopping
  ath10k: don't reset HTC endpoints unnecessarily
  ath10k: fix memleak in mac setup
  ath10k: fix rts/fragmentation threshold setup

 drivers/net/wireless/ath/ath10k/htc.c |   28 ++++++------
 drivers/net/wireless/ath/ath10k/htc.h |    4 +-
 drivers/net/wireless/ath/ath10k/mac.c |   80 ++++++++++++++++++---------------
 3 files changed, 58 insertions(+), 54 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
