Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUx1t-00084q-6U
 for ath10k@lists.infradead.org; Mon, 09 Mar 2015 12:43:30 +0000
Received: by labgd6 with SMTP id gd6so23508879lab.6
 for <ath10k@lists.infradead.org>; Mon, 09 Mar 2015 05:43:06 -0700 (PDT)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH v3 0/3] ath10k: add basic tdls support
Date: Mon,  9 Mar 2015 13:45:35 +0100
Message-Id: <1425905138-9966-1-git-send-email-marek.puzyniak@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org

This patchset introduces tdls funtionality without tdls peer uapsd
and tdls channel switching. Tdls is supported by qca6174 hardware 
what is indicated by firmware through supported services.
Tdls station when authorized requires some parameters that are filled in 
by rate control initialization. Rate control for tdls is initialized
at proper time in mac80211 patch:
mac80211: initialize rate control earlier for tdls station

So tdls funtionality implemented by this patchset depends on 
mac80211: initialize rate control earlier for tdls station
already sent for review by Arik Nemtsov.


v2:
-introduce tdls peer counter
-minor changes after review

v3:
-more minor changes after review
-replace tdls peer counter variable by iterate station function

Marek Puzyniak (2):
  ath10k: make peer type configurable
  ath10k: introduce basic tdls functionality

Michal Kazior (1):
  ath10k: unify tx mode and dispatch

 drivers/net/wireless/ath/ath10k/core.h    |   2 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |   8 -
 drivers/net/wireless/ath/ath10k/htt_tx.c  |  30 ++-
 drivers/net/wireless/ath/ath10k/mac.c     | 318 +++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/mac.h     |   8 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  50 ++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 158 ++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  53 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   3 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |  43 ++++
 10 files changed, 597 insertions(+), 76 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
