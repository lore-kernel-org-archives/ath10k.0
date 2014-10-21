Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xga5i-0004Vb-Du
 for ath10k@lists.infradead.org; Tue, 21 Oct 2014 14:07:14 +0000
Received: by mail-lb0-f179.google.com with SMTP id l4so1086185lbv.10
 for <ath10k@lists.infradead.org>; Tue, 21 Oct 2014 07:06:42 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: minor htt tracing fix
Date: Tue, 21 Oct 2014 15:54:58 +0200
Message-Id: <1413899700-10717-1-git-send-email-michal.kazior@tieto.com>
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

I've just noticed that rx_desc tracing is somewhat
wrong. This attempts to fix it and since the trace
function prototype changes I re-use some tracing
code as well.


Michal Kazior (2):
  ath10k: remove tsf argument from rx_desc tracing
  ath10k: re-use trace class

 drivers/net/wireless/ath/ath10k/htt_rx.c |  4 +---
 drivers/net/wireless/ath/ath10k/trace.h  | 35 +++++---------------------------
 2 files changed, 6 insertions(+), 33 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
