Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x234.google.com ([2a00:1450:4013:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi1ZO-0007C2-LN
 for ath10k@lists.infradead.org; Wed, 07 May 2014 13:07:35 +0000
Received: by mail-ee0-f52.google.com with SMTP id e53so729847eek.39
 for <ath10k@lists.infradead.org>; Wed, 07 May 2014 06:07:10 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: 2014-05-07 fixes
Date: Wed,  7 May 2014 14:33:24 +0200
Message-Id: <1399466006-5556-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

Hi,

These 2 patches address kernel panics reported by
Avery recently. One of them was most likely
reported by Ben some time ago already.

I've never seen these panics myself. It'd be great
if you guys could give it a try and (assuming
you're capable of reproducing) see if it actually
helps.


Michal Kazior (2):
  ath10k: fix htt rx ring clean up
  ath10k: fix handling of wierd MSDU chaining cases

 drivers/net/wireless/ath/ath10k/htt_rx.c | 56 +++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 16 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
