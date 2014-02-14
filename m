Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEC26-0006y6-FY
 for ath10k@lists.infradead.org; Fri, 14 Feb 2014 06:13:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] wmi:  Handle failure to start scan.
References: <1392318594-32540-1-git-send-email-greearb@candelatech.com>
Date: Fri, 14 Feb 2014 08:13:25 +0200
In-Reply-To: <1392318594-32540-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 13 Feb 2014 11:09:54
 -0800")
Message-ID: <877g8y6x2y.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Properly clean up driver state in case firmware fails
> to start scan for some reason.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Why just RFC?

And "ath10k:" prefix missing.

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -770,7 +770,25 @@ static int ath10k_wmi_event_scan(struct ath10k *ar, struct sk_buff *skb)
>  		ath10k_dbg(ATH10K_DBG_WMI, "WMI_SCAN_EVENT_PREEMPTED\n");
>  		break;
>  	case WMI_SCAN_EVENT_START_FAILED:
> -		ath10k_dbg(ATH10K_DBG_WMI, "WMI_SCAN_EVENT_START_FAILED\n");
> +		ath10k_warn("WMI_SCAN_EVENT_START_FAILED, reason: %i\n", reason);

"scan failed to start: %i\n"

> +		ar->scan_channel = NULL;
> +		if (!ar->scan.in_progress) {
> +			ath10k_warn("scan-start-failed: no scan requested, ignoring\n");

"scan failed to start but no scan requested, ignoring\n"

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
