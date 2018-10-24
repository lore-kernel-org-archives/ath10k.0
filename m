Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-01.qualcomm.com ([185.23.61.162])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFEAz-0000g4-4D
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 08:06:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [GIT] Networking
Date: Wed, 24 Oct 2018 08:05:45 +0000
Message-ID: <87h8hbu5uy.fsf@qca.qualcomm.com>
References: <20181023.202921.1185045750138652543.davem@davemloft.net>
 <CAHk-=whuhCGujWKO8JObGQaSdWOpJBXdkM-B-vD80QZifveScw@mail.gmail.com>
 <CAHk-=wh2H9jE2RXibQgWs3_Q539roj62_gzPXKjnhhKqSFcw2g@mail.gmail.com>
 <87lg6nu6k1.fsf@codeaurora.org>
In-Reply-To: <87lg6nu6k1.fsf@codeaurora.org> (Kalle Valo's message of "Wed, 24
 Oct 2018 10:50:38 +0300")
Content-Language: en-US
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
Cc: Govind Singh <govinds@codeaurora.org>, David Brown <david.brown@linaro.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, "niklas.cassel@linaro.org" <niklas.cassel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>

Kalle Valo <kvalo@codeaurora.org> writes:

> Linus Torvalds <torvalds@linux-foundation.org> writes:
>
>> On Wed, Oct 24, 2018 at 7:01 AM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> Hmm. Tentatively pulled, but there's something wrong with the Kconfig rules.
>>
>> Confirmed.
>
> BTW, our emails crossed and more info in the other email[1].
>
>> I did a978a5b8d83f ("net/kconfig: Make QCOM_QMI_HELPERS available when
>> COMPILE_TEST") to fix the breakage.
>
> Thanks, though I don't see it yet as I guess you haven't pushed it yet.
> Do note that it _might_ conflict the other commit which I suspect is in
> also coming to you:
>
> ccfb464cd106 ("soc: qcom: Allow COMPILE_TEST of qcom SoC Kconfigs")

git.kernel.org is alive again for me so I can now check both commits. It
seems that Niklas' commit[1] is more finegrained than what Linus did[2].
I guess either of the commits should be reverted when Niklas' commit
goes to Linus tree, or what's the best course of action?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/commit/?h=for-next&id=ccfb464cd106890cfa51070f75921a273e2852e5

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a978a5b8d83f795e107a2ff759b28643739be70e

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
