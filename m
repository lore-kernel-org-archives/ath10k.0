Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Worre-0004Iv-9Y
 for ath10k@lists.infradead.org; Mon, 26 May 2014 10:10:43 +0000
Received: by mail-wi0-f177.google.com with SMTP id f8so4057380wiw.16
 for <ath10k@lists.infradead.org>; Mon, 26 May 2014 03:10:18 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/2] ath10k: pci fixes 2014-05-15
Date: Mon, 26 May 2014 12:02:57 +0200
Message-Id: <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

Hi,

Patches are a result of analysing `ath10k firmware
crash after 4 hours of heavy TCP traffic` bug
reported by Avery.

v2:
 * dropped patch 3/3 (memory barrier addition) [Kalle]

Based on github.com/kvalo/ath/master


Michal Kazior (2):
  ath10k: protect src_ring state with ce_lock in tx_sg()
  ath10k: abort incomplete scatter-gather pci tx properly

 drivers/net/wireless/ath/ath10k/ce.c  | 27 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/ce.h  |  2 ++
 drivers/net/wireless/ath/ath10k/pci.c | 27 ++++++++++++++++++---------
 3 files changed, 47 insertions(+), 9 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
