Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVPOX-0003y5-VD
 for ath10k@lists.infradead.org; Tue, 19 Jun 2018 22:46:39 +0000
Received: by mail-lf0-x243.google.com with SMTP id d24-v6so1934360lfa.8
 for <ath10k@lists.infradead.org>; Tue, 19 Jun 2018 15:46:27 -0700 (PDT)
Date: Wed, 20 Jun 2018 00:46:23 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 4/6] ath10k: Add debug mask for QMI layer
Message-ID: <20180619224623.GC1635@centauri.lan>
References: <20180605123651.1589-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180605123651.1589-1-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org

Acked-by: Niklas Cassel <niklas.cassel@linaro.org>

On Tue, Jun 05, 2018 at 06:06:51PM +0530, Govind Singh wrote:
> Add debug mask to control debug info of ath10k qmi
> messaging layer.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/debug.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
> index 0afca5c106b6..a2f84fdb9131 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.h
> +++ b/drivers/net/wireless/ath/ath10k/debug.h
> @@ -44,6 +44,7 @@ enum ath10k_debug_mask {
>  	ATH10K_DBG_USB		= 0x00040000,
>  	ATH10K_DBG_USB_BULK	= 0x00080000,
>  	ATH10K_DBG_SNOC		= 0x00100000,
> +	ATH10K_DBG_QMI		= 0x00200000,
>  	ATH10K_DBG_ANY		= 0xffffffff,
>  };
>  
> -- 
> 2.17.0
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
