Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0ASb-0007WH-N8
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 14:15:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Pull request: ath-current 20140626
Date: Thu, 26 Jun 2014 17:15:02 +0300
Message-ID: <878uojzrix.fsf@kamboji.qca.qualcomm.com>
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

here's a pull request with two ath10k patches I would like to get into
3.16. Both of the changes are small and pretty safe. Change log:

Bartosz fixed an issue where we were not able to create 8 vdevs when
using DFS. Michal removed a false warning which was just confusing
people.

The following changes since commit a715c7ddd65a1a3b2839b8ebd759bb2d361f7675:

  wil6210: improve debug for WMI receive (2014-05-30 13:49:34 -0400)

are available in the git repository at:

  git://github.com/kvalo/ath.git ath-current

for you to fetch changes up to dfa413de1e4388818f7dcdce0a90d6212e74895b:

  ath10k: fix 8th virtual AP interface with DFS (2014-06-02 21:44:53 +0300)

----------------------------------------------------------------
Bartosz Markowski (1):
      ath10k: fix 8th virtual AP interface with DFS

Michal Kazior (1):
      ath10k: remove unnecessary htt rx corruption check

 drivers/net/wireless/ath/ath10k/core.c   |    6 +++++-
 drivers/net/wireless/ath/ath10k/htt_rx.c |   18 ------------------
 2 files changed, 5 insertions(+), 19 deletions(-)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
