Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e84wl-00023b-L9
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 13:45:18 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix build errors with !CONFIG_PM
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20171019184517.GA76422@google.com>
References: <20171019184517.GA76422@google.com>
Message-ID: <1444f65cd21b474f808e370a9f831d5e@euamsexm01a.eu.qualcomm.com>
Date: Fri, 27 Oct 2017 15:44:46 +0200
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

Brian Norris <briannorris@chromium.org> wrote:

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
> Fixes: 96378bd2c6cd ("ath10k: fix core PCI suspend when WoWLAN is supported but disabled")
> Fixes: 096ad2a15fd8 ("Merge branch 'ath-next'")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

20665a9076d4 ath10k: fix build errors with !CONFIG_PM

-- 
https://patchwork.kernel.org/patch/10018169/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
