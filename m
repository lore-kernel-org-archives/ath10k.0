Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFHaq-0003MP-0a
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 12:49:29 +0000
Message-ID: <dfd42be470fd98ecc3506ea03806b3fd799cf79a.camel@sipsolutions.net>
Subject: Re: [PATCH 6/6] ath10k: sdio: replace skb_trim with explicit set of
 skb->len
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 01 Oct 2019 14:49:19 +0200
In-Reply-To: <875zl864hl.fsf@kamboji.qca.qualcomm.com>
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
 <20190409190851.4557-7-erik.stromdahl@gmail.com>
 <87zhovcqhl.fsf@kamboji.qca.qualcomm.com>
 <deca77d1-f171-e0cd-b571-89c2f8bafc87@gmail.com>
 <875zl864hl.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, 2019-10-01 at 15:21 +0300, Kalle Valo wrote:

> > > >   		padded_len = ath10k_sdio_calc_txrx_padded_len(ar_sdio,
> > > >   							      skb->len);
> > > > -		skb_trim(skb, padded_len);
> > > > +		/* FIXME: unsure if just extending the skb len is the right
> > > > +		 * thing to do since we might read outside the skb->data
> > > > +		 * buffer. But we really don't want to realloc the skb just to
> > > > +		 * pad the length.
> > > > +		 */
> > > > +		skb->len = padded_len;
> > > 
> > > Good catch! But I don't think you can modify skb->len directly like
> > > that. There is skb_pad() but that doesn't change skb->len, so that most
> > > likely needs more changes. So maybe skb_put() is the safest here?

This seems unsafe to me - if you don't have any tailroom, then you'll
end up sending data to the device that's not really for the device, or
depending on how all this is allocated you might even fault later
because of sdio_memcpy_toio(..., ..., skb->data, skb->len)...

> > I have tried a few different solutions for this, but none seems to be
> > bullet proof.
> > 
> > skb_pad() raises a BUG() if there is not enough space in skb->data.

As it should.

> > The best candidate so far has been skb_put_padto(). It pads and reallocates
> > the skb if needed.
> > 
> > The problem is that it also cause a panic if there is more than one reference
> > to the skb (skb_shared() returns true).

As it also should :-)

> In my opinion the cleanest approach would be to add extra_tx_tailroom to
> struct ieee80211_hw, similarly like we have extra_tx_headroom, and that
> way ath10k could easily add the padding with skb_pad(). Or what do you
> think?

I disagree, adding tailroom to the SKB just for padding would be
useless...

Probably all you really have to do is this:

--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1485,11 +1485,10 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 		skb = items[i].transfer_context;
 		padded_len = ath10k_sdio_calc_txrx_padded_len(ar_sdio,
 							      skb->len);
-		skb_trim(skb, padded_len);
 
 		/* Write TX data to the end of the mbox address space */
 		address = ar_sdio->mbox_addr[eid] + ar_sdio->mbox_size[eid] -
-			  skb->len;
+			  padded_len;
 		ret = ath10k_sdio_prep_async_req(ar, address, skb,
 						 NULL, true, eid);
 		if (ret)


since the device evidently doesn't care what's in the pad bytes, so it
can just stay as is inside its own memory?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
