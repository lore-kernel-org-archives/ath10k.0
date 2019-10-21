Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMfx4-0003ld-0D
 for ath10k@lists.infradead.org; Mon, 21 Oct 2019 22:14:59 +0000
Date: Tue, 22 Oct 2019 06:14:32 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/4] mac80211: Import airtime calculation code from mt76
Message-ID: <201910220654.AzuMkFgk%lkp@intel.com>
References: <157148503639.2989444.8337290298332344733.stgit@toke.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157148503639.2989444.8337290298332344733.stgit@toke.dk>
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
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, kbuild-all@lists.01.org, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Hi "Toke,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mac80211-next/master]
[cannot apply to v5.4-rc4 next-20191021]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/Add-Airtime-Queue-Limits-AQL-to-mac80211/20191021-234455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/mac80211/airtime.c:211:5: sparse: sparse: symbol 'ieee80211_calc_rx_airtime' was not declared. Should it be static?
>> net/mac80211/airtime.c:282:5: sparse: sparse: symbol 'ieee80211_calc_tx_airtime_rate' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
