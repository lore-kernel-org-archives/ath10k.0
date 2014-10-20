Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDPw-0004Gf-37
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:36 +0000
Received: by mail-lb0-f177.google.com with SMTP id w7so3803893lbi.8
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:13 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/9] ath10k: htt rx fixes and clean ups
Date: Mon, 20 Oct 2014 15:40:29 +0200
Message-Id: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
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

I've found a couple of issues while reworking rx
path.


Michal Kazior (9):
  ath10k: don't drop control and null func Rx
  ath10k: remove unused variable
  ath10k: use ieee80211 defines for crypto param lengths
  ath10k: fix rx buffer tracing
  ath10k: deduplicate htt rx dma unmapping
  ath10k: don't drop frames aggressively
  ath10k: add extra sanity check when popping amsdu
  ath10k: don't forget to replenish after fragmented Rx
  ath10k: clear htt->rx_confused on load

 drivers/net/wireless/ath/ath10k/htt_rx.c | 91 ++++++++++++++------------------
 1 file changed, 39 insertions(+), 52 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
