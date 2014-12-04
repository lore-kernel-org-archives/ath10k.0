Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwaLY-0007iQ-4X
 for ath10k@lists.infradead.org; Thu, 04 Dec 2014 17:37:44 +0000
From: "Oh, Peter" <poh@qca.qualcomm.com>
Subject: RE: [PATCH v2 0/2] ath10k: NF calibration period debugfs file
Date: Thu, 4 Dec 2014 17:37:01 +0000
Message-ID: <1240abdd13da409ab749b4e720e300fd@NASANEXM01B.na.qualcomm.com>
References: <20141202110443.14817.85639.stgit@potku.adurom.net>
In-Reply-To: <20141202110443.14817.85639.stgit@potku.adurom.net>
Content-Language: en-US
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

That sounds good to me.

Thanks,
Peter

-----Original Message-----
From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Kalle Valo
Sent: Tuesday, December 02, 2014 3:07 AM
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/2] ath10k: NF calibration period debugfs file

Hi,

here are some changes I made to Peter's NF calibdation period patches. Please review.

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

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
