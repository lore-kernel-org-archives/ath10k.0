Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eefU8-0004RY-8L
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 11:14:28 +0000
Received: by mail-wm0-x244.google.com with SMTP id r78so14233035wme.0
 for <ath10k@lists.infradead.org>; Thu, 25 Jan 2018 03:14:13 -0800 (PST)
From: Tobias Schramm <tobleminer@gmail.com>
Subject: [PATCH v3 0/2] ath10k: Add support for Ubiquiti-branded QCA988X
Date: Thu, 25 Jan 2018 12:13:38 +0100
Message-Id: <20180125111340.17553-1-tobleminer@gmail.com>
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

Changes since v2:
 * Rename PCI_VENDOR_ID_UBNT to PCI_VENDOR_ID_UBIQUITI

Tobias Schramm (2):
  pci: Add vendor id of Ubiquiti Networks
  ath10k: Add support for Ubiquiti rebranded QCA988X v2

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
