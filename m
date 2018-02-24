Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1epbIK-0002kZ-5N
 for ath10k@lists.infradead.org; Sat, 24 Feb 2018 14:59:25 +0000
Date: Sat, 24 Feb 2018 22:58:42 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v9] ath10k: add LED and GPIO controlling support for
 various chipsets
Message-ID: <201802242215.SCy6eWvP%fengguang.wu@intel.com>
References: <20180222111534.31047-1-s.gottschall@dd-wrt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180222111534.31047-1-s.gottschall@dd-wrt.com>
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
To: s.gottschall@dd-wrt.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@newmedia-net.de>, kvalo@codeaurora.org, kbuild-all@01.org

Hi Sebastian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless-drivers-next/master]
[also build test WARNING on v4.16-rc2 next-20180223]
[cannot apply to ath6kl/ath-next]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/s-gottschall-dd-wrt-com/ath10k-add-LED-and-GPIO-controlling-support-for-various-chipsets/20180224-185406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/gpio.c:84:5: sparse: symbol 'ath10k_register_gpio_chip' was not declared. Should it be

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
