Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJw6k-0006Ka-UO
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 08:53:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix disabling of UART debugging
References: <d492617ed38eb7953401c3171bb3e08c48b7b431.1570976384.git.ps@pks.im>
Date: Mon, 14 Oct 2019 11:53:34 +0300
In-Reply-To: <d492617ed38eb7953401c3171bb3e08c48b7b431.1570976384.git.ps@pks.im>
 (Patrick Steinhardt's message of "Sun, 13 Oct 2019 16:20:08 +0200")
Message-ID: <875zkrzp0x.fsf@kamboji.qca.qualcomm.com>
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
To: Patrick Steinhardt <ps@pks.im>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

+ linux-wireless

Patrick Steinhardt <ps@pks.im> writes:

> Starting with v5.3.0, it was observed that throughput of an access point
> with QCA988x-based wireless chip is severely degraded from at least
> 10MB/s to roughly 200KB/s. A bisect of the issue points to commit
> 4504f0e5b571 (ath10k: sdio: workaround firmware UART pin configuration
> bug, 2019-04-19), which employs a workaround for a firmware bug in some
> QCA6174 SDIO devices.
>
> If UART debugging is disabled via the "ath10k.uart_print" module
> parameter, then the UART initialization code is skipped. With the new
> workaround introduced in the mentioned commit, devices that need the
> workaround will also re-set the UART pin of the device to avoid a
> failing SDIO interrupt. But in fact, the change effectively removed the
> early return for all devices that do not use the workaround, and as a
> result UART debugging is now unconditionally turned on disregarding the
> value of "ath10k.uart_print", causing the decrease in throughput.
>
> Fix the issue by re-introducing the early return for all devices again,
> independent of the UART pin workaround. Tests show that throughput is
> back to normal levels again with this fix.
>
> Fixes: 4504f0e5b571 ("ath10k: sdio: workaround firmware UART pin configuration bug")
> Signed-off-by: Patrick Steinhardt <ps@pks.im>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index dc45d16e8d21..8e4ca231634d 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2125,9 +2125,10 @@ static int ath10k_init_uart(struct ath10k *ar)
>  			ath10k_warn(ar, "failed to set UART TX pin: %d", ret);
>  			return ret;
>  		}
> +	}
>  
> +	if (!uart_print)
>  		return 0;
> -	}

This was fixed in -next with a similar (but not identical) patch, but as
there have been multiple reports of this issues I have now cherry picked
it also for v5.4:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers.git/commit/?id=d79749f7716d9dc32fa2d5075f6ec29aac63c76d

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
