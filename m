Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7hpl-0005e1-DG
 for ath10k@lists.infradead.org; Fri, 09 Aug 2013 08:14:06 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: firmware-related updates
Date: Fri, 9 Aug 2013 10:13:31 +0200
Message-ID: <1376036014-29707-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
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

Hi,

This patchset contains 2 firmware-related upgrades
and 1 fix (that I though is a good pick to include
here, since it's related with HTT tx).

This keeps backward compatbility with old
firmware.

This includes fixes for issues pointed out during
RFC review.


Pozdrawiam / Best regards,
Michal Kazior.


Michal Kazior (3):
  ath10k: clean up HTT tx tid handling
  ath10k: add support for firmware newer than 636
  ath10k: add support for HTT 3.0

 drivers/net/wireless/ath/ath10k/core.h   |   10 ++++
 drivers/net/wireless/ath/ath10k/htt.c    |   19 +++-----
 drivers/net/wireless/ath/ath10k/htt.h    |   12 +++--
 drivers/net/wireless/ath/ath10k/htt_tx.c |   74 +++++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/hw.h     |    3 ++
 drivers/net/wireless/ath/ath10k/mac.c    |   18 ++++++--
 drivers/net/wireless/ath/ath10k/wmi.c    |   32 +++++++++----
 drivers/net/wireless/ath/ath10k/wmi.h    |   16 +++++--
 8 files changed, 131 insertions(+), 53 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
