Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvlIU-0002n2-Rc
 for ath10k@lists.infradead.org; Tue, 02 Dec 2014 11:07:11 +0000
Subject: [PATCH v2 0/2] ath10k: NF calibration period debugfs file
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 2 Dec 2014 13:06:31 +0200
Message-ID: <20141202110443.14817.85639.stgit@potku.adurom.net>
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

Hi,

here are some changes I made to Peter's NF calibdation period patches. Please
review.

v2:

* add _MAX define

* support firmware restart

* set cal_period in wmi_tlv_pdev_param_map

* simplify ar->state check

* rename debugfs file to nf_cal_period to not confuse with cal_data
  file (which is about calibration data)

* WMI_10X_PDEV_PEER_STA_PS_STATECHG_ENABLE -> WMI_10X_PDEV_PARAM_PEER_STA_PS_STATECHG_ENABLE

---

Peter Oh (2):
      ath10k: add new pdev parameters for fw 10.2
      ath10k: add new wmi interface of NF cal period


 drivers/net/wireless/ath/ath10k/core.h    |    1 
 drivers/net/wireless/ath/ath10k/debug.c   |   80 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |    1 
 drivers/net/wireless/ath/ath10k/wmi.c     |    2 +
 drivers/net/wireless/ath/ath10k/wmi.h     |    7 +++
 5 files changed, 91 insertions(+)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
