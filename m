Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afq0w-0007ab-8F
 for ath10k@lists.infradead.org; Tue, 15 Mar 2016 14:32:03 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 0/2] Parsing per station rx duration for 10.4
Date: Tue, 15 Mar 2016 20:00:48 +0530
Message-ID: <1458052250-2529-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Peer Stats for 10.4 is enabled by Extended Resource Configuration
API (based on one of the earlier patch from Raja Mani), and parsing
of the same is based also 'stats_id' which also provides backward
compatibility with older f/w (or) ath10k by design

review help:

1. Fixed documentation related comments from Kalle / Michal
2. Fixed indentation related comments from Michal
3. Removed the check for excluding peer stats for test mode (Michal)
4. Fix checking for peer stats feature enabled

Dependency over

[PATCH v5] ath10k: Enable debugfs provision to enable Peer Stats

Mohammed Shafi Shajakhan (1):
  ath10k: Enable parsing per station rx duration for 10.4

Raja Mani (1):
  ath10k: Introduce Extended Resource Config support for 10.4

 drivers/net/wireless/ath/ath10k/core.c    |   19 +++++++++-
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   23 ++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   54 +++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi.h     |   49 +++++++++++++++++++++++++-
 4 files changed, 137 insertions(+), 8 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
