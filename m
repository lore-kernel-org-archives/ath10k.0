Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIVwS-0004fZ-G9
 for ath10k@lists.infradead.org; Tue, 15 May 2018 09:08:22 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCHv2 0/2]  ath/ath10k: DFS Host Confirmation 
Date: Tue, 15 May 2018 14:37:50 +0530
Message-Id: <1526375272-7056-1-git-send-email-srirrama@codeaurora.org>
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
To: kvalo@codeaurora.org, ath10k@lists.infradead.org
Cc: Sriram R <srirrama@codeaurora.org>, linux-wirelss@vger.kernel.org

This feature adds support for the ath10k host to send information
about the specifications of the detected radar to the firmware for validation.
A New WMI interface is added for enabling this communication
of this information between the host and the firmware.

v2:

 * Modified firmware confirmation timeout value to less than 200ms
 * Updated PATCH 2/2  commit log.

Sriram R (2):
  ath: Add support to get the detected radar specifications
  ath10k: DFS Host Confirmation

 drivers/net/wireless/ath/ath10k/core.h          |  21 +++
 drivers/net/wireless/ath/ath10k/mac.c           |  12 ++
 drivers/net/wireless/ath/ath10k/wmi-ops.h       |  32 ++++
 drivers/net/wireless/ath/ath10k/wmi.c           | 186 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.h           |  32 ++++
 drivers/net/wireless/ath/ath9k/dfs.c            |   2 +-
 drivers/net/wireless/ath/dfs_pattern_detector.c |   5 +-
 drivers/net/wireless/ath/dfs_pattern_detector.h |   3 +-
 drivers/net/wireless/ath/dfs_pri_detector.h     |   3 +-
 9 files changed, 282 insertions(+), 14 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
