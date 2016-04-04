Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anDnU-0003hz-GR
 for ath10k@lists.infradead.org; Mon, 04 Apr 2016 23:20:40 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 0/3]  ath10k: add a support of set_tsf on vdev interface
Date: Mon, 4 Apr 2016 16:19:13 -0700
Message-ID: <1459811956-26186-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

10.2.4 and 10.4 firmware has introduced new function to
set TSF via vdev parameter.
set_tsf function can be used to shift TBTT that will help
avoid its clockdrift which happens when beacons are collided.

Peter Oh (3):
  ath10k: add a support of set_tsf on vdev interface
  ath10k: update 10.4 WMI vdev parameters
  ath10k: enable set_tsf vdev command to WMI 10.4

 drivers/net/wireless/ath/ath10k/mac.c     | 27 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c     |  4 ++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  8 ++++++++
 4 files changed, 40 insertions(+)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
