Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJzOX-0006Sf-3U
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 11:51:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] net: ath: fix missing checks for bmi reads and writes
References: <20190315051903.10664-1-kjlu@umn.edu>
Date: Fri, 26 Apr 2019 14:51:51 +0300
In-Reply-To: <20190315051903.10664-1-kjlu@umn.edu> (Kangjie Lu's message of
 "Fri, 15 Mar 2019 00:19:03 -0500")
Message-ID: <87k1fhugq0.fsf@kamboji.qca.qualcomm.com>
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
To: Kangjie Lu <kjlu@umn.edu>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, pakki001@umn.edu, "David S. Miller" <davem@davemloft.net>

Kangjie Lu <kjlu@umn.edu> writes:

> ath10k_bmi_write32 and ath10k_bmi_read32 can fail. The fix
> checks their statuses to avoid potential undefined behaviors.
>
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>

[...]

> @@ -2500,8 +2515,15 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  		if (status)
>  			goto err;
>  
> -		if (ar->hif.bus == ATH10K_BUS_SDIO)
> -			ath10k_init_sdio(ar);
> +		if (ar->hif.bus == ATH10K_BUS_SDIO) {
> +			status = ath10k_init_sdio(ar);
> +			if (status) {
> +				ath10k_err(ar,
> +					   "could not init HTC (%d)\n",
> +					   status);

I'll fix the warning message as well, we are not initialisating HTC
here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
