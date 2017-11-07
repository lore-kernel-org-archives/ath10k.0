Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eBtKV-0002ZD-KI
 for ath10k@lists.infradead.org; Tue, 07 Nov 2017 02:09:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [ath6kl:pending 15/43]
 drivers/net//wireless/ath/ath10k/pci.c:3416:8: error: implicit declaration of
 function 'ath10k_pci_suspend'
Date: Tue, 7 Nov 2017 02:09:02 +0000
Message-ID: <87zi7yj0w3.fsf@qca.qualcomm.com>
References: <201711052011.Ceuy1uww%fengguang.wu@intel.com>
In-Reply-To: <201711052011.Ceuy1uww%fengguang.wu@intel.com> (kbuild test
 robot's message of "Sun, 5 Nov 2017 20:15:14 +0800")
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
To: kbuild test robot <fengguang.wu@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

kbuild test robot <fengguang.wu@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   f651a1484426fb3233a96e643d49d08eda3b1f3c
> commit: 5a63b04ed508daf5e208fde74bfcc1b3c848ee86 [15/43] Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> config: alpha-allyesconfig (attached as .config)
> compiler: alpha-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 5a63b04ed508daf5e208fde74bfcc1b3c848ee86
>         # save the attached .config to linux build tree
>         make.cross ARCH=alpha 
>
> Note: the ath6kl/pending HEAD f651a1484426fb3233a96e643d49d08eda3b1f3c builds fine.
>       It only hurts bisectibility.
>
> All errors (new ones prefixed by >>):
>
>    drivers/net//wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_suspend':
>>> drivers/net//wireless/ath/ath10k/pci.c:3416:8: error: implicit
>>> declaration of function 'ath10k_pci_suspend'
>>> [-Werror=implicit-function-declaration]
>      ret = ath10k_pci_suspend(ar);
>            ^~~~~~~~~~~~~~~~~~
>    drivers/net//wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_resume':
>>> drivers/net//wireless/ath/ath10k/pci.c:3428:8: error: implicit
>>> declaration of function 'ath10k_pci_resume'
>>> [-Werror=implicit-function-declaration]
>      ret = ath10k_pci_resume(ar);
>            ^~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

This is fixed by a patch from Brian which I applied later, so we should
be able to ignore this warning.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
