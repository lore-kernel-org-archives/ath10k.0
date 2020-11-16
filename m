Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZKU-0006Cr-0i
 for ath10k@lists.infradead.org; Mon, 16 Nov 2020 07:53:41 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: drivers/net/wireless/ath/ath10k/sdio.c:2234:2: warning:
 Non-boolean value returned from function returning bool
References: <20201116055212.GA3723@shao2-debian>
Date: Mon, 16 Nov 2020 09:53:29 +0200
In-Reply-To: <20201116055212.GA3723@shao2-debian> (kernel test robot's message
 of "Mon, 16 Nov 2020 13:53:19 +0800")
Message-ID: <87o8jx20w6.fsf@codeaurora.org>
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
To: kernel test robot <rong.a.chen@intel.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

+ ath10k list

kernel test robot <rong.a.chen@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f01c30de86f1047e9bae1b1b1417b0ce8dcd15b1
> commit: 3c45f21af84eb05a355919abc80cf70a3a681cee ath10k: sdio: add
> firmware coredump support
> compiler: nios2-linux-gcc (GCC) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> cppcheck possible warnings: (new ones prefixed by >>, may not real problems)
>
>>> drivers/net/wireless/ath/ath10k/sdio.c:2234:2: warning: Non-boolean
> value returned from function returning bool
> [returnNonBoolInBooleanFunction]
>     return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
>     ^

Is this really a problem? I guess we could change that to "!!(param &
HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW)" but how is that better and
does it make any practical difference when
ath10k_sdio_is_fast_dump_supported() returns a boolean anyway?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
