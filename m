Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve1eur01on060a.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::60a]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDEpH-0001GH-U0
 for ath10k@lists.infradead.org; Mon, 30 Apr 2018 19:51:09 +0000
Subject: Re: [PATCH 2/2] ath10k: DFS Host Confirmation
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <0c224b54-dd10-576f-944f-2d20d1cb2c46@bowerswilkins.com>
Date: Mon, 30 Apr 2018 12:50:40 -0700
MIME-Version: 1.0
In-Reply-To: <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
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
To: Sriram R <srirrama@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 04/30/2018 10:45 AM, Sriram R wrote:
> In the 10.4-3.6 firmware branch there's a new DFS Host confirmation
> feature which is advertised using WMI_SERVICE_HOST_DFS_CHECK_SUPPORT flag.
>
> This new features enables the ath10k host to send information to the
> firmware on the specifications of detected radar type. This allows the
> firmware to validate if the host's radar pattern detector unit is
> operational and check if the radar information shared by host matches
> the radar pulses sent as phy error events from firmware. If the check
> fails the firmware won't allow use of DFS channels on AP mode when using
> FCC regulatory region.
What's the main reason you introduce this feature?
What are you trying to solve with this change?
> +#define ATH10K_WMI_DFS_CONF_TIMEOUT_HZ (HZ / 2)
>   
> +static void ath10k_radar_confirmation_work(struct work_struct *work)
> +{
> +	struct ath10k *ar = container_of(work, struct ath10k,
> +					 radar_confirmation_work);
> +	struct ath10k_radar_found_info radar_info;
> +	int ret, time_left;
> +
> +	reinit_completion(&ar->wmi.radar_confirm);
> +
> +	spin_lock_bh(&ar->data_lock);
> +	memcpy(&radar_info, &ar->last_radar_info, sizeof(radar_info));
> +	spin_unlock_bh(&ar->data_lock);
> +
> +	ret = ath10k_wmi_report_radar_found(ar, &radar_info);
> +	if (ret) {
> +		ath10k_warn(ar, "failed to send radar found %d\n", ret);
> +		goto wait_complete;
> +	}
> +
> +	time_left = wait_for_completion_timeout(&ar->wmi.radar_confirm,
> +						ATH10K_WMI_DFS_CONF_TIMEOUT_HZ);
It looks wrong to me in terms of timeout value.
Typical channel closing time in FCC domain is 200ms (excluding control 
signals), but you're waiting for 500ms for response from FW.
> @@ -3765,25 +3834,46 @@ static void ath10k_dfs_radar_report(struct ath10k *ar,
>   
>   	ATH10K_DFS_STAT_INC(ar, pulses_detected);
>   
> -	if (!ar->dfs_detector->add_pulse(ar->dfs_detector, &pe, NULL)) {
> +	if (!ar->dfs_detector->add_pulse(ar->dfs_detector, &pe, &rs)) {
>   		ath10k_dbg(ar, ATH10K_DBG_REGULATORY,
>   			   "dfs no pulse pattern detected, yet\n");
>   		return;
>   	}
>   
> -radar_detected:
> -	ath10k_dbg(ar, ATH10K_DBG_REGULATORY, "dfs radar detected\n");
> -	ATH10K_DFS_STAT_INC(ar, radar_detected);
> +	if ((test_bit(WMI_SERVICE_HOST_DFS_CHECK_SUPPORT, ar->wmi.svc_map)) &&
> +	    ar->dfs_detector->region == NL80211_DFS_FCC) {
I feel risky that host drivers have no way to control this new feature 
and totally rely on FW feature mask. We should have a host drivers' 
feature mask such as module param and set it false (don't use) by 
default until it proves safe to use.
> +static void
> +ath10k_wmi_event_dfs_status_check(struct ath10k *ar, struct sk_buff *skb)
> +{
> +	struct wmi_dfs_status_ev_arg status_arg = {};
> +	int ret;
> +
> +	ret = ath10k_wmi_pull_dfs_status(ar, skb, &status_arg);
> +
> +	if (ret) {
> +		ath10k_warn(ar, "failed to parse dfs status event: %d\n", ret);
> +		return;
> +	}
> +
> +	ath10k_dbg(ar, ATH10K_DBG_REGULATORY,
> +		   "dfs status event received from fw: %d\n",
> +		   status_arg.status);
> +
> +	/* Even in case of radar detection failure we follow the same
> +	 * behaviour as if radar is detected i.e to switch to a different
> +	 * channel.
> +	 */
> +	if (status_arg.status == WMI_HW_RADAR_DETECTED ||
> +	    status_arg.status == WMI_RADAR_DETECTION_FAIL)
> +		ath10k_radar_detected(ar);
> +	complete(&ar->wmi.radar_confirm);
> +}
What is typical average duration from 
wait_for_completion_timeout(&ar->wmi.radar_confirm) to this completion 
called ?

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
