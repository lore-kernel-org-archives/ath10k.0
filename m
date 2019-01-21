Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glcnb-0005sb-0N
 for ath10k@lists.infradead.org; Mon, 21 Jan 2019 16:51:48 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [PATCH v5 4/6] ath9k: Switch to mac80211 TXQ scheduling and
 airtime APIs
In-Reply-To: <1545181331-5288-5-git-send-email-rmanohar@codeaurora.org>
References: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
 <1545181331-5288-5-git-send-email-rmanohar@codeaurora.org>
Date: Mon, 21 Jan 2019 17:51:44 +0100
Message-ID: <87pnsqkl7j.fsf@toke.dk>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: make-wifi-fast@lists.bufferbloat.net

Just discovered this while working on my follow-up:

>  void ath_tx_queue_tid(struct ath_softc *sc, struct ath_atx_tid *tid)
>  {
> -	struct ath_vif *avp = (struct ath_vif *) tid->an->vif->drv_priv;
> -	struct ath_chanctx *ctx = avp->chanctx;
> -	struct ath_acq *acq;
> +	struct ieee80211_txq *queue =
> +		container_of((void *)tid, struct ieee80211_txq, drv_priv);
>  
> -	if (!ctx || !list_empty(&tid->list))
> -		return;
> -
> -	acq = &ctx->acq[TID_TO_WME_AC(tid->tidno)];
> -	spin_lock_bh(&acq->lock);
> -	__ath_tx_queue_tid(sc, tid);
> -	spin_unlock_bh(&acq->lock);
> +	ieee80211_return_txq(sc->hw, queue);
>  }

After we evolved the API, this is now wrong, as ieee80211_return_txq()
should only be called while holding the right lock. I'll post a fixed
version tomorrow.

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
