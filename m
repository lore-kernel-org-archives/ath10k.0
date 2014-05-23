Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnmpq-0004ol-R7
 for ath10k@lists.infradead.org; Fri, 23 May 2014 10:36:24 +0000
Received: by mail-ee0-f44.google.com with SMTP id c41so3478723eek.17
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 03:35:56 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: async pci probing
Date: Fri, 23 May 2014 12:28:44 +0200
Message-Id: <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
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

Recently I've tried to build ath10k into kernel
and discovered it doesn't play nice.


v2:
 * split and introduce an additional patch [2/3]
 * unbind driver upon failure


Michal Kazior (3):
  ath10k: relocate core create/destroy functions
  ath10k: remove unnecessary tasklet_kill()
  ath10k: make core registering async

 drivers/net/wireless/ath/ath10k/core.c | 171 ++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |   2 +
 drivers/net/wireless/ath/ath10k/pci.c  |   2 -
 3 files changed, 97 insertions(+), 78 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
