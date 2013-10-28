Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VagCb-0004Fm-Sd
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 06:21:26 +0000
Received: by mail-ee0-f43.google.com with SMTP id b47so1703030eek.30
 for <ath10k@lists.infradead.org>; Sun, 27 Oct 2013 23:21:02 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: memory leak fixes
Date: Mon, 28 Oct 2013 07:18:12 +0100
Message-Id: <1382941094-3291-1-git-send-email-michal.kazior@tieto.com>
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

Michal Kazior (2):
  ath10k: plug memory leak in wmi mgmt tx worker
  ath10k: plug memory leak on beacon tx

 drivers/net/wireless/ath/ath10k/mac.c |  4 +++-
 drivers/net/wireless/ath/ath10k/wmi.c | 11 +++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
