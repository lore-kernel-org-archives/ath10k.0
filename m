Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22c.google.com ([2607:f8b0:4001:c0b::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT8kY-0007Rt-NX
 for ath10k@lists.infradead.org; Mon, 16 Jan 2017 14:59:12 +0000
Received: by mail-it0-x22c.google.com with SMTP id k200so6964481itb.1
 for <ath10k@lists.infradead.org>; Mon, 16 Jan 2017 06:58:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201701150241.yCa5lXiT%fengguang.wu@intel.com>
References: <20170113111022.5570-1-ext.waldemar.rymarkiewicz@tieto.com>
 <201701150241.yCa5lXiT%fengguang.wu@intel.com>
From: Waldemar Rymarkiewicz <ext.waldemar.rymarkiewicz@tieto.com>
Date: Mon, 16 Jan 2017 15:58:24 +0100
Message-ID: <CAJ2u5D++qAhQZObmw_P_d8AsWWmi-v0AK+dRjo96j+gXgk2rVg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Search SMBIOS for OEM board file extension
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
To: kbuild test robot <lkp@intel.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, "Liu,
 Alan" <alanliu@qca.qualcomm.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, kbuild-all@01.org, "Chang, Robert" <rwchang@qti.qualcomm.com>, Bartosz Markowski <bartosz.markowski@tieto.com>

On 14 January 2017 at 19:09, kbuild test robot <lkp@intel.com> wrote:
> Hi Waldemar,
>
> [auto build test WARNING on ath6kl/ath-next]
> [also build test WARNING on v4.10-rc3 next-20170113]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Waldemar-Rymarkiewicz/ath10k-Search-SMBIOS-for-OEM-board-file-extension/20170115-005232
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: xtensa-allmodconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=xtensa
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_check_bdfext':
>>> drivers/net/wireless/ath/ath10k/core.c:754:2: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
>      strscpy(ar->id.bdf_ext, bdf_ext + strlen(magic),
>      ^

I will fix and send v2.

Thanks,
/Waldek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
