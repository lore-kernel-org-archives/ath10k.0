Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA3C77B75
	for <ath10k@archiver.kernel.org>; Fri, 12 May 2023 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kTzgrWLe2Zpc8xH7ikevEbqKylw9/PCQK0KA/De9TWs=; b=uUS6YmdYJ3fxOm
	wwneCK1XpZaPLcqit6rZIqUX2mXuM+/zI15l97ynnIigD3YSBWALaUwKtmHotqL7XVx9fIR3eN1ea
	4Bh/qX3vTm7/8q8TWgJMEoAqWUv9qTVSo7CjOeKIVWIqN/o6/FX4hXpKJ4F1bC+AF79EQmYBY+plo
	gakWbRUhictQcIHgNLk4cAAIOKjItx1bPTeCHbmpHBJhfjtw93bPydEjA3UxZMYxN5iwyqBU9p72t
	/xx3VpFVJugisOzGRxNvORByuH4BZlbzkJiru32x+NBBpbB+bS36aLENO6SEyx7xAbupSnAA52aNL
	5oPpAAqWnSpgctGgl1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTjV-00CAgA-28;
	Fri, 12 May 2023 14:26:57 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTjT-00CAfM-0M
	for ath10k@lists.infradead.org;
	Fri, 12 May 2023 14:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683901615; x=1715437615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xx5+wlf/N8+iZI9Bp4G6CTUNM1ojf6HIXWta0j61j1Y=;
  b=SL3P8korRltLqbf2iJA8zHlyDGArPkIcmCDXhjjNUuGO0+zUJalM7pPF
   SnnuQpsPtoAqepVVxdFbCRfW4UUiTE5Txq+a3yS7EOZV9e+fJtbY0Sg5E
   RECkeYH2w7NhoTf+gWD+SiYwUZEJvTmpxvkJHa0TsInkNvByV0R/UNA7z
   4lCeAxTKdBM9znU+MB0sxsAO29+fZjcLs9dGYVO1aVf4bEEtJ6CKAbJCx
   Qff0udiSoi9nufM25P6kdNObXjoGhnjkwFVgzlFL39OaYrndcE/I83wgg
   K2I3VLyDv+6zf95A1AvQpn2HqQ9To0fgaq6U1+h0G6cHilGsY4BdsqZyb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353933404"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353933404"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 07:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650652032"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650652032"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 07:26:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxTjN-0004vg-0Q;
	Fri, 12 May 2023 14:26:49 +0000
Date: Fri, 12 May 2023 22:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [kvalo-ath:pending 50/51]
 drivers/net/wireless/ath/ath11k/testmode.h:19: multiple definition of
 `ath11k_tm_wmi_event';
 drivers/net/wireless/ath/ath11k/wmi.o:drivers/net/wireless/ath/ath11k/testmode.h:19:
 first defined here
Message-ID: <202305122213.1eOA66xV-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_072655_192192_A8E00B9F 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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
head:   229ea354bdd24bf3c33c9447674fab8d609e24a2
commit: f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c [50/51] wifi: ath11k: factory test mode support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230512/202305122213.1eOA66xV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122213.1eOA66xV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   aarch64-linux-ld: drivers/net/wireless/ath/ath11k/mac.o: in function `ath11k_tm_wmi_event':
>> drivers/net/wireless/ath/ath11k/testmode.h:19: multiple definition of `ath11k_tm_wmi_event'; drivers/net/wireless/ath/ath11k/wmi.o:drivers/net/wireless/ath/ath11k/testmode.h:19: first defined here
--
   In file included from drivers/net/wireless/ath/ath11k/wmi.c:22:
>> drivers/net/wireless/ath/ath11k/testmode.h:17:6: warning: no previous prototype for 'ath11k_tm_wmi_event' [-Wmissing-prototypes]
      17 | void ath11k_tm_wmi_event(struct ath11k_base *ab, u32 cmd_id, struct sk_buff *skb)
         |      ^~~~~~~~~~~~~~~~~~~


vim +19 drivers/net/wireless/ath/ath11k/testmode.h

d5c65159f28953 Kalle Valo            2019-11-23  16  
f3d1f7ae115e12 Govindaraj Saminathan 2023-05-12 @17  void ath11k_tm_wmi_event(struct ath11k_base *ab, u32 cmd_id, struct sk_buff *skb)
d5c65159f28953 Kalle Valo            2019-11-23  18  {
d5c65159f28953 Kalle Valo            2019-11-23 @19  }
d5c65159f28953 Kalle Valo            2019-11-23  20  

:::::: The code at line 19 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
