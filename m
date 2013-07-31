Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4S56-0007Oe-1v
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 08:48:28 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: implement checksum offloading
Date: Wed, 31 Jul 2013 10:47:55 +0200
Message-ID: <1375260477-17030-1-git-send-email-michal.kazior@tieto.com>
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

This patchset adds tx and rx checksum offloading
to ath10k driver.

I don't have any hard numbers but I did observe a
consistently sligthly better performance on AP135
+ ath10k. Nothing ground breaking though.


Michal Kazior (2):
  ath10k: implement rx checksum offloading
  ath10k: implement tx checksum offloading

 drivers/net/wireless/ath/ath10k/htt_rx.c |   40 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c |    2 ++
 drivers/net/wireless/ath/ath10k/mac.c    |    2 ++
 3 files changed, 44 insertions(+)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
