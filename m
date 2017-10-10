Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1oND-0005xS-8r
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 06:50:43 +0000
From: <mpubbise@qti.qualcomm.com>
Subject: [PATCH 0/2] ath10k: more on tdls support for 10.4 firmwares
Date: Tue, 10 Oct 2017 12:20:00 +0530
Message-ID: <1507618202-25473-1-git-send-email-mpubbise@qti.qualcomm.com>
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
Cc: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>

This patchset includes a bug fix and an enhancement of tdls functionality
for 10.4 firmwares.

First patch in this series is a bug fix, second one is an enhancement.

Manikanta Pubbisetty (2):
  ath10k: update tdls teardown state to target
  ath10k: handle tdls peer events

 drivers/net/wireless/ath/ath10k/mac.c |   10 ++++++
 drivers/net/wireless/ath/ath10k/wmi.c |   59 +++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
