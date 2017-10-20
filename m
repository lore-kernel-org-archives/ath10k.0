Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5QoV-0001Lr-6K
 for ath10k@lists.infradead.org; Fri, 20 Oct 2017 06:29:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix build errors with !CONFIG_PM
Date: Fri, 20 Oct 2017 06:29:21 +0000
Message-ID: <87efpyfi2n.fsf@kamboji.qca.qualcomm.com>
References: <20170919232416.108247-1-briannorris@chromium.org>
 <2809b2cf512d4c198d3cef3f5e468c3c@euamsexm01e.eu.qualcomm.com>
 <87vajbgqcz.fsf@kamboji.qca.qualcomm.com>	<20171019171224.GA46096@google.com>
 <20171019184517.GA76422@google.com>
In-Reply-To: <20171019184517.GA76422@google.com> (Brian Norris's message of
 "Thu, 19 Oct 2017 11:45:19 -0700")
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
To: Brian Norris <briannorris@chromium.org>
Cc: Ryan Hsu <ryanhsu@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, Grant Grundler <grundler@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Brian Norris <briannorris@chromium.org> writes:

> Build errors have been reported with CONFIG_PM=n:
>
> drivers/net/wireless/ath/ath10k/pci.c:3416:8: error: implicit
> declaration of function 'ath10k_pci_suspend'
> [-Werror=implicit-function-declaration]
>
> drivers/net/wireless/ath/ath10k/pci.c:3428:8: error: implicit
> declaration of function 'ath10k_pci_resume'
> [-Werror=implicit-function-declaration]
>
> These are caused by the combination of the following two commits:
>
> 6af1de2e4ec4 ("ath10k: mark PM functions as __maybe_unused")
> 96378bd2c6cd ("ath10k: fix core PCI suspend when WoWLAN is supported but
> disabled")
>
> Both build fine on their own.
>
> But now that ath10k_pci_pm_{suspend,resume}() is compiled
> unconditionally, we should also compile ath10k_pci_{suspend,resume}()
> unconditionally.
>
> And drop the #ifdef around ath10k_pci_hif_{suspend,resume}() too; they
> are trivial (empty), so we're not saving much space by compiling them
> out. And the alternatives would be to sprinkle more __maybe_unused, or
> spread the #ifdef's further.
>
> Build tested with the following combinations:
> CONFIG_PM=y && CONFIG_PM_SLEEP=y
> CONFIG_PM=y && CONFIG_PM_SLEEP=n
> CONFIG_PM=n
>
> Fixes: 96378bd2c6cd ("ath10k: fix core PCI suspend when WoWLAN is
> supported but disabled")
> Fixes: 096ad2a15fd8 ("Merge branch 'ath-next'")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/net/wireless/ath/ath10k/pci.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> On Thu, Oct 19, 2017 at 10:12:25AM -0700, Brian Norris wrote:
>> The solution would seem to be either to kill the #ifdefs around
>> ath10k_pci_{suspend,resume}() and friends (and use __maybe_unused
>> instead, to further extend Arnd's patch), or else revert Arnd's stuff
>> and go with CONFIG_PM_SLEEP everywhere, which would resolve the original
>> warning (promoted to error) that Arnd was resolving.
>> 
>> I can send out one of these if you'd like.
>
> Here you go :)

Thanks! As this an unusual merge problem between two branches I applied
this manually to ath.git master-pending branch for now. Let's see if
kbuild bot is happy now.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
