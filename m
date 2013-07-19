Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V08UD-0004X1-Cj
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 11:04:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: prevent HTC from being used after stopping
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <1374129193-3533-2-git-send-email-michal.kazior@tieto.com>
Date: Fri, 19 Jul 2013 14:04:03 +0300
In-Reply-To: <1374129193-3533-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 18 Jul 2013 08:33:11 +0200")
Message-ID: <8761w64xr0.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> It was possible to submit new HTC commands
> after/while HTC stopped. This led to memory
> corruption in some rare cases.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -957,7 +955,6 @@ void ath10k_htc_stop(struct ath10k_htc *htc)
>  	}
>  
>  	ath10k_hif_stop(htc->ar);
> -	ath10k_htc_reset_endpoint_states(htc);
>  }

Is this on purpose? I can't fit it to the description.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
