Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B972C77B73
	for <ath10k@archiver.kernel.org>; Tue, 30 May 2023 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IyP7O/bLMSMMomVg/K5YTfsN10XyYR7IrZNOA/XVmlI=; b=DJKDNQ5KLPUhjO
	RWfPvic33qiRyHN59LwWN+ouOynMz86Au9tCbSe3kpbsL0PwD3colEe3fgyqsa878o8DVeS9qxkQq
	e0H6YHhbSObmU/RwHoX3i5kUi/iflAVN1/HXD/0O47LrDP35OYzHIxqJkBLxsx7gxz+8eWfRqWhie
	dyCYDCKYVOhQwJLYYFDpAg/O6yvM9EZnTWeAUHbw1Wd//OAr0lLoXGN3seghe6H323p8cIwTgLGcp
	VlxaPb99rlHDUxuUMBjdbwY8kc/Fd09U2EQA4qMiO7x++XyOETnZhUxtyH4YDB1/CcTGKY4YxSCYI
	Vfa/6fcbVie6G14Hkidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3y3V-00DlVZ-0F;
	Tue, 30 May 2023 12:02:25 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3y3S-00DlUK-0m
	for ath10k@lists.infradead.org;
	Tue, 30 May 2023 12:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685448142; x=1716984142;
  h=date:from:to:cc:subject:message-id;
  bh=Nsxj6Q5itNGKIXUkLrrDOA+AjgVZl5raqfXufZ7XZE8=;
  b=Y2WEv+VopRTNHM4Ob3eYCaDLroC8aqwZ2fjvdDmx0Qi0Fj9HKs/l7DGr
   B5IXZ3Y0f+vRibaDNnYjKLnDUHl6cPGoyJVe7fpCqMjjjQyyQSCiiNJ8r
   /OrW9dG9Hb6CDh3zAGWEnW0CCzqvsuL0XQY67P8Ut9gVehHz+cB6gYnMa
   XqQu7pPGPmfVC8dcZ6UbPLofT56u4lEBosxndwvFYuekL55mebF/R3cps
   aR6fAfSLcw/YU/2reGanxIWkW4vXI1wKbyR9JaI//Ewq4+zJ/NNEy1TxI
   1YAYuPyrxowGVJMArX6Wn4FPAYqMlrHHfjoiYiXiZZDEQsDN9VhFGvP5K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420654027"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="420654027"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 05:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="1036567579"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="1036567579"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 05:02:19 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3y3O-0000Un-1L;
	Tue, 30 May 2023 12:02:18 +0000
Date: Tue, 30 May 2023 20:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 27554c60828321bc7a3dce10f3262d44d18dfe27
Message-ID: <20230530120121.LX_BC%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_050222_372381_34BA34B4 
X-CRM114-Status: UNSURE (   4.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 27554c60828321bc7a3dce10f3262d44d18dfe27  Merge branch 'pending' into master-pending

elapsed time: 5856m

configs tested: 41
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
