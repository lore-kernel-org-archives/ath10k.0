Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP6jh-0006LN-3j
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 08:15:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 09/13] ath10k: split wmi_cmd_init path
References: <1380101891-18312-1-git-send-email-bartosz.markowski@tieto.com>
 <1380101891-18312-10-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 26 Sep 2013 11:15:16 +0300
In-Reply-To: <1380101891-18312-10-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 25 Sep 2013 11:38:07 +0200")
Message-ID: <87siwsrobv.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Due to API differences in initialization structures for
> main and 10.x firmwares we need to split the wmi_init_cmd
> and wmi_resource_config  structures.
>
> This will be usefull also when setting the correct TARGET values,
> like: number of peers, vdevs, pdevs etc.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c |    6 +-
>  drivers/net/wireless/ath/ath10k/wmi.c  |   91 +++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.h  |  196 ++++++++++++++++++++++++++++++++
>  3 files changed, 292 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 31860a6..3a56715 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -595,7 +595,11 @@ int ath10k_core_start(struct ath10k *ar)
>  
>  	ath10k_info("firmware %s booted\n", ar->hw->wiphy->fw_version);
>  
> -	status = ath10k_wmi_cmd_init(ar);
> +	if (test_bit(ATH10K_FW_FEATURE_10X, ar->fw_features))
> +		status = ath10k_wmi_10x_cmd_init(ar);
> +	else
> +		status = ath10k_wmi_cmd_init(ar);

It's better to hide the feature check inside ath10k_wmi_cmd_init() and
then that function can just call ath10k_wmi_10x_cmd_init() or
ath10k_wmi_main_cmd_init() (or whatever naming would be approriate
here). So we only expose ath10k_wmi_cmd_init() outside of wmi.c.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
