Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkYxc-0007fG-7r
 for ath10k@lists.infradead.org; Wed, 14 May 2014 13:11:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Pull request: ath 20140514
Date: Wed, 14 May 2014 16:10:35 +0300
Message-ID: <87zjikfqus.fsf@kamboji.qca.qualcomm.com>
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
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi John,

small pull request this time. I'll promise next one will be bigger ;)

Changelog for the request:

For ath10k Michal did various small fixes on how we handle
hardware/firmware problems and he also fixed two memory leaks.

Please let me know if there are any problems.

The following changes since commit 644aa4d62096039a79987e13062c6fc656ea380c:

  b43: remove list of IEEE 802.11 devices (2014-04-22 15:06:34 -0400)

are available in the git repository at:

  git://github.com/kvalo/ath.git for-linville

for you to fetch changes up to d9bc4b9b693d52dc14dc1de5dfec760634067d8c:

  ath10k: fix firmware recovery with ap interface (2014-04-24 09:23:03 +0300)

----------------------------------------------------------------
Michal Kazior (7):
      ath10k: differentiate between target init failures
      ath10k: don't wait for device init if it crashed
      ath10k: skip suspending when recovering
      ath10k: make sure to not leak beacon dma mapping
      ath10k: make sure to not use invalid beacon pointer
      ath10k: prevent beacon memory leak
      ath10k: fix firmware recovery with ap interface

 drivers/net/wireless/ath/ath10k/core.c |    6 ++++--
 drivers/net/wireless/ath/ath10k/mac.c  |   16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/pci.c  |   18 +++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.c  |    2 ++
 4 files changed, 39 insertions(+), 3 deletions(-)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
