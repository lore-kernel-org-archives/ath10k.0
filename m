Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTNRb-0007d4-HS
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 02:54:44 +0000
Received: by mail-pd0-f177.google.com with SMTP id y10so7906451pdj.8
 for <ath10k@lists.infradead.org>; Mon, 07 Oct 2013 19:54:18 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 0/2] ath10k: wep & ampdu fix
Date: Mon,  7 Oct 2013 19:51:56 -0700
Message-Id: <1381200718-16271-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
References: <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
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

One throughput fix and one bug fix.

The bug fix addresses my oversight when reworking
HTC/WMI. I haven't seen the error yet but I'm
quite certain this should be fixed.

v2:
 * A-MPDU patch contains a workaround for
   Netgear/Linksys 11ac APs
 * patchset cover mail title changed to avoid
   confusion (too many patchsets named the same
   way..)

v3:
 * fix lines over 80 chars (Kalle)
 * fix max() cast warning (Kalle)
 * rebase (Kalle)
 * add Tested-by (thanks Kalle!)


Michal Kazior (1):
  ath10k: fix scheduling while atomic bug

Sujith Manoharan (1):
  ath10k: Fix bug in max. VHT A-MPDU size

 drivers/net/wireless/ath/ath10k/core.h |  4 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 68 +++++++++++++++++++++++++---------
 2 files changed, 53 insertions(+), 19 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
