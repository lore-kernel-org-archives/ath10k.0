Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSQ3y-0002NB-AJ
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 12:02:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/4 v2] ath10k:  invalid msdu-id logging
References: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
 <1395688844-24640-5-git-send-email-greearb@candelatech.com>
Date: Tue, 25 Mar 2014 14:02:11 +0200
In-Reply-To: <1395688844-24640-5-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Mon, 24 Mar 2014 12:20:44
 -0700")
Message-ID: <87txam1o70.fsf@kamboji.qca.qualcomm.com>
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
> Make this message more obvious that it is a serious
> problem (will cause tx flush issues, at least).
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v2:  Add this to series, but ordering is not overly important.
>

[...]

> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -58,7 +58,7 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>  		   tx_done->msdu_id, !!tx_done->discard, !!tx_done->no_ack);
>  
>  	if (tx_done->msdu_id >= htt->max_num_pending_tx) {
> -		ath10k_warn("warning: msdu_id %d too big, ignoring\n",
> +		ath10k_warn("error: msdu_id %d too big, ignoring\n",
>  			    tx_done->msdu_id);
>  		return;
>  	}

To me any warning is a serious matter, I'm not sure how changing this to
message to use "error:" makes any difference?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
