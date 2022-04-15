Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A6CC433F5
	for <ath10k@archiver.kernel.org>; Fri, 15 Apr 2022 02:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HFXumKerpWpM7MO56EfMiS18rWND0VWDll9ay0K2clg=; b=krP96+G+acjtcE
	0vKx9sSadJP1ioMPbdMajJMtshkswGbmDqcRPZAB6QP1WT3OCUVWgW0HdzbsrzUalMhQbUeTuqgtq
	0l1m6vpsMQX+BA6Xka1CzTLnVKPT1DirrJuIBiQD010I+nbaH8ZqlL6wnvPSN/I6ioXTnb53UjYPG
	EZaF/QSiaBqM0+xiiCX+0RZnfC8kMc5DGkIxO/qOLVfBeGamxWNXK2K5G6WyQVl21U4NEPMq4EtrT
	MHT3wa0iD1ur9DGFwpiHjYoHtAnSoYKvs8gg2dsaj9KxvCD5bPZa2FWGLEKCP95NKtmTutADCjnW5
	TJTb8oBhu1NZmDFfQUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfBL8-0084C9-3o; Fri, 15 Apr 2022 02:05:38 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfBL4-0084B3-Jt
 for ath10k@lists.infradead.org; Fri, 15 Apr 2022 02:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649988334; x=1681524334;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=jgpyCPVRe3CJBMJagXD9XzpxRUdKhkYsmdmNwLZw70Q=;
 b=LWbgdFajjKV5WdKDLlHKEwWEv7qgNQTgebjfi3ohr2g07kfH9DN5p0lk
 OJTR4BxF/omDjclGQCURL2Z41ejR2RFgCSbN19+FbJAUYzxETk5X7KI7J
 TalzxyRvE6ODyDyAWImeawHV7pL0ADRGlZnGJqFjRDFAM6zgx+PIbydDV
 o3ORFILYuCCVjLr24QxsSCMfy6sHMdHsFXk2Jjx6BHo7Lm8eehMdfzw1U
 6QgA6OOLlqV3eMXs6a6Xtzsww2hkn6To/SUvrhEItZPvc6+9AZ4jDsQ8+
 t/0LX+z/eLCZxA9nPk72aTZEStJVmaYgChz6E2QlIqnKr4nsKhQqceItu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262518768"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; d="scan'208";a="262518768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 19:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; d="scan'208";a="855728830"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2022 19:05:31 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfBL0-0001PL-H3;
 Fri, 15 Apr 2022 02:05:30 +0000
Date: Fri, 15 Apr 2022 10:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 8d9b896e0b3cc7541ed5a9952fb8a39edf00e056
Message-ID: <6258d2b3.UQX6+I0VmZe+958G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_190534_760233_FDC9E731 
X-CRM114-Status: UNSURE (   4.47  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 8d9b896e0b3cc7541ed5a9952fb8a39edf00e056  Merge branch 'ath-next' into ath-qca

elapsed time: 3405m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220411
arm                         at91_dt_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ppc40x_defconfig
arm                          pxa3xx_defconfig
ia64                             allmodconfig
sh                           se7721_defconfig
arc                            hsdk_defconfig
riscv                            allmodconfig
arc                     nsimosci_hs_defconfig
arm                        mvebu_v7_defconfig
arm                            hisi_defconfig
sparc                       sparc32_defconfig
arc                        vdk_hs38_defconfig
arm                       aspeed_g5_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc834x_mds_defconfig
arc                           tb10x_defconfig
powerpc                      makalu_defconfig
sh                            shmin_defconfig
x86_64               randconfig-c001-20220411
arm                  randconfig-c002-20220411
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
i386                          randconfig-c001
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a011-20220411
x86_64               randconfig-a013-20220411
x86_64               randconfig-a012-20220411
x86_64               randconfig-a016-20220411
x86_64               randconfig-a014-20220411
x86_64               randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                 randconfig-a015-20220411
i386                 randconfig-a014-20220411
i386                 randconfig-a016-20220411
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220412
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                 randconfig-c004-20220413
riscv                randconfig-c006-20220413
arm                  randconfig-c002-20220413
powerpc              randconfig-c003-20220413
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220413
powerpc                      ppc44x_defconfig
mips                      pic32mzda_defconfig
hexagon                             defconfig
arm                      pxa255-idp_defconfig
arm                            mmp2_defconfig
arm                         s5pv210_defconfig
i386                             allyesconfig
powerpc                      walnut_defconfig
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a003-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a002-20220411
i386                 randconfig-a004-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a006-20220411
hexagon              randconfig-r045-20220412
hexagon              randconfig-r041-20220412
s390                 randconfig-r044-20220412
riscv                randconfig-r042-20220412
hexagon              randconfig-r041-20220413
hexagon              randconfig-r045-20220413

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
