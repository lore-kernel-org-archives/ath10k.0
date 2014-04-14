Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZbI9-0001oy-6C
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 07:26:57 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so6269521eei.28
 for <ath10k@lists.infradead.org>; Mon, 14 Apr 2014 00:26:34 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 0/4] ath10k: AP-related fixes
Date: Mon, 14 Apr 2014 09:20:06 +0200
Message-Id: <1397460010-19153-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
References: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This is a bunch of fixes I've found while
investigating tx credit issues.

I've only experienced problem fixed by 4/4
firsthand. Other patches are preemptive fixes :-)

v2:
 * minor tweaks

Michal Kazior (4):
  ath10k: make sure to not leak beacon dma mapping
  ath10k: make sure to not use invalid beacon pointer
  ath10k: prevent beacon memory leak
  ath10k: fix firmware recovery with ap interface

 drivers/net/wireless/ath/ath10k/mac.c | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c |  2 ++
 2 files changed, 18 insertions(+)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
