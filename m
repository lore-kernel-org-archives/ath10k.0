Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiiSS-0007Jl-MV
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 13:04:22 +0000
Date: Wed, 23 Mar 2016 18:33:49 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v1 3/3] ath10k: Enable parsing per station rx duration
 for 10.4
Message-ID: <20160323130331.GA21534@atheros-ThinkPad-T61>
References: <1458132214-4896-1-git-send-email-mohammed@qca.qualcomm.com>
 <1458132214-4896-3-git-send-email-mohammed@qca.qualcomm.com>
 <8737rhfiy7.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8737rhfiy7.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

Hi Kalle,

On Wed, Mar 23, 2016 at 01:00:01PM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > Rx duration support for per station is part of extended peer
> > stats, enable provision to parse the same and provide backward
> > compatibility based on the 'stats_id' event
> >
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> There was a new sparse warning:
> 
> drivers/net/wireless/ath/ath10k/wmi.c:2978:42: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath10k/wmi.c:2978:42:    expected unsigned int [unsigned] [usertype] rx_duration
> drivers/net/wireless/ath/ath10k/wmi.c:2978:42:    got restricted __le32 const [usertype] rx_duration
> 
> I fixed it like this in the pending branch, please double check:

[shafi] thanks for fixing this, sorry i missed this.

> 
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2975,7 +2975,7 @@ static int ath10k_wmi_10_4_op_pull_fw_stats(struct ath10k *ar,
>                 ath10k_wmi_10_4_pull_peer_stats(&src->common, dst);
>                 /* FIXME: expose 10.4 specific values */
>                 if (extd_peer_stats)
> -                       dst->rx_duration = src->rx_duration;
> +                       dst->rx_duration = __le32_to_cpu(src->rx_duration);
>  
>                 list_add_tail(&dst->list, &stats->peers);
>         }
>
regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
