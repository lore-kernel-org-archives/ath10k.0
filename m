Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYhM-0007AG-73
 for ath10k@lists.infradead.org; Tue, 02 Aug 2016 12:21:30 +0000
Received: by mail-lf0-x234.google.com with SMTP id l69so136907300lfg.1
 for <ath10k@lists.infradead.org>; Tue, 02 Aug 2016 05:21:05 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 0/2] platform regulatory support
Date: Tue,  2 Aug 2016 14:20:52 +0200
Message-Id: <1470140454-3899-1-git-send-email-bartosz.markowski@tieto.com>
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

Hardware or platform manufacturers may want to use a persistent
memory storage to program ragulatory settings via e.g. bios, uefi, acpi.

This patch set implements methods to retrieve the platform regulatory
settings (via ACPI calls) and use them to override the wifi chip
eeprom default settings.

This has been developed and tested on Skylake (Chromebook) platform, where the
persistent area containing "region" value is called VPD.

Bartosz Markowski (1):
  ath10k: add platform regulatory domain support

Michal Kazior (1):
  ath: export alpha2 helper

 drivers/net/wireless/ath/ath10k/core.h |   1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 117 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c  |   2 +-
 drivers/net/wireless/ath/regd.c        |   3 +-
 drivers/net/wireless/ath/regd.h        |   1 +
 5 files changed, 122 insertions(+), 2 deletions(-)

-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
