Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eecAp-0003k5-Fo
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 07:42:17 +0000
Received: by mail-wm0-x241.google.com with SMTP id 143so12771329wma.5
 for <ath10k@lists.infradead.org>; Wed, 24 Jan 2018 23:42:05 -0800 (PST)
From: Tobias Schramm <tobleminer@gmail.com>
Subject: [PATCH v2 0/2] ath10k: Add support for Ubiquiti-branded QCA988X
Date: Thu, 25 Jan 2018 08:41:29 +0100
Message-Id: <20180125074131.30622-1-tobleminer@gmail.com>
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
To: kvalo@qca.qualcomm.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org
Cc: Tobias Schramm <tobleminer@gmail.com>

A lot of more modern Ubiquiti AirMAX wireless devices contain a rebranded
QCA988X with changed PCI vendor and device id.
This patch adds support for those chips by treating them as QCA988X rev2
radios.

Changes since v1:
 * Send patch to more people and lists


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
