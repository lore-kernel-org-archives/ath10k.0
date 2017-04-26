Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3Osr-0002MB-JF
 for ath10k@lists.infradead.org; Wed, 26 Apr 2017 15:29:39 +0000
Subject: Re: [PATCH] ath10k : Fix channel survey dump
References: <1493217698-22451-1-git-send-email-c_vnaral@qti.qualcomm.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <40f2b7a2-7276-6de6-afc6-407348c92e70@nbd.name>
Date: Wed, 26 Apr 2017 17:29:16 +0200
MIME-Version: 1.0
In-Reply-To: <1493217698-22451-1-git-send-email-c_vnaral@qti.qualcomm.com>
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
To: Venkateswara Rao Naralasetty <c_vnaral@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 2017-04-26 16:41, Venkateswara Rao Naralasetty wrote:
> Channel active/busy time are showing incorrect
> (less than previous or sometimes zero) for
> successive survey dump command.
> 
> example:
> Survey data from wlan0
>         frequency:                      5180 MHz [in use]
>         channel active time:            54995 ms
>         channel busy time:              432 ms
>         channel receive time:           0 ms
>         channel transmit time:          59 ms
> Survey data from wlan0
>         frequency:                      5180 MHz [in use]
>         channel active time:            32592 ms
>         channel busy time:              254 ms
>         channel receive time:           0 ms
>         channel transmit time:          0 ms
> 
> This patch fix this issue by assigning 'wmi_bss_survey_req_type'
> as 'WMI_BSS_SURVEY_REQ_TYPE_READ'.
> 
> Firmware ver 10.4-3.4-00082
> Hardware QCA4019
> 
> Signed-off-by: Venkateswara Rao Naralasetty <c_vnaral@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 9977829..87a9b55 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6621,7 +6621,7 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>  				  struct ieee80211_channel *channel)
>  {
>  	int ret;
> -	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR;
> +	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ;
Does the firmware read the registers directly, or does it accumulate the
results in a way that can't overflow?
If you don't clear the counters on reset, the overflow will be
problematic for the current-channel stats.
I think a better approach would be to use READ_CLEAR for in-use channels
and store the sum inside the driver.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
