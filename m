Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsfr-0003oO-D8
 for ath10k@lists.infradead.org; Mon, 29 Jun 2020 12:14:12 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
 <1593194502-13164-3-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V1C2Lu31n8xQ8HPf21fNo_Da2SLtZAeStFBEou9+geEA@mail.gmail.com>
In-Reply-To: <CAD=FV=V1C2Lu31n8xQ8HPf21fNo_Da2SLtZAeStFBEou9+geEA@mail.gmail.com>
Subject: RE: [PATCH 2/2] ath10k: Add support for chain1 regulator supply voting
Date: Mon, 29 Jun 2020 17:43:35 +0530
Message-ID: <000301d64e0e$b9e32c70$2da98550$@codeaurora.org>
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
To: 'Doug Anderson' <dianders@chromium.org>, 'Kalle Valo' <kvalo@codeaurora.org>
Cc: "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" <devicetree@vger.kernel.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'LKML' <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org



> -----Original Message-----
> From: Doug Anderson <dianders@chromium.org>
> Sent: Saturday, June 27, 2020 3:22 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; Kalle Valo
> <kvalo@codeaurora.org>
> Cc: ath10k@lists.infradead.org; open list:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; linux-wireless <linux-
> wireless@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH 2/2] ath10k: Add support for chain1 regulator supply
> voting
> 
> Hi,
> 
> On Fri, Jun 26, 2020 at 11:02 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
> >
> > Add support to vote for chain-1 voltage regulator
> > in WCN3990.
> >
> > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  drivers/net/wireless/ath/ath10k/snoc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/snoc.c
> b/drivers/net/wireless/ath/ath10k/snoc.c
> > index 645ed5f..407a074 100644
> > --- a/drivers/net/wireless/ath/ath10k/snoc.c
> > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> > @@ -45,6 +45,7 @@ static const char * const ath10k_regulators[] = {
> >         "vdd-1.8-xo",
> >         "vdd-1.3-rfa",
> >         "vdd-3.3-ch0",
> > +       "vdd-3.3-ch1",
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ...with the slight nit that ${SUBJECT} and description should probably
> call it "chan1" and not "chain1".  Presumably the maintainer can fix
> when applying.
> 
> -Doug

Hi Doug,

It has to be chain1 only, not chan1.
This is the power supply rail for the wlan-chain1 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
