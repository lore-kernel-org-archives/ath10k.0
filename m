Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlKKs-0004H1-71
 for ath10k@lists.infradead.org; Fri, 16 May 2014 15:46:14 +0000
Date: Fri, 16 May 2014 11:34:41 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: [PATCH] ath9k/ath10k: remove unnecessary channel_switch_beacon
 callbacks
Message-ID: <20140516153441.GD3431@tuxdriver.com>
References: <1400248534-16763-1-git-send-email-luca@coelho.fi>
 <87y4y13im2.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y4y13im2.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, Luca Coelho <luca@coelho.fi>, michal.kazior@tieto.com, ath10k@lists.infradead.org

On Fri, May 16, 2014 at 05:26:13PM +0300, Kalle Valo wrote:
> Luca Coelho <luca@coelho.fi> writes:
> 
> > From: Luciano Coelho <luciano.coelho@intel.com>
> >
> > The channel_switch_beacon callback is optional, so it doesn't have to
> > be defined if it's not going to do anything useful with it.  Both
> > ath9k and ath10k define the callback and just returns.  This commit
> > removes them.
> >
> > Cc: Michal Kazior <michal.kazior@tieto.com>
> > Signed-off-by: Luciano Coelho <luciano.coelho@intel.com>
> > ---
> >
> > I'm plannnig to remove the channel_switch_beacon callback (actually,
> > replace it with a more generic one that can be used for STA and other
> > iftypes too) and ath9k/ath10k are the only (non) users of it. ;)
> 
> John, I'm planning to take this as I think we will get less conflicts
> that way. But let me know if you want it instead.

No, that's good.  You will take the ath9k part too, right?

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
