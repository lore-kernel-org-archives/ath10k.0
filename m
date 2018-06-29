Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYttA-0000S9-Ai
 for ath10k@lists.infradead.org; Fri, 29 Jun 2018 13:56:49 +0000
Received: by mail-lf0-x244.google.com with SMTP id y200-v6so1280293lfd.7
 for <ath10k@lists.infradead.org>; Fri, 29 Jun 2018 06:56:29 -0700 (PDT)
Date: Fri, 29 Jun 2018 15:56:25 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 1/3] ath10k: sdio: use same endpoint id for all packets
 in a bundle
Message-ID: <20180629135625.GA19076@centauri.lan>
References: <20180620084222.3521-1-niklas.cassel@linaro.org>
 <20180620084222.3521-2-niklas.cassel@linaro.org>
 <87zhzdersm.fsf@codeaurora.org> <87vaa1erlj.fsf@codeaurora.org>
 <20180629131141.GA26446@centauri.lan>
 <87r2kpem4o.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r2kpem4o.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: alagusankar@silex-india.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

On Fri, Jun 29, 2018 at 04:51:51PM +0300, Kalle Valo wrote:
> Niklas Cassel <niklas.cassel@linaro.org> writes:
> 
> > On Fri, Jun 29, 2018 at 02:53:44PM +0300, Kalle Valo wrote:
> >> Kalle Valo <kvalo@codeaurora.org> writes:
> >> 
> >> > Niklas Cassel <niklas.cassel@linaro.org> writes:
> >> >
> >> >> All packets in a bundle should use the same endpoint id as the
> >> >> first lookahead.
> >> >>
> >> >> This matches how things are done is ath6kl, however,
> >> >> this patch can theoretically handle several bundles
> >> >> in ath10k_sdio_mbox_rx_process_packets().
> >> >>
> >> >> Without this patch we get lots of errors about invalid endpoint id:
> >> >>
> >> >> ath10k_sdio mmc2:0001:1: invalid endpoint in look-ahead: 224
> >> >> ath10k_sdio mmc2:0001:1: failed to get pending recv messages: -12
> >> >> ath10k_sdio mmc2:0001:1: failed to process pending SDIO interrupts: -12
> >> >>
> >> >> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> >> >> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> >> >
> >> > You have Alagu's s-o-b first so that implies Alagu is the author. So
> >> > should I add From header for Alagu and add you (Niklas) as
> >> > Co-Developed-by? Or vice versa?
> >
> > Hello Kalle,
> >
> > It is not always obvious how the combination of git-author
> > and Co-Developed-by should be:
> > http://lkml.iu.edu/hypermail/linux/kernel/1801.2/00988.html
> 
> Yeah, that's true.
> 
> > Alagu deserves most credit, since I have simply taken parts
> > of a very big patch and split it into smaller pieces.
> > I tried to do the right thing by having his Signed-off-by first.
> >
> > Let's go with your suggestion and add a From: header with
> > Alagu's email, and a Co-Developed-by tag with my email.
> > (Note that both Signed-off-bys are still needed according to
> > submitting-patches.rst)
> 
> Ok.
> 
> > Do you want me to resend the patches with these two lines
> > added, or can you fix them up manually?
> 
> No need, I did that already in the pending branch. Please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6b23bd067990df1cc1e9a4c28327393a7a3ba718
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=bf83a5c572e0737e59e026c989b190b4e52d2ef4
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=218f924d80b76520a4e60eead5e89f3ebd2e86c1

Hello Kalle

It looks good :)

Regards,
Niklas

> 
> -- 
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
