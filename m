Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzOo9-00089n-9N
 for ath10k@lists.infradead.org; Fri, 12 Dec 2014 11:54:54 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so2226740wiw.13
 for <ath10k@lists.infradead.org>; Fri, 12 Dec 2014 03:54:30 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/5] ath10k: a bunch of STA-related fixes
Date: Fri, 12 Dec 2014 12:41:34 +0100
Message-Id: <1418384499-31660-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
References: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
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


Michal Kazior (5):
  ath10k: improve 11b coex
  ath10k: fix STA u-APSD
  ath10k: prevent invalid ps timeout config
  ath10k: enable per-vif sta powersave
  ath10k: advertise p2p dev support

 drivers/net/wireless/ath/ath10k/core.c |   6 --
 drivers/net/wireless/ath/ath10k/mac.c  | 127 ++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/wmi.h  |   7 ++
 3 files changed, 115 insertions(+), 25 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
