Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjkZg-0000ge-Ai
 for ath10k@lists.infradead.org; Wed, 07 Oct 2015 08:59:48 +0000
From: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Subject: RE: [PATCH 2/2] ath10k: set peer MFP flag in peer assoc command
Date: Wed, 7 Oct 2015 08:59:14 +0000
Message-ID: <65097485604c466b8ed93105627e5d14@aphydexm01f.ap.qualcomm.com>
References: <201510071317.0ndTjHKZ%fengguang.wu@intel.com>
 <87612j1427.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87612j1427.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, kbuild test robot <lkp@intel.com>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, Manikanta pubbisetty <c_mpubbi@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

kbuild test robot <lkp@intel.com> writes:

>> Hi Tamizh,
>>
>> [auto build test ERROR on next-20151006 -- if it's inappropriate base, please ignore]
>>
>> config: xtensa-allyesconfig (attached as .config)
>> reproduce:
> >        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=xtensa 
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_peer_assoc_h_crypto':
>>>> drivers/net/wireless/ath/ath10k/mac.c:2014:9: error: 'struct ieee80211_sta' has no member named 'mfp'
>>      if (sta->mfp &&

>This is expected as the patch depends on not yet commited patch 'Revert
>"mac80211: remove exposing 'mfp' to drivers"'.

Yes, I have mention about the dependency in commit log notes. I have sent the required patch previous to this patch sets. 
-- 
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
