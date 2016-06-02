Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8T3M-0006pG-Sx
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 13:52:53 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Bug 119151 - [regression] ath10k no longer authenitcates and freezes
 system
Date: Thu, 2 Jun 2016 13:52:24 +0000
Message-ID: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <62D739F568493F4BB55C5554EB50DCA0@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Hi,

there's a regression in ath10k:

https://bugzilla.kernel.org/show_bug.cgi?id=119151

Reporter bisected it to this:

5c86d97bcc1d42ce7f75685a61be4dad34ee8183 is the first bad commit
commit 5c86d97bcc1d42ce7f75685a61be4dad34ee8183
Author: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Date:   Tue Mar 22 17:22:19 2016 +0530

ath10k: combine txrx and replenish task

Since tx completion and rx indication processing are moved out
of txrx tasklet and rx ring lock contention also removed from txrx
for rx_ind messages, it would be efficient to combine both replenish
and txrx tasks. Refill threshold is adjusted for both AP135 and AP148
(low and high end systems). With this adjustment in AP135, TCP DL is
improved from 603 Mbps to 620 Mbps and UDP DL is improved from 758 Mbps
to 803 Mbps. Also no watchdog are observed on UDP BiDi.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
