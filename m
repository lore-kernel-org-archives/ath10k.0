Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvh3-00057D-RR
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 12:54:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/6] ath10k: use clean packet headers
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
 <20190409190851.4557-2-erik.stromdahl@gmail.com>
Date: Fri, 12 Apr 2019 15:54:03 +0300
In-Reply-To: <20190409190851.4557-2-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Tue, 9 Apr 2019 21:08:46 +0200")
Message-ID: <878swfe650.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> From: Alagu Sankar <alagusankar@silex-india.com>
>
> HTC header carries junk values that may be interpreted by the firmware
> differently. Enable credit update only if flow control is enabled for
> the corresponding endpoint.
>
> PLL clock setting sequence does not mask the PLL_CONTROL
> register value. Side effect of not masking the values is not known as
> the entire pll clock setting sequence is undocumented.

One logical change per patch, please. So this should be split to two.

> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>

Erik's s-o-b missing. 

> --- a/drivers/net/wireless/ath/ath10k/hw.c
> +++ b/drivers/net/wireless/ath/ath10k/hw.c
> @@ -814,6 +814,8 @@ static int ath10k_hw_qca6174_enable_pll_clock(struct ath10k *ar)
>  	if (ret)
>  		return -EINVAL;
>  
> +	reg_val &= ~(WLAN_PLL_CONTROL_REFDIV_MASK | WLAN_PLL_CONTROL_DIV_MASK |
> +		     WLAN_PLL_CONTROL_NOPWD_MASK);
>  	reg_val |= (SM(hw_clk->refdiv, WLAN_PLL_CONTROL_REFDIV) |
>  		    SM(hw_clk->div, WLAN_PLL_CONTROL_DIV) |
>  		    SM(1, WLAN_PLL_CONTROL_NOPWD));

The commit log mentions that there are no visible changes after this
patch. So why add it? :)

And do note that this also changes functionality for QCA6174 and QCA9377
PCI devices, so we have to be careful here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
