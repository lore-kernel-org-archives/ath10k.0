Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVYhR-0000hZ-Fp
 for ath10k@lists.infradead.org; Wed, 20 Jun 2018 08:42:47 +0000
Received: by mail-lf0-x242.google.com with SMTP id q11-v6so3685195lfc.7
 for <ath10k@lists.infradead.org>; Wed, 20 Jun 2018 01:42:32 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 0/3] ath10k: sdio: essential sdio fixes
Date: Wed, 20 Jun 2018 10:42:19 +0200
Message-Id: <20180620084222.3521-1-niklas.cassel@linaro.org>
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
Cc: Niklas Cassel <niklas.cassel@linaro.org>, netdev@vger.kernel.org, alagusankar@silex-india.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

These fixes were originally embedded in a patch
"ath10k_sdio: virtual scatter gather for receive"
posted by Alagu Sankar <alagusankar@silex-india.com>
https://patchwork.kernel.org/patch/9979579/

However, while that patch implements scatter gather
(without using the proper sg types), it also
includes several other random fixes, including
but not limited to checkpatch.pl fixes.

This patch series is an attempt to extract
the most essential fixes included in that commit.

Each fix is now an individual commit, as upstream
requires that each logical change is self contained.

All of these fixes are essential to get working
sdio support for ath10k.

Other patches are needed to get working sdio support,
including the high-latency patch series from Erik Stromdahl.


Niklas Cassel (3):
  ath10k: sdio: use same endpoint id for all packets in a bundle
  ath10k: sdio: allocate correct size for RECV_1MORE_BLOCK rx packets
  ath10k: sdio: set skb len for all rx packets

 drivers/net/wireless/ath/ath10k/htc.h  | 1 +
 drivers/net/wireless/ath/ath10k/sdio.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
