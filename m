Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkvD4-0002Ou-Pj
 for ath10k@lists.infradead.org; Thu, 15 May 2014 12:56:31 +0000
Received: by mail-ee0-f47.google.com with SMTP id c13so639164eek.34
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 05:56:06 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: pci fixes 2014-05-15
Date: Thu, 15 May 2014 14:48:56 +0200
Message-Id: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
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

Patches 1 and 2 were made as a result of analysing
`ath10k firmware crash after 4 hours of heavy TCP
traffic` bug reported by Avery.

Patch 3 fixes a bug reported by Avery that was
apparently related to missing memory barriers on
his ARM test system. @Avery, can you take a look
or test it, please? I was never able to reproduce
this but it just seems like the right thing to do.
Or you can simply post your patch and I'll drop
mine then.

Note: this is based on ath-next-test branch.


Michal Kazior (3):
  ath10k: protect src_ring state with ce_lock in tx_sg()
  ath10k: revert incomplete scatter-gather pci tx
  ath10k: add explicit memory barrier for ring index update

 drivers/net/wireless/ath/ath10k/ce.c  | 29 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/ce.h  |  2 ++
 drivers/net/wireless/ath/ath10k/pci.c | 27 ++++++++++++++++++---------
 3 files changed, 49 insertions(+), 9 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
