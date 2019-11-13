Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUuJG-0004Mc-Nq
 for ath10k@lists.infradead.org; Wed, 13 Nov 2019 15:11:56 +0000
Received: by mail-il1-x142.google.com with SMTP id a7so2086072ild.6
 for <ath10k@lists.infradead.org>; Wed, 13 Nov 2019 07:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20191106231650.1580-1-jeffrey.l.hugo@gmail.com>
 <20191112084225.casuncbo7z54vu4g@netronome.com>
 <CAOCk7NpNgtTSus2KtBMe=jGLFyBumVfRVxKxtHoEDUEt2-6tqQ@mail.gmail.com>
 <87d0dws79m.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d0dws79m.fsf@kamboji.qca.qualcomm.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 13 Nov 2019 08:11:41 -0700
Message-ID: <CAOCk7NpGm7jLH-z9CdJaYAGkg_WuiBxtxgwby+BJef=asFbavw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix qmi init error handling
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
Cc: Simon Horman <simon.horman@netronome.com>, linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, netdev@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>, davem@davemloft.net

On Tue, Nov 12, 2019 at 9:57 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Jeffrey Hugo <jeffrey.l.hugo@gmail.com> writes:
>
> > On Tue, Nov 12, 2019 at 1:42 AM Simon Horman <simon.horman@netronome.com> wrote:
> >>
> >> On Wed, Nov 06, 2019 at 03:16:50PM -0800, Jeffrey Hugo wrote:
> >> > When ath10k_qmi_init() fails, the error handling does not free the irq
> >> > resources, which causes an issue if we EPROBE_DEFER as we'll attempt to
> >> > (re-)register irqs which are already registered.
> >> >
> >> > Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> >> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >> > ---
> >> >  drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> >> > index fc15a0037f0e..f2a0b7aaad3b 100644
> >> > --- a/drivers/net/wireless/ath/ath10k/snoc.c
> >> > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> >> > @@ -1729,7 +1729,7 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
> >> >       ret = ath10k_qmi_init(ar, msa_size);
> >> >       if (ret) {
> >> >               ath10k_warn(ar, "failed to register wlfw qmi client: %d\n", ret);
> >> > -             goto err_core_destroy;
> >> > +             goto err_free_irq;
> >> >       }
> >>
> >> From a casual examination of the code this seems like a step in the right
> >> direction. But does this error path also need to call ath10k_hw_power_off() ?
> >
> > It probably should.  I don't see any fatal errors from the step being
> > skipped, although it might silence some regulator warnings about being
> > left on.  Unlikely to be observed by most folks as I was initing the
> > driver pretty early to debug some things.  Looks like Kalle already
> > picked up this patch though, so I guess your suggestion would need to
> > be a follow up.
>
> Actually it's only in the pending branch, which means that the patch can
> be changed or a new version can be submitted:

Thats an interesting flow.  Ok.

>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#patch_flow
>
> The easiest way to check the state of a wireless patch is from
> patchwork:
>
> https://patchwork.kernel.org/patch/11231325/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#checking_state_of_patches_from_patchwork
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
