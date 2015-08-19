Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS2g6-0004eq-7N
 for ath10k@lists.infradead.org; Wed, 19 Aug 2015 12:41:14 +0000
Date: Wed, 19 Aug 2015 15:41:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: ath10k: fix peer limit enforcement
Message-ID: <20150819124108.GL5610@mwanda>
References: <20150818190131.GA24548@mwanda>
 <CA+BoTQnShiN8LGhqqnNuqO_7FpPORRasH8p8j2uU9CHTm1Rudw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQnShiN8LGhqqnNuqO_7FpPORRasH8p8j2uU9CHTm1Rudw@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Aug 19, 2015 at 01:19:32PM +0200, Michal Kazior wrote:
> On 18 August 2015 at 21:01, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Hello Michal Kazior,
> >
> > The patch e04cafbc38c7: "ath10k: fix peer limit enforcement" from Aug
> > 5, 2015, leads to the following static checker warning:
> >
> >         drivers/net/wireless/ath/ath10k/mac.c:4365 ath10k_add_interface()
> >         warn: inconsistent returns 'mutex:&ar->conf_mutex'.
> >           Locked on:   line 4125
> >           Unlocked on: line 4344
> >                        line 4365
> [...]
> 
> Great job finding this and the other one (dma_mapping_error) as well!
> I've just sent patches to fix them.

I re-wrote the dma_mapping_error() check yesteday but I will push it
soon.

> 
> I'd love to have this sort of static analysis in my tool set. What did
> you use (I have a weird feeling I did ask about it at one point..)?

This is a Smatch warning.

regards,
dan carpenter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
