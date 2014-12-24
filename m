Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3grD-0001IP-Vs
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 07:59:48 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 0/8] ath10k: add per station debugfs support
Date: Wed, 24 Dec 2014 13:29:01 +0530
Message-ID: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

The following patches add support for sending addba/addba response/delba
for every station entries. These commands are purely for testing purpose.

Before using any of the above aggregation commands, the mode should be moved
to manual. To disable automatic aggretation in target

echo 1 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
        stations/XX:XX:XX:XX:XX:XX/aggr_mode

Then for sending addba request,

echo 1 32 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
        stations/XX:XX:XX:XX:XX:XX/addba

To send addba response,

echo 0 25 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
        stations/XX:XX:XX:XX:XX:XX/addba_resp

And for delba,

echo 0 1 37 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
        stations/XX:XX:XX:XX:XX:XX/delba

v2: Rebased on top of 10.2.4 WMI ops support

Rajkumar Manoharan (8):
  ath10k: add wmi support for addba_clear_resp
  ath10k: add wmi support for addba_send
  ath10k: add wmi support for addba_set_resp
  ath10k: add wmi support for delba_send
  ath10k: Implement sta_add_debugfs
  ath10k: add support to send addba request
  ath10k: add support to send addba response
  ath10k: add support to send delba

 drivers/net/wireless/ath/ath10k/Makefile      |   1 +
 drivers/net/wireless/ath/ath10k/core.h        |   5 +
 drivers/net/wireless/ath/ath10k/debug.h       |  11 +-
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 256 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c         |   3 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h     |  78 ++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c     |   4 +
 drivers/net/wireless/ath/ath10k/wmi.c         | 119 ++++++++++++
 8 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/debugfs_sta.c

-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
