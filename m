Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUYUV-0003K2-GN
 for ath10k@lists.infradead.org; Tue, 12 Nov 2019 15:54:05 +0000
Received: by mail-io1-xd43.google.com with SMTP id q83so19256658iod.1
 for <ath10k@lists.infradead.org>; Tue, 12 Nov 2019 07:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20191106234712.2380-1-jeffrey.l.hugo@gmail.com>
 <20191112090444.ak2xu67eawfgpdgb@netronome.com>
In-Reply-To: <20191112090444.ak2xu67eawfgpdgb@netronome.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 12 Nov 2019 08:53:51 -0700
Message-ID: <CAOCk7NoXv2-8GO=VYS8dNPJF6sj=S3RbkfqQGW0kvvVmR8V1kw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Handle "invalid" BDFs for msm8998 devices
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
To: Simon Horman <simon.horman@netronome.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, MSM <linux-arm-msm@vger.kernel.org>, davem@davemloft.net, kvalo@codeaurora.org

On Tue, Nov 12, 2019 at 2:04 AM Simon Horman <simon.horman@netronome.com> wrote:
>
> On Wed, Nov 06, 2019 at 03:47:12PM -0800, Jeffrey Hugo wrote:
> > When the BDF download QMI message has the end field set to 1, it signals
> > the end of the transfer, and triggers the firmware to do a CRC check.  The
> > BDFs for msm8998 devices fail this check, yet the firmware is happy to
> > still use the BDF.  It appears that this error is not caught by the
> > downstream drive by concidence, therefore there are production devices
> > in the field where this issue needs to be handled otherwise we cannot
> > support wifi on them.  So, attempt to detect this scenario as best we can
> > and treat it as non-fatal.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/qmi.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> > index eb618a2652db..5ff8cfc93778 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -265,10 +265,13 @@ static int ath10k_qmi_bdf_dnld_send_sync(struct ath10k_qmi *qmi)
> >                       goto out;
> >
> >               if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> > -                     ath10k_err(ar, "failed to download board data file: %d\n",
> > -                                resp.resp.error);
> > -                     ret = -EINVAL;
> > -                     goto out;
> > +                     if (!(req->end == 1 &&
> > +                           resp.resp.result == QMI_ERR_MALFORMED_MSG_V01)) {
>
> Would it make sense to combine the inner and outer condition,
> something like this (completely untested) ?

I guess, make sense from what perspective?  Looks like the assembly
ends up being the same, so it would be down to "readability" which is
subjective - I personally don't see a major advantage to one way or
the other.  It does look like Kalle already picked up this patch, so
I'm guessing that if folks feel your suggestion is superior, then it
would need to be a follow on.

>
>                 if (resp.resp.result != QMI_RESULT_SUCCESS_V01 &&
>                     !(req->end == 1 &&
>                       resp.resp.result == QMI_ERR_MALFORMED_MSG_V01)) {
>
> > +                             ath10k_err(ar, "failed to download board data file: %d\n",
> > +                                        resp.resp.error);
> > +                             ret = -EINVAL;
> > +                             goto out;
> > +                     }
> >               }
> >
> >               remaining -= req->data_len;
> > --
> > 2.17.1
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
