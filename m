Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwm4-0006h0-PB
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 16:04:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ath10k: avoid possible memory access violation
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1533292805-9709-1-git-send-email-vijay.bvb@samsung.com>
References: <1533292805-9709-1-git-send-email-vijay.bvb@samsung.com>
Message-Id: <20180906160442.77CA6607F7@smtp.codeaurora.org>
Date: Thu,  6 Sep 2018 16:04:42 +0000 (UTC)
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
To: "K.T.VIJAYAKUMAAR" <vijay.bvb@samsung.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, cpgs@samsung.com, davem@davemloft.net

"K.T.VIJAYAKUMAAR" <vijay.bvb@samsung.com> wrote:

> array "ctl_power_table" access index "pream" is initialized with -1 and
> is raised as a static analysis tool issue.
> [drivers\net\wireless\ath\ath10k\wmi.c:4719] ->
> [drivers\net\wireless\ath\ath10k\wmi.c:4730]: (error) Array index -1 is
> out of bounds.
> 
> Since the "pream" index for accessing ctl_power_table array is initialized
> with -1, there is a chance of memory access violation for the cases below.
> 1) wmi_pdev_tpc_final_table_event change frequency is between 2483 and 5180
> 2) pream_idx is out of the enumeration ranges of wmi_tpc_pream_2ghz,
> wmi_tpc_pream_5ghz
> 
> Signed-off-by: K.T.VIJAYAKUMAAR <vijay.bvb@samsung.com>
> [kvalo@codeaurora.org: clean up the warning message]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

97c69a70dc2c ath10k: avoid possible memory access violation

-- 
https://patchwork.kernel.org/patch/10554929/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
