Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fT2X3-0003A4-B9
 for ath10k@lists.infradead.org; Wed, 13 Jun 2018 09:57:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC PATCH] ath10k: ath10k_snoc_get_ce_id_from_irq() can be static
References: <20180612113907.15043-2-niklas.cassel@linaro.org>
 <20180612145037.GA95182@lkp-ib03>
Date: Wed, 13 Jun 2018 12:57:22 +0300
In-Reply-To: <20180612145037.GA95182@lkp-ib03> (kbuild test robot's message of
 "Tue, 12 Jun 2018 22:50:37 +0800")
Message-ID: <87d0wvau0t.fsf@kamboji.qca.qualcomm.com>
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
To: kbuild test robot <fengguang.wu@intel.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kbuild-all@01.org, Niklas Cassel <niklas.cassel@linaro.org>, "David S. Miller" <davem@davemloft.net>

kbuild test robot <fengguang.wu@intel.com> writes:

> Fixes: aecf55e7df3a ("ath10k: allow ATH10K_SNOC with COMPILE_TEST")
> Signed-off-by: kbuild test robot <fengguang.wu@intel.com>

There's already an identical patch pending:

ath10k: make some functions static

https://patchwork.kernel.org/patch/10440159/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
