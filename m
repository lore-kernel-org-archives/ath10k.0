Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJOjW-0006Ue-1J
 for ath10k@lists.infradead.org; Tue, 10 Sep 2013 14:15:58 +0000
Received: by mail-ie0-f170.google.com with SMTP id 17so7340926iea.15
 for <ath10k@lists.infradead.org>; Tue, 10 Sep 2013 07:15:31 -0700 (PDT)
Date: Tue, 10 Sep 2013 10:14:13 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 1/7] ath10k: simplify HTC credits calculation
Message-ID: <20130910141413.GE29385@localhost>
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
 <1378821003-22925-2-git-send-email-michal.kazior@tieto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1378821003-22925-2-git-send-email-michal.kazior@tieto.com>
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

On Tue, Sep 10, 2013 at 03:49:57PM +0200, Michal Kazior wrote:
> +		skb = __skb_dequeue(&ep->tx_queue);
> +
> +		if (ep->tx_credit_flow_enabled) {
> +			/* integer division w/ round-up */
> +			credits = (skb->len + htc->target_credit_size - 1) /
> +				  htc->target_credit_size;

There's a macro for that...

            credits = DIV_ROUND_UP(skb->len, htc->target_credit_size);

-- 
Bob Copeland %% www.bobcopeland.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
