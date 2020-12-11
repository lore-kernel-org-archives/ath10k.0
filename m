Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knbFc-0005LY-Mu
 for ath10k@lists.infradead.org; Fri, 11 Dec 2020 05:45:58 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1607612975-5756-1-git-send-email-pillair@codeaurora.org>
 <CA+ASDXN4uLsbo7uuO7WPaUBY+mqHQRfdMHJ4R9KBqqmiVQJUcA@mail.gmail.com>
In-Reply-To: <CA+ASDXN4uLsbo7uuO7WPaUBY+mqHQRfdMHJ4R9KBqqmiVQJUcA@mail.gmail.com>
Subject: RE: [PATCH] ath10k: Remove voltage regulator votes during wifi disable
Date: Fri, 11 Dec 2020 11:15:42 +0530
Message-ID: <000301d6cf80$e0c44150$a24cc3f0$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Brian Norris' <briannorris@chromium.org>
Cc: kuabhs@chromium.org, 'Youghandhar Chintala' <youghand@codeaurora.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'Linux Kernel' <linux-kernel@vger.kernel.org>, 'ath10k' <ath10k@lists.infradead.org>, 'Doug Anderson' <dianders@chromium.org>



> -----Original Message-----
> From: Brian Norris <briannorris@chromium.org>
> Sent: Thursday, December 10, 2020 11:44 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: ath10k <ath10k@lists.infradead.org>; linux-wireless <linux-
> wireless@vger.kernel.org>; Linux Kernel <linux-kernel@vger.kernel.org>;
> Doug Anderson <dianders@chromium.org>; kuabhs@chromium.org;
> Youghandhar Chintala <youghand@codeaurora.org>
> Subject: Re: [PATCH] ath10k: Remove voltage regulator votes during wifi
> disable
> 
> On Thu, Dec 10, 2020 at 7:09 AM Rakesh Pillai <pillair@codeaurora.org>
> wrote:
> > --- a/drivers/net/wireless/ath/ath10k/snoc.c
> > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> > @@ -1045,14 +1085,18 @@ static int ath10k_snoc_hif_power_up(struct
> ath10k *ar,
> >         ret = ath10k_snoc_init_pipes(ar);
> >         if (ret) {
> >                 ath10k_err(ar, "failed to initialize CE: %d\n", ret);
> > -               goto err_wlan_enable;
> > +               goto err_free_rri;
> >         }
> >
> >         return 0;
> >
> > -err_wlan_enable:
> > +err_free_rri:
> > +       ath10k_ce_free_rri(ar);
> 
> This change in the error path seems to be an unrelated (but correct)
> fix. It deserves its own patch, I think.

Sure Brian. I will post this error handling fix as a separate patch, and also post a v2 for this patchset.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
