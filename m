Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ja909-0004h7-J8
 for ath10k@lists.infradead.org; Sun, 17 May 2020 02:26:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id b8so2969892pgi.11
 for <ath10k@lists.infradead.org>; Sat, 16 May 2020 19:26:00 -0700 (PDT)
Subject: Re: [PATCHv4] ath10k : Fix channel survey dump
References: <1588820612-15884-1-git-send-email-vnaralas@codeaurora.org>
From: John Deere <24601deerej@gmail.com>
Message-ID: <edbb46d6-d7c1-7317-fc1f-cb06bc850c8a@gmail.com>
Date: Sun, 17 May 2020 10:25:56 +0800
MIME-Version: 1.0
In-Reply-To: <1588820612-15884-1-git-send-email-vnaralas@codeaurora.org>
Content-Language: en-US
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


On 5/7/20 11:03 AM, Venkateswara Naralasetty wrote:
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
> 
> hardware used : QCA988X
> firmware ver  : 10.2.4-1.0-00047
> 
> Tested-by: Markus Theil <markus.theil@tu-ilmenau.de>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> ---
> v4:
>   * updated signed-off-by
> 
> v3:
>   * Rebased on TOT and added Tested-by
> 
>   drivers/net/wireless/ath/ath10k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index a1147cc..9330b52 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -7275,7 +7275,7 @@ ath10k_mac_update_bss_chan_survey(struct ath10k *ar,
>   				  struct ieee80211_channel *channel)
>   {
>   	int ret;
> -	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR;
> +	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ;
>   
>   	lockdep_assert_held(&ar->conf_mutex);
>   
> 


I have tested this on a QCA9980 device on a TP-Link Archer A7v5 with the 
firmware version 10.2.4.70.70.

[root@Archer-A7v5 ~]# uptime
  10:18:40 up 7 days,  3:52,  load average: 0.03, 0.01, 0.00


It has been working fine:

Survey data from wlan0
	frequency:			5240 MHz [in use]
	noise:				-101 dBm
	channel active time:		593724580 ms
	channel busy time:		9706985 ms
	channel receive time:		2053580 ms
	channel transmit time:		6473058 ms

Tested-by: John Deere <24601deerej@gmail.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
