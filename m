Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC6iL-0007Yt-1C
 for ath10k@lists.infradead.org; Fri, 16 Jan 2015 13:13:25 +0000
Received: by mail-wi0-f170.google.com with SMTP id z2so4297056wiv.1
 for <ath10k@lists.infradead.org>; Fri, 16 Jan 2015 05:13:03 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: fix 10.2 fw stats
Date: Fri, 16 Jan 2015 14:12:06 +0100
Message-Id: <1421413928-7282-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, antonio@open-mesh.com

I've tested this briefly with main 636, 10.1.467,
10.2-00082-4 and 10.2.4.20. However I may have
missed something so I'd be glad if someone can
double-check me :-)


Michal Kazior (2):
  ath10k: split fw pdev stats parsing
  ath10k: fix 10.2 fw stats parsing

 drivers/net/wireless/ath/ath10k/wmi.c | 279 +++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath10k/wmi.h | 107 ++++++++++---
 2 files changed, 312 insertions(+), 74 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
