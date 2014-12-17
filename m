Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1GR1-0005iE-RV
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 15:22:45 +0000
Received: by mail-wi0-f175.google.com with SMTP id l15so16143149wiw.8
 for <ath10k@lists.infradead.org>; Wed, 17 Dec 2014 07:22:14 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 0/5] ath10k: new beaconning methods for AP/GO/IBSS
Date: Wed, 17 Dec 2014 16:21:46 +0100
Message-Id: <1418829711-19713-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This is a continuation of the new wmi-tlv backed series from Michal,
preparing for a new hardware support for ath10k.

I'm sending this for a first review round, since Michal has started
his holiday break already.

Michal Kazior (5):
  ath10k: implement new beacon tx status event
  ath10k: implement beacon template command
  ath10k: implement prb tmpl wmi command
  ath10k: implement p2p bcn ie command
  ath10k: implement support for ap beacon offloading

 drivers/net/wireless/ath/ath10k/mac.c     | 158 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  57 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 206 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  34 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   9 ++
 5 files changed, 464 insertions(+)

-- 
1.8.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
