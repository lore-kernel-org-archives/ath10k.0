Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNI2R-00014G-QH
 for ath10k@lists.infradead.org; Sun, 05 May 2019 14:22:49 +0000
Received: by mail-lj1-x232.google.com with SMTP id e18so8942156lja.5
 for <ath10k@lists.infradead.org>; Sun, 05 May 2019 07:22:45 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: ath10k: Two missing sdio patches
Message-ID: <1d5b4f00-2da8-b435-9122-07f93890dda9@gmail.com>
Date: Sun, 5 May 2019 16:22:42 +0200
MIME-Version: 1.0
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, wgong@codeaurora.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hej Kalle, Wen,

I see there are lots of SDIO patches coming in to the mailing ath10k list, great!

I while back I submitted two patches that adds an inline wrapper for an htt op.

patchwork:
https://patchwork.kernel.org/project/linux-wireless/list/?series=97099

Without these patches I get a panic due to calling a NULL pointer callback
with SDIO.

It is the htt->tx_ops->htt_h2t_aggr_cfg_msg() in ath10k_htt_setup() that causes the panic.

Kalle:
I notice that you don't have these patches in your pending-sdio-usb branch.

Wen:
Do you have any other patch that fixes this issue (I can't see how it can work without
these patches unless you have some other fix)?

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
