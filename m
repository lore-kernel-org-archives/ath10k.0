Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brP0z-0001B2-2c
 for ath10k@lists.infradead.org; Tue, 04 Oct 2016 12:40:12 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 0/2] ath10k: Trivial cleanup in HTT tx buffer allocation
Date: Tue, 4 Oct 2016 18:09:30 +0530
Message-ID: <1475584772-4091-1-git-send-email-mohammed@qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Pre-requisite cleanup changes for one time tx buffer allocation
to avoid contigous DMA tx buffer allocation failure for tx
(thanks Vasanth) for long hour stress testing with continuous wifi
down/up with multiple vaps in low memory systems. This change also
holds good as a trivial standalone cleanup change

Mohammed Shafi Shajakhan (2):
  ath10k: clean up HTT tx buffer allocation and free
  ath10k: Remove extraneous error message in tx alloc

 drivers/net/wireless/ath/ath10k/htt_tx.c | 80 +++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 28 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
