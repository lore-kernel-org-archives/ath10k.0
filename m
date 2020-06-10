Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jizgM-0001Oq-W3
 for ath10k@lists.infradead.org; Wed, 10 Jun 2020 12:18:16 +0000
Received: by mail-ot1-x342.google.com with SMTP id u23so1495968otq.10
 for <ath10k@lists.infradead.org>; Wed, 10 Jun 2020 05:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200327093147.189390-1-robert.marko@sartura.hr>
 <87y2owmoy4.fsf@codeaurora.org>
In-Reply-To: <87y2owmoy4.fsf@codeaurora.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 10 Jun 2020 14:18:02 +0200
Message-ID: <CA+HBbNGkzq-sndJwYoifZWNSOYyEMGhuuSJbuGiTVQwALgRnpQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable advertising support for channels 32, 68
 and 98
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
Cc: Luka Perkov <luka.perkov@sartura.hr>, ath10k@lists.infradead.org

On Tue, Jun 9, 2020 at 1:58 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > Enable advertising support for 5G channels: 32, 68 and 96.
> > These channels are legal and available for use in ETSI countries.
> > So lets advertise these and they will be available in accordance with the regulatory domain used.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
>
> What's the use case for this? I was told that the IEEE standard does not
> define these channels, that's why I'm asking for more information.
The primary use case is to enable more of the spectrum to be used, since in
ETSI countries it's legal.
Even 5GHz is getting pretty crowded in cities.
>
> On what hardware and firmware did you test this? It might be that not
> all hardware or firmware support this.
It's tested on IPQ4018, 10.4-3.6-00140 FW if I remember correctly as
some time has passed.
If HW does not support it then BDF-s and caldata should disable it?
>
> There was a concern if this slows down scanning due to more channels
> being scanned, but I haven't analysed that yet. Did you measure that?
No, I have not thought of that.
Even if it does, I don't think that 3 channels more would drastically
increase scan time.
>
> Also please CC linux-wireless on ath10k patches. Otherwise patchwork
> won't see them and it won't be on my radar:
Thanks, completely forgot to do it.
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
