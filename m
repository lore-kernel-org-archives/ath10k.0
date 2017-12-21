Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eS3ML-0005M7-Ci
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 16:06:39 +0000
From: Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: [PATCH v2 0/3] Core changes for wcn3990
Date: Thu, 21 Dec 2017 21:35:19 +0530
Message-Id: <1513872322-26636-1-git-send-email-pillair@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

This patchset includes the core changes for wcn3990 to
- Add SNOC bus type used for wcn3990 target
- Add the debug mask for SNOC bus type
- Adding fw feature flag for non-bmi firmware load, since wcn3990
  firmware is not loaded by bmi

Changes since v1:
- Rebase the patchset on the latest ath.git

Govind Singh (2):
  ath10k: Add SNOC bus type for WCN3990 target
  ath10k: Add debug mask for SNOC bus type

Rakesh Pillai (1):
  ath10k: Add fw feature flag for non-bmi firmware load

 drivers/net/wireless/ath/ath10k/core.c  | 181 +++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/core.h  |   6 ++
 drivers/net/wireless/ath/ath10k/debug.h |   1 +
 3 files changed, 113 insertions(+), 75 deletions(-)

-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
