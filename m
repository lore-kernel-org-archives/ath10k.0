Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9998C433F5
	for <ath10k@archiver.kernel.org>; Wed, 23 Feb 2022 00:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k8bH/hMAKnXFhqkYQSk0zSoaQDLcBXJz8PPvhVub2rs=; b=RaCaTl3biIdFJw
	8LV8UKkI6n4RiLsf3fZ5+ivy2MUAd5Ge+8hQxR4TB2k2GRb6dwvErp7cwxr/LJMfFJotTSndQNIao
	wrsyMJ7jGEAWWC+rWAObeNv3OEASglujrmxdXA8kovmHt1O+sQkt2CiauRA+/SGbiV9ThgdcKy0mp
	0zaHk11VEMKYzMbi6IZ+e5eXnYZtLWN/NeORWYfWQVq/DkWxXdEwWpioZT+dFDA844xqV4eqfz3vt
	bx8hafTcMo4Wko5xqA54R9/Bao0KMoI7q9M1OGGpoKnGHNIDSRVcTPvh0jJnRZqUpz8IwedTCQMZi
	DgIA60Et2oKwqZi/vYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMfu8-00C2Gz-IL; Wed, 23 Feb 2022 00:53:16 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMfu5-00C2GE-77
 for ath10k@lists.infradead.org; Wed, 23 Feb 2022 00:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645577593; x=1677113593;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=1X6EdUwHgSXxs0uDxZpEWCGnTkJHgKcK3hvP+2WiMCY=;
 b=HOSX1nhH+V1Nay73Gyv0nK9dM694zAvWRCkG9hGnkovCjUTrhHGfM9Up
 fBtoSqEyeTgfv07mEhqRGAifvFcX4TRgbHJYDRkZqT91dOZZMOyaEmdwr
 t5eKL+ErhmTYW6gmLnebOe10fetMWSy/Vlf4OiLYLQ9HiRL9xWw3uD64F
 4xxSkUWkbspI/XNcA4gdRl1yUycZWADc4MLkZS/EULVzYlbhxyAarXfAP
 a6/vjw0gAfuhCcvmN3oabvNuLR1pmXZVuQm4wPRb9Svrks5cVdL7slu1M
 tohGgXn0TRO9mctpIm60IlxnJsMpT9+ks6w0G6IFG/1lQdEcMvW9P0G3B g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338288212"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="338288212"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 16:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="683718715"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2022 16:53:09 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMfu0-0000nd-Oi; Wed, 23 Feb 2022 00:53:08 +0000
Date: Wed, 23 Feb 2022 08:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: kbuild-all@lists.01.org, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kalle Valo <quic_kvalo@quicinc.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>
Subject: [kvalo-ath:pending 37/42]
 drivers/net/wireless/ath/ath11k/wow.c:467:5: error: redefinition of
 'ath11k_wow_init'
Message-ID: <202202230812.uOGgSw5k-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_165313_305190_9FE1C138 
X-CRM114-Status: GOOD (  10.30  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   4136ddcfda28450e2d01173e37300b95c8687d9b
commit: cae84a492cacd9b4eecaafd5dab33f5beba8806e [37/42] ath11k: Add basic WoW functionalities
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202230812.uOGgSw5k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=cae84a492cacd9b4eecaafd5dab33f5beba8806e
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout cae84a492cacd9b4eecaafd5dab33f5beba8806e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/wow.c:357:5: warning: no previous prototype for 'ath11k_wow_op_suspend' [-Wmissing-prototypes]
     357 | int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wow.c:416:6: warning: no previous prototype for 'ath11k_wow_op_set_wakeup' [-Wmissing-prototypes]
     416 | void ath11k_wow_op_set_wakeup(struct ieee80211_hw *hw, bool enabled)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wow.c:425:5: warning: no previous prototype for 'ath11k_wow_op_resume' [-Wmissing-prototypes]
     425 | int ath11k_wow_op_resume(struct ieee80211_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/wow.c:467:5: error: redefinition of 'ath11k_wow_init'
     467 | int ath11k_wow_init(struct ath11k *ar)
         |     ^~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ath/ath11k/core.h:26,
                    from drivers/net/wireless/ath/ath11k/wow.c:11:
   drivers/net/wireless/ath/ath11k/wow.h:40:19: note: previous definition of 'ath11k_wow_init' with type 'int(struct ath11k *)'
      40 | static inline int ath11k_wow_init(struct ath11k *ar)
         |                   ^~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wow.c: In function 'ath11k_wow_init':
>> drivers/net/wireless/ath/ath11k/wow.c:482:22: error: 'struct wiphy' has no member named 'wowlan'
     482 |         ar->hw->wiphy->wowlan = &ar->wow.wowlan_support;
         |                      ^~


vim +/ath11k_wow_init +467 drivers/net/wireless/ath/ath11k/wow.c

   466	
 > 467	int ath11k_wow_init(struct ath11k *ar)
   468	{
   469		if (WARN_ON(!test_bit(WMI_TLV_SERVICE_WOW, ar->wmi->wmi_ab->svc_map)))
   470			return -EINVAL;
   471	
   472		ar->wow.wowlan_support = ath11k_wowlan_support;
   473	
   474		if (ar->wmi->wmi_ab->wlan_resource_config.rx_decap_mode ==
   475		    ATH11K_HW_TXRX_NATIVE_WIFI) {
   476			ar->wow.wowlan_support.pattern_max_len -= WOW_MAX_REDUCE;
   477			ar->wow.wowlan_support.max_pkt_offset -= WOW_MAX_REDUCE;
   478		}
   479	
   480		ar->wow.max_num_patterns = ATH11K_WOW_PATTERNS;
   481		ar->wow.wowlan_support.n_patterns = ar->wow.max_num_patterns;
 > 482		ar->hw->wiphy->wowlan = &ar->wow.wowlan_support;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
