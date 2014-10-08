Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xboly-0004hs-VL
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 10:47:11 +0000
Date: Wed, 8 Oct 2014 16:18:25 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix kernel panic while shutting down AP
Message-ID: <20141008104823.GB25666@qca.qualcomm.com>
References: <1412759786-10567-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87a956hosb.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a956hosb.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, Oct 08, 2014 at 12:52:04PM +0300, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > The commit "ath10k: workaround fw beaconing bug" is freeing
> > DMA-coherent memory in irq context which is hitting BUG ON
> > in ARM platforms. Fix this by moving dma_free out of spin
> > lock.
 
> [...]
> 
> > @@ -2404,8 +2389,15 @@ void ath10k_halt(struct ath10k *ar)
> >  
> >  	spin_lock_bh(&ar->data_lock);
> >  	list_for_each_entry(arvif, &ar->arvifs, list)
> > -		ath10k_mac_vif_beacon_cleanup(arvif);
> > +		ath10k_mac_vif_beacon_free(arvif);
> >  	spin_unlock_bh(&ar->data_lock);
> > +	list_for_each_entry(arvif, &ar->arvifs, list) {
> > +		if (!arvif->beacon_buf)
> > +			continue;
> > +		dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
> > +				  arvif->beacon_buf, arvif->beacon_paddr);
> > +		arvif->beacon_buf = NULL;
> > +	}
> >  }
> 
> Until now we have protected arvif->beacon_buf with data_lock. How do we
> know that this is safe to do without taking data_lock?
> 
As said, spin_lock can not be used for dma_free_coherent.
arvif->beacon_buf is already protected by conf_mutex. At this state
in ath10k_halt path, no one can access beacon_buf. So mutex lock itself
is sufficient.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
