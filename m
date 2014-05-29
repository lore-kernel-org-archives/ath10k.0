Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wq0g4-0005vu-Iu
 for ath10k@lists.infradead.org; Thu, 29 May 2014 13:47:29 +0000
Message-ID: <53873A58.1070209@candelatech.com>
Date: Thu, 29 May 2014 06:47:04 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix vdev map size for 10.x firmware
References: <1401370567-13543-1-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1401370567-13543-1-git-send-email-bartosz.markowski@tieto.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 05/29/2014 06:36 AM, Bartosz Markowski wrote:
> Firmware 10.x supports up to 8 virtual AP interfaces
> (comparing to 7 for main firmware). Previous vdev map
> initialization was missing enough space for 8 + 1 vdevs
> (we may spent one for mac monitor), due to wrong define used.
>
> Use correct one - TARGET_10X_NUM_VDEVS - for 10.x firmware.

You are bumping total vdevs up to 16 with that patch...have you
actually tested that many?  The stock firmware has quite a bit of
deficiencies in the concurrency handling, at least for stations.

For what it's worth, my firmware will only work on stock kernels
because I ignore the request for 16 vdevs in the firmware and knock
it down to 8 to match the kernel driver (before your change below).

Thanks,
Ben


>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> ---
>   drivers/net/wireless/ath/ath10k/core.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 82017f5..e6c56c5 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -795,7 +795,11 @@ int ath10k_core_start(struct ath10k *ar)
>   	if (status)
>   		goto err_htc_stop;
>
> -	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
> +	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
> +		ar->free_vdev_map = (1 << TARGET_10X_NUM_VDEVS) - 1;
> +	else
> +		ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
> +
>   	INIT_LIST_HEAD(&ar->arvifs);
>
>   	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
