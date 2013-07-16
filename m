Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uz07N-0003wi-Cd
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:56:18 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 0/3] ath10k: hardware recovery
Date: Tue, 16 Jul 2013 09:54:34 +0200
Message-ID: <1373961277-14784-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1372148011-28234-1-git-send-email-michal.kazior@tieto.com>
References: <1372148011-28234-1-git-send-email-michal.kazior@tieto.com>
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

Respin of hw recovery. This implements recovery
from a firmware crash.

Note: this is based on my
      "ath10k: device setup refactor" patchset.

v3:
 * rename RESTARTING_ON/OFF to RESTARTING/RESTARTED
 * update commit message for 'create debufs..'

Michal Kazior (3):
  ath10k: implement device recovery
  ath10k: implement fw crash simulation command
  ath10k: create debugfs interface to trigger fw crash

 drivers/net/wireless/ath/ath10k/core.c  |   30 +++++++++
 drivers/net/wireless/ath/ath10k/core.h  |   19 ++++++
 drivers/net/wireless/ath/ath10k/debug.c |   54 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/htc.c   |    3 +
 drivers/net/wireless/ath/ath10k/mac.c   |  101 +++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/mac.h   |    1 +
 drivers/net/wireless/ath/ath10k/pci.c   |    2 +
 drivers/net/wireless/ath/ath10k/wmi.c   |   26 ++++++++
 drivers/net/wireless/ath/ath10k/wmi.h   |   19 ++++++
 9 files changed, 236 insertions(+), 19 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
