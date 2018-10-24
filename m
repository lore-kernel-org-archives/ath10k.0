Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFDwO-0001MO-HD
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 07:50:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [GIT] Networking
References: <20181023.202921.1185045750138652543.davem@davemloft.net>
 <CAHk-=whuhCGujWKO8JObGQaSdWOpJBXdkM-B-vD80QZifveScw@mail.gmail.com>
 <CAHk-=wh2H9jE2RXibQgWs3_Q539roj62_gzPXKjnhhKqSFcw2g@mail.gmail.com>
Date: Wed, 24 Oct 2018 10:50:38 +0300
In-Reply-To: <CAHk-=wh2H9jE2RXibQgWs3_Q539roj62_gzPXKjnhhKqSFcw2g@mail.gmail.com>
 (Linus Torvalds's message of "Wed, 24 Oct 2018 08:23:44 +0100")
Message-ID: <87lg6nu6k1.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Govind Singh <govinds@codeaurora.org>, David Brown <david.brown@linaro.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Niklas Cassel <niklas.cassel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Oct 24, 2018 at 7:01 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Hmm. Tentatively pulled, but there's something wrong with the Kconfig rules.
>
> Confirmed.

BTW, our emails crossed and more info in the other email[1].

> I did a978a5b8d83f ("net/kconfig: Make QCOM_QMI_HELPERS available when
> COMPILE_TEST") to fix the breakage.

Thanks, though I don't see it yet as I guess you haven't pushed it yet.
Do note that it _might_ conflict the other commit which I suspect is in
also coming to you:

ccfb464cd106 ("soc: qcom: Allow COMPILE_TEST of qcom SoC Kconfigs")

> Why wasn't this noticed in testing?

Mostly bad timing due to my vacation. I did do allmodconfig build but
not sure why I missed the warning, also the kbuild bot didn't report
anything. Jeff did report[2] it last week but I was on vacation at the
time and just came back yesterday and didn't have time to react to it
yet. Really sorry for the mess.

[1] https://lkml.kernel.org/r/87pnvzu7i6.fsf@codeaurora.org

[2] http://lists.infradead.org/pipermail/ath10k/2018-October/012330.html

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
