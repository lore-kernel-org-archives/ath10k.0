Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiiWy-0000py-G6
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 13:09:01 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: RE: [PATCH v1 3/3] ath10k: Enable parsing per station rx duration for
 10.4
Date: Wed, 23 Mar 2016 13:08:32 +0000
Message-ID: <ec91f62c5b2a4c59b72df074d6ba37f0@aphydexm01b.ap.qualcomm.com>
References: <1458132214-4896-1-git-send-email-mohammed@qca.qualcomm.com>
 <1458132214-4896-3-git-send-email-mohammed@qca.qualcomm.com>
 <8737rhfiy7.fsf@kamboji.qca.qualcomm.com>
 <20160323130331.GA21534@atheros-ThinkPad-T61>
In-Reply-To: <20160323130331.GA21534@atheros-ThinkPad-T61>
Content-Language: en-US
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Kalle,

I will make sure, I will run sparse before sending it for review
http://linuxwireless.org/en/users/Drivers/ath10k/CodingStyle/#Linux_style

make drivers/net/wireless/ath/ath10k/ C=2 CF="-D__CHECK_ENDIAN__"

regret the inconvenience so caused  (including the compilation error)

regards,
shafi

-----Original Message-----
From: Mohammed Shafi Shajakhan [mailto:mohammed@codeaurora.org] 
Sent: Wednesday, March 23, 2016 6:34 PM
To: Valo, Kalle <kvalo@qca.qualcomm.com>
Cc: Shajakhan, Mohammed Shafi (Mohammed Shafi) <mohammed@qti.qualcomm.com>; ath10k@lists.infradead.org; linux-wireless@vger.kernel.org
Subject: Re: [PATCH v1 3/3] ath10k: Enable parsing per station rx duration for 10.4

Hi Kalle,

On Wed, Mar 23, 2016 at 01:00:01PM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > Rx duration support for per station is part of extended peer stats, 
> > enable provision to parse the same and provide backward 
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
> +                       dst->rx_duration = 
> + __le32_to_cpu(src->rx_duration);
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
