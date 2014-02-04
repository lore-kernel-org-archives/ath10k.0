Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAl9m-00050w-Oe
 for ath10k@lists.infradead.org; Tue, 04 Feb 2014 18:55:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k:  Better tx/rx debugging.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-4-git-send-email-greearb@candelatech.com>
Date: Tue, 4 Feb 2014 20:55:10 +0200
In-Reply-To: <1390435562-15473-4-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 22 Jan 2014 16:06:02
 -0800")
Message-ID: <87lhxqoghd.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com, janusz.dziedzic@tieto.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Make it easier to grep for htt rx errors.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> @@ -961,6 +962,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>  			}
>  
>  			if (test_bit(ATH10K_CAC_RUNNING, &htt->ar->dev_flags)) {
> +				ath10k_warn("htt rx: CAC running\n");
>  				ath10k_htt_rx_free_msdu_chain(msdu_head);
>  				continue;
>  			}

I'm a bit worried about this one. Do we guarantee that we will never
receive frames while CAC is running? In other words, is this a normal
event or really an error in the driver which requires a warning message?

Janusz, what do you think?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
