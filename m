Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF6MQ-0002YU-Qt
 for ath10k@lists.infradead.org; Mon, 20 Jun 2016 21:03:59 +0000
Subject: Re: [PATCH v2 01/21] ath10k: Fix crash related to printing features.
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-2-git-send-email-greearb@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <576856E6.2030003@candelatech.com>
Date: Mon, 20 Jun 2016 13:49:42 -0700
MIME-Version: 1.0
In-Reply-To: <1462986153-16318-2-git-send-email-greearb@candelatech.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 05/11/2016 10:02 AM, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> This looks like a regression from
> c4cdf753 (move fw_features to struct ath10k_fw_file)

Just FYI, this patch does not appear to be in 4.7-rc4 as of today, and so kernel crashes on
startup when loading ath10k, at least when DBG_BOOT logging is enabled....

Thanks,
Ben

>
> Signed-off-by:  Ben Greear <greearb@candelatech.com>
> ---
>   drivers/net/wireless/ath/ath10k/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index e94cb87..b7318b8 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1078,7 +1078,7 @@ int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name,
>   			}
>
>   			ath10k_dbg_dump(ar, ATH10K_DBG_BOOT, "features", "",
> -					ar->running_fw->fw_file.fw_features,
> +					fw_file->fw_features,
>   					sizeof(fw_file->fw_features));
>   			break;
>   		case ATH10K_FW_IE_FW_IMAGE:
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
