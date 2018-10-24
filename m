Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFJDi-0005si-F6
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 13:29:12 +0000
Received: by mail-vk1-xa44.google.com with SMTP id c82so1237767vke.8
 for <ath10k@lists.infradead.org>; Wed, 24 Oct 2018 06:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181023.202921.1185045750138652543.davem@davemloft.net>
 <CAHk-=whuhCGujWKO8JObGQaSdWOpJBXdkM-B-vD80QZifveScw@mail.gmail.com>
 <CAHk-=wh2H9jE2RXibQgWs3_Q539roj62_gzPXKjnhhKqSFcw2g@mail.gmail.com>
 <87lg6nu6k1.fsf@codeaurora.org> <87h8hbu5uy.fsf@qca.qualcomm.com>
In-Reply-To: <87h8hbu5uy.fsf@qca.qualcomm.com>
From: Andy Gross <andy.gross@linaro.org>
Date: Wed, 24 Oct 2018 14:28:47 +0100
Message-ID: <CAPBZ5QcpooNi=YnGJJxM020LO=Z_GAM_teGiE5gLKX-g9xhcHQ@mail.gmail.com>
Subject: Re: [GIT] Networking
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: govinds@codeaurora.org, netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, jeffrey.t.kirsher@intel.com, Niklas Cassel <niklas.cassel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>

Sorry for spam, I am resending in cleartext because the previous
missed the lists.  Thanks Google for resetting my config when you
'upgraded'.

On Wed, 24 Oct 2018 at 09:05, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Kalle Valo <kvalo@codeaurora.org> writes:
>
> > Linus Torvalds <torvalds@linux-foundation.org> writes:
> >
> >> On Wed, Oct 24, 2018 at 7:01 AM Linus Torvalds
> >> <torvalds@linux-foundation.org> wrote:
> >>>
> >>> Hmm. Tentatively pulled, but there's something wrong with the Kconfig rules.
> >>
> >> Confirmed.
> >
> > BTW, our emails crossed and more info in the other email[1].
> >
> >> I did a978a5b8d83f ("net/kconfig: Make QCOM_QMI_HELPERS available when
> >> COMPILE_TEST") to fix the breakage.
> >
> > Thanks, though I don't see it yet as I guess you haven't pushed it yet.
> > Do note that it _might_ conflict the other commit which I suspect is in
> > also coming to you:
> >
> > ccfb464cd106 ("soc: qcom: Allow COMPILE_TEST of qcom SoC Kconfigs")
>
> git.kernel.org is alive again for me so I can now check both commits. It
> seems that Niklas' commit[1] is more finegrained than what Linus did[2].
> I guess either of the commits should be reverted when Niklas' commit
> goes to Linus tree, or what's the best course of action?

Yes this will conflict with Niklas's patch which is part of the 4.20
pull requests.  I would prefer that we revert Linus's and take
Niklas's unless there is a compelling argument to have it fixed before
-rc1.  That said, if you didn't, the merge conflicts would be minor
and easily handled.

Regards,
Andy Gross

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
