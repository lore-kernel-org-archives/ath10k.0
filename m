Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1ZBp-0004fP-GR
 for ath10k@lists.infradead.org; Tue, 23 Jul 2013 09:47:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Pull request: ath-current 20130723
Date: Tue, 23 Jul 2013 12:46:57 +0300
Message-ID: <87ehapwqum.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath6kl-devel@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi John,

here's an ath6kl and ath10k pull request for 3.11-rc series.

Geert Uytterhoeven fixed an ath10k build problem when NO_DMA=y. I added
a missing MAINTAINERS entry for ath10k and updated ath6kl git tree
location.

Please let me know if there are any problems, or if you prefer me to
send them through wireless-next instead.

Kalle

The following changes since commit 64b6f46f1141ad938e354f37af62e28da972e8eb:

  ath9k_hw: Fix multicast search for AR9002 family (2013-07-18 16:22:00 -0400)

are available in the git repository at:

  git://github.com/kvalo/ath.git for-linville-current

for you to fetch changes up to 58cfb681bffb43654776a218a087028ff425ba9e:

  MAINTAINERS: update ath6kl git location (2013-07-22 12:26:12 +0300)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ath10k: ATH10K should depend on HAS_DMA

Kalle Valo (2):
      MAINTAINERS: add ath10k
      MAINTAINERS: update ath6kl git location

 MAINTAINERS                             |   10 +++++++++-
 drivers/net/wireless/ath/ath10k/Kconfig |    2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
