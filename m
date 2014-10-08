Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xbhfa-0008Ck-Id
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 03:12:06 +0000
Date: Wed, 8 Oct 2014 08:43:23 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add tracing for frame transmission
Message-ID: <20141008031321.GB3116@qca.qualcomm.com>
References: <1412615346-18010-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87d2a3j1ja.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d2a3j1ja.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Oct 07, 2014 at 07:19:05PM +0300, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > Add tracing support to forward management and data frames to
> > user space for packet inspection.
> >
> > Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> [...]
> 
> > --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> > +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > @@ -291,6 +291,9 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
> >  	htt->rx_ring.sw_rd_idx.msdu_payld = idx;
> >  	htt->rx_ring.fill_cnt--;
> >  
> > +	trace_ath10k_htt_rx_pop_msdu(ar, msdu->data, msdu->len +
> > +				     skb_tailroom(msdu));
> 
> Why add skb_tailroom() to the length? I think that deserves a comment.
>
It is used for rx crypto length. skb_tailroom is used in most of the
places even while dumping rx pkt by ath10k_dbg_dump.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
