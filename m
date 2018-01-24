Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eeQx2-0005sm-Je
 for ath10k@lists.infradead.org; Wed, 24 Jan 2018 19:43:18 +0000
Received: by mail-wr0-x242.google.com with SMTP id z48so5250567wrz.6
 for <ath10k@lists.infradead.org>; Wed, 24 Jan 2018 11:43:05 -0800 (PST)
From: Tobias Schramm <tobleminer@gmail.com>
Subject: [PATCH 0/2] ath10: Add support for Ubiquiti-branded QCA988X
Date: Wed, 24 Jan 2018 20:42:16 +0100
Message-Id: <20180124194218.11408-1-tobleminer@gmail.com>
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
To: ath10k@lists.infradead.org, kvalo@qca.qualcomm.com
Cc: Tobias Schramm <tobleminer@gmail.com>

A lot of more modern Ubiquiti AirMAX wireless devices contain a rebranded
QCA988X with changed PCI vendor and device id.
This patch adds support for those chips by treating them as QCA988X rev2
radios.

Tobias Schramm (2):
  pci: Add vendor id of Ubiquiti Networks
  ath10k: Add support for Uiquiti rebranded QCA988X v2

 drivers/net/wireless/ath/ath10k/core.c | 24 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  1 +
 drivers/net/wireless/ath/ath10k/pci.c  |  4 ++++
 include/linux/pci_ids.h                |  2 ++
 4 files changed, 31 insertions(+)

-- 
2.16.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
