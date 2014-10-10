Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcXtQ-0000VQ-09
 for ath10k@lists.infradead.org; Fri, 10 Oct 2014 10:57:52 +0000
Received: by mail-wi0-f182.google.com with SMTP id n3so1655126wiv.3
 for <ath10k@lists.infradead.org>; Fri, 10 Oct 2014 03:57:29 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: assoc clean ups 2014-10-10
Date: Fri, 10 Oct 2014 12:46:14 +0200
Message-Id: <1412937977-5859-1-git-send-email-michal.kazior@tieto.com>
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

This is a bunch of assoc-related clean ups.


Michal Kazior (3):
  ath10k: clean up assoc code
  ath10k: skip some commands on reassoc
  ath10k: clean up sta auth/assoc code

 drivers/net/wireless/ath/ath10k/mac.c | 267 +++++++++++++++-------------------
 1 file changed, 117 insertions(+), 150 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
