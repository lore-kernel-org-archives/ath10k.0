Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1YfV-0004gI-US
 for ath10k@lists.infradead.org; Fri, 10 Jan 2014 09:46:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: disable STA KICKOUT in FW
References: <1388390871-3932-1-git-send-email-marek.puzyniak@tieto.com>
Date: Fri, 10 Jan 2014 11:45:54 +0200
In-Reply-To: <1388390871-3932-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Mon, 30 Dec 2013 09:07:51 +0100")
Message-ID: <87wqi89nl9.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> Currently ath10k is not using STA KICKOUT firmware functionality.
> In order to avoid unwanted FW events this functionality should be
> disabled when not used.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Thanks, applied. I did minor changes to the commit log based on
the feedback:

    ath10k: disable STA kickout in FW
    
    Currently ath10k is not using STA KICKOUT firmware functionality.
    In order to avoid unwanted WMI_PEER_STA_KICKOUT_EVENT event this functionality
    should be disabled when not used.
    
    Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -2292,11 +2292,20 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>  	}
>  
>  	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
> +		u32 param_id;
> +

Also I moved this to the beginning of the function.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
