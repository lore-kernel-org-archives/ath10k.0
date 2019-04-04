Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBxjl-0003xG-Rw
 for ath10k@lists.infradead.org; Thu, 04 Apr 2019 08:28:46 +0000
Received: by mail-ot1-f66.google.com with SMTP id d24so1541418otl.11
 for <ath10k@lists.infradead.org>; Thu, 04 Apr 2019 01:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
 <20190403195718.GA74723@google.com>
 <1645947.WPhbVaNX0l@aspire.rjw.lan>
 <CA+ASDXPoB94o0pbY0TQGS7Dtp2RNz=3goH38gpLtBoJ15i7eoQ@mail.gmail.com>
 <87k1gatnvt.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87k1gatnvt.fsf@kamboji.qca.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Apr 2019 10:28:29 +0200
Message-ID: <CAJZ5v0h=gcurf7msXkxBCmf86D1C1cMP6uL8iadUjMaNd6FPYA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during system
 resume
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
Cc: Claire Chang <tientzu@google.com>, Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>

On Thu, Apr 4, 2019 at 6:08 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Brian Norris <briannorris@chromium.org> writes:
>
> > On Wed, Apr 3, 2019 at 2:47 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> >> I have been wondering whether or not I need to resend this patch or something ...
> >
> > I think the linux-wireless Patchwork instance is the source of truth
> > -- Kalle and Johannes use it for tracking status, IIUC. So this says
> > your patch is still "New":
> >
> > https://patchwork.kernel.org/patch/10837139/
>
> Yeah, that's right:
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#checking_state_of_patches_from_patchwork
>
> So no need to resend, it's in my queue.
>
> I was travelling and then busy with something else so I haven't had a
> chance to process patches, I'll try to catch up now but I'm sure it will
> take a while as there are so many patches. Sorry for the delay.

No worries. :-)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
