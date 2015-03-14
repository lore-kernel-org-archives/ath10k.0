Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-f49.google.com ([209.85.215.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWsWY-0001MV-FS
 for ath10k@lists.infradead.org; Sat, 14 Mar 2015 20:19:07 +0000
Received: by ladw1 with SMTP id w1so13117450lad.0
 for <ath10k@lists.infradead.org>; Sat, 14 Mar 2015 13:18:43 -0700 (PDT)
Message-ID: <550497A0.5040508@cogentembedded.com>
Date: Sat, 14 Mar 2015 23:18:40 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: core: harmonize error case handling in
 ath10k_core_start
References: <1426323313-1344-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1426323313-1344-1-git-send-email-hofrat@osadl.org>
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
To: Nicholas Mc Guire <hofrat@osadl.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Hello.

On 03/14/2015 11:55 AM, Nicholas Mc Guire wrote:

> All of the bringup/init functions called in ath10k_core_start return 0 on
> success and != 0 on failure - ath10k_wmi_wait_for_service_ready and
> ath10k_wmi_wait_for_unified_ready were adjusted to fit this model and the
> call sites here fixed up accordingly.

    If you've changed the sense of these function's results, you need to 
adjust the call sites in the same patch, because otherwise one wouldn't be 
able to bisect this...

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
>
> Patch was only compile tested with x86_64_defconfig + CONFIG_ATH_CARDS=m,
> CONFIG_ATH10K=m
>
> Patch is against 4.0-rc3 (localversion-next is -next-20150313)
>
>   drivers/net/wireless/ath/ath10k/core.c |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index c0e454b..e97069f 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1080,9 +1080,8 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>
>   	if (mode == ATH10K_FIRMWARE_MODE_NORMAL) {
>   		status = ath10k_wmi_wait_for_service_ready(ar);
> -		if (status <= 0) {

    With the changed result sense, this check would always succeed, right? 
Then this gets check broken after the 1st patch.

> +		if (status) {
>   			ath10k_warn(ar, "wmi service ready event not received");
> -			status = -ETIMEDOUT;
>   			goto err_hif_stop;
>   		}
>   	}
> @@ -1098,9 +1097,8 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>   	}
>
>   	status = ath10k_wmi_wait_for_unified_ready(ar);
> -	if (status <= 0) {

    Likewise.

> +	if (status) {
>   		ath10k_err(ar, "wmi unified ready event not received\n");
> -		status = -ETIMEDOUT;
>   		goto err_hif_stop;
>   	}

WBR, Sergei


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
