Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zjjzq-0007gS-QU
 for ath10k@lists.infradead.org; Wed, 07 Oct 2015 08:22:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: set peer MFP flag in peer assoc command
References: <201510071317.0ndTjHKZ%fengguang.wu@intel.com>
Date: Wed, 7 Oct 2015 11:22:08 +0300
In-Reply-To: <201510071317.0ndTjHKZ%fengguang.wu@intel.com> (kbuild test
 robot's message of "Wed, 7 Oct 2015 13:34:39 +0800")
Message-ID: <87612j1427.fsf@kamboji.qca.qualcomm.com>
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
To: kbuild test robot <lkp@intel.com>
Cc: Manikanta pubbisetty <c_mpubbi@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, c_traja@qti.qualcomm.com, kbuild-all@01.org, johannes@sipsolutions.net

kbuild test robot <lkp@intel.com> writes:

> Hi Tamizh,
>
> [auto build test ERROR on next-20151006 -- if it's inappropriate base, please ignore]
>
> config: xtensa-allyesconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=xtensa 
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_peer_assoc_h_crypto':
>>> drivers/net/wireless/ath/ath10k/mac.c:2014:9: error: 'struct ieee80211_sta' has no member named 'mfp'
>      if (sta->mfp &&

This is expected as the patch depends on not yet commited patch 'Revert
"mac80211: remove exposing 'mfp' to drivers"'.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
