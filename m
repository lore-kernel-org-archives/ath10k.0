Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7idh-00027L-2Z
 for ath10k@lists.infradead.org; Tue, 31 May 2016 12:19:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Fix 10.4 extended peer stats update
Date: Tue, 31 May 2016 12:18:49 +0000
Message-ID: <87vb1ucten.fsf@qca.qualcomm.com>
References: <1464339926-12136-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1464339926-12136-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Fri, 27 May 2016 14:35:26	+0530")
Content-Language: en-US
Content-ID: <C2ABA0453F4DFA4FA988B949D746B0B5@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> 10.4 'extended peer stats' will be not be appended with normal peer stats
> data and they shall be coming in separate chunks. Fix this by maintaining
> a separate linked list 'extender peer stats' for 10.4 and update
> rx_duration for per station statistics. Also parse through beacon filter
> (if enabled), to make sure we parse the extended peer stats properly.
> This issue was exposed when more than one client is connected and
> extended peer stats for 10.4 is enabled
>
> The order for the stats is as below
> S - standard peer stats, E- extended peer stats, B - beacon filter stats
>
> {S1, S2, S3..} -> {B1, B2, B3..}(if available) -> {E1, E2, E3..}
>
> Fixes: f9575793d44c ("ath10k: enable parsing per station rx duration for 10.4")
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

[...]

> +void ath10k_sta_update_rx_duration(struct ath10k *ar,
> +				   struct ath10k_fw_stats *stats)
> +{
> +	struct ath10k_fw_file *fw_file = &ar->normal_mode_fw.fw_file;
> +
> +	if (fw_file->wmi_op_version < ATH10K_FW_WMI_OP_VERSION_10_4)
> +		ath10k_sta_update_stats_rx_duration(ar, &stats->peers);
> +	else
> +		ath10k_sta_update_extd_stats_rx_duration(ar,
> +							 &stats->peers_extd);
> +}

_Ideally_ wmi_op_version should be used only in ath10k_wmi_attach() and
nowhere else. Isn't there any other way to detect this scenario? For
example, what if you store stats_id to struct ath10k_fw_stats and do
something like this:

if (stats->stats_id & WMI_10_4_STAT_PEER_EXTD)
	ath10k_sta_update_extd_stats_rx_duration(ar,
						 &stats->peers_extd);
else
	ath10k_sta_update_stats_rx_duration(ar, &stats->peers);

Would that work?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
