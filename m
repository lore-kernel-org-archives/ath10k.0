Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrQ8i-0007Z6-Ie
 for ath10k@lists.infradead.org; Wed, 28 Oct 2015 12:47:41 +0000
Received: by ykba4 with SMTP id a4so5990812ykb.3
 for <ath10k@lists.infradead.org>; Wed, 28 Oct 2015 05:47:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201510281954.CJInakYj%fengguang.wu@intel.com>
References: <1446031474-29368-1-git-send-email-bartosz.markowski@tieto.com>
 <201510281954.CJInakYj%fengguang.wu@intel.com>
Date: Wed, 28 Oct 2015 13:47:19 +0100
Message-ID: <CACKGw+Fj+H8AuG7uqa7iswnsxJJ3w==Uby_2FNkY-7ehBayVJg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add QCA9377 chipset support
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 28 October 2015 at 12:51, kbuild test robot <lkp@intel.com> wrote:
> Hi Bartosz,
>
> [auto build test WARNING on next-20151022 -- if it's inappropriate base, please suggest rules for selecting the more suitable base]
>
> url:    https://github.com/0day-ci/linux/commits/Bartosz-Markowski/ath10k-add-QCA9377-chipset-support/20151028-192708
> config: i386-randconfig-x004-201543 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_probe':
>>> drivers/net/wireless/ath/ath10k/pci.c:3040:17: warning: 'pci_ps' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      ar_pci->pci_ps = pci_ps;
>                     ^

I will send a v2 then :-)

Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
