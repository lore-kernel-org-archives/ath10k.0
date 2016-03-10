Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adxav-0004rY-20
 for ath10k@lists.infradead.org; Thu, 10 Mar 2016 10:14:07 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 0/3] ath10k: add calibration data download support for qca4019
Date: Thu, 10 Mar 2016 15:42:35 +0530
Message-ID: <1457604758-14454-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

The necessary update in dt binding doc
(Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt) is done
in below patch and it's posted separately,
  
  "dt: bindings: add new dt entry for pre calibration in qcom,ath10k.txt"

Raja Mani (3):
  ath10k: pass cal data location as an argument to
    ath10k_download_cal_{file|dt}
  ath10k: move cal data len to hw_params
  ath10k: incorporate qca4019 cal data download sequence

 drivers/net/wireless/ath/ath10k/core.c  | 120 ++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/core.h  |  12 +++-
 drivers/net/wireless/ath/ath10k/debug.c |   7 +-
 drivers/net/wireless/ath/ath10k/hw.h    |   2 -
 4 files changed, 120 insertions(+), 21 deletions(-)

-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
