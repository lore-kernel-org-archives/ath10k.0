Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkYb7-0008EY-WF
 for ath10k@lists.infradead.org; Tue, 31 Jul 2018 17:38:15 +0000
Subject: Re: [PATCHv2] ath10k : Fix channel survey dump
References: <1533039077-1532-1-git-send-email-vnaralas@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <3dd6d368-e54e-d8ba-d538-c48617a575b9@candelatech.com>
Date: Tue, 31 Jul 2018 10:37:58 -0700
MIME-Version: 1.0
In-Reply-To: <1533039077-1532-1-git-send-email-vnaralas@codeaurora.org>
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 07/31/2018 05:11 AM, Venkateswara Naralasetty wrote:
> Channel active/busy time are showing incorrect(less than previous or
> sometimes zero) for successive survey dump command.
>
> example:
> Survey data from wlan0
> 	frequency:                      5180 MHz [in use]
> 	channel active time:            54995 ms
> 	channel busy time:              432 ms
> 	channel receive time:           0 ms
> 	channel transmit time:          59 ms
> Survey data from wlan0
> 	frequency:                      5180 MHz [in use]
> 	channel active time:            32592 ms
> 	channel busy time:              254 ms
> 	channel receive time:           0 ms
> 	channel transmit time:          0 ms
>
> This patch fix this issue by assigning 'wmi_bss_survey_req_type'
> as 'WMI_BSS_SURVEY_REQ_TYPE_READ' which accumulate survey data in
> FW and send survey data to driver upon the driver request. Wrap around
> is taken care by FW.
>
> hardware used : QCA9984
> firmware ver  : ver 10.4-3.5.3-00057

Have you tested this on other firmwares?  I am pretty sure that at least
some of them, probably 10.2, will have issues.

Maybe you could make this change specific to certain firmware that
is known to work with the change?

Thanks,
Ben

>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> ---
> v2:
>  * updated commit log.
>
>  drivers/net/wireless/ath/ath10k/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index f068e2b..db93ab1 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6837,7 +6837,7 @@ ath10k_mac_update_bss_chan_survey(struct ath10k *ar,
>  				  struct ieee80211_channel *channel)
>  {
>  	int ret;
> -	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR;
> +	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ;
>
>  	lockdep_assert_held(&ar->conf_mutex);
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
