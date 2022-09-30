Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A417C433F5
	for <ath10k@archiver.kernel.org>; Fri, 30 Sep 2022 03:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12nfe5OBfur6xPQtSUqg9ta0WXlROrW+Erhw5Onr+nU=; b=vj6YRDod62kgJI
	b6CIA45VuqE8k6DJKjzWqjzDq6LOqzVMUPZJJYcB2aRZG7Ka7eHslW3Qtxx0cVP0hEa+DazcsNjEp
	FCTUR6w9yaH8uZPw4hLFSjo0vZ56ZvD863Nc09oxLeaHsLJKxdpL3B6h+bvR0Zq94qh3EqIAQ7eMO
	J54v4EaPomz0KZXYYbP6sAAO5v/aXeEdK5tdf9i1W+gaYEsafEdYJYNrDfb9GkZ3V40qYeNZxlYEV
	Lb3byTHKT5ByuuS9q4k3GCZX3Ewns8fYPayGG6SXmZ48frM8pb1aAu+kAM9F/qHIGeubfQ7DSNZaM
	HVXLYsUEaKGOzsdbfpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe6xG-006xWQ-1S; Fri, 30 Sep 2022 03:44:50 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe6xD-006xVh-Mo
	for ath10k@lists.infradead.org; Fri, 30 Sep 2022 03:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664509487; x=1696045487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YOOnbICJ6yfRfYqgiU8T2OMOHtsEhEb0ZO0L7QxbnsI=;
  b=fGvNlC16sUG/+gywnLzDu0mBTSdBXwSMK1OpxPuuej/nZG4jxMjOj23a
   LbiXsVGYsY4nj73eMx4KUa85j55lsisgJYWSF79OUZzCMZOrjMMMQNCC+
   xOD3vvKunhC7ynnqJMYaSangZdUqmN+5yEQA/3G/i4C7THyS+mS9GH2oo
   2q4JH09IQA0LHRl3nefVjK02SQaBycqVhvHxpyhrMOJfYYuLI9EERfYry
   xSLcECYh501AWoxoIqBFBfQ1WUXcWkrZktDGo5nADGXTu2TnvH8oe+5G5
   OhptD2KKr2oQck0T1saYAYqc7JnT9szFawr9Sp6+gi4m5edYPGUDodjd5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="302067170"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; 
   d="scan'208";a="302067170"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 20:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="726697873"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; 
   d="scan'208";a="726697873"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2022 20:44:40 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oe6x6-00021M-05;
	Fri, 30 Sep 2022 03:44:40 +0000
Date: Fri, 30 Sep 2022 11:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 b7359c7cbbd54850f824f724774c41997668b803
Message-ID: <6336661a.ffLALewT7R8SDI4c%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_204447_817169_5B0272D6 
X-CRM114-Status: UNSURE (   6.12  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: b7359c7cbbd54850f824f724774c41997668b803  wifi: ath12k: fix a recently introduced long line warning in dp.h

elapsed time: 1242m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a006-20220926
i386                             allyesconfig
x86_64                           allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20220925
arm                                 defconfig
m68k                             allmodconfig
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
m68k                             allyesconfig
s390                 randconfig-r044-20220925
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a004-20220926
arm64                            allyesconfig
i386                 randconfig-a006-20220926
arm                              allyesconfig
i386                 randconfig-a005-20220926
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
ia64                         bigsur_defconfig
m68k                             alldefconfig
powerpc                   motionpro_defconfig
m68k                         amcore_defconfig
mips                           xway_defconfig
sh                          lboxre2_defconfig
xtensa                  audio_kc705_defconfig
sh                         ap325rxa_defconfig
xtensa                generic_kc705_defconfig
sh                          urquell_defconfig
arm                         nhk8815_defconfig
loongarch                        alldefconfig
sh                        sh7757lcr_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                         s3c6400_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                        m5307c3_defconfig
arm                       omap2plus_defconfig
powerpc                     ep8248e_defconfig
arm                             ezx_defconfig
powerpc                       maple_defconfig
mips                       bmips_be_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7722_defconfig
powerpc                 mpc837x_mds_defconfig
sh                            migor_defconfig
xtensa                          iss_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
sh                   secureedge5410_defconfig
mips                      loongson3_defconfig
arc                            hsdk_defconfig
sh                     sh7710voipgw_defconfig
sh                             sh03_defconfig
sh                               j2_defconfig
m68k                       m5249evb_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
m68k                        mvme147_defconfig
sh                             shx3_defconfig
sh                     magicpanelr2_defconfig
mips                      fuloong2e_defconfig
arm                          pxa3xx_defconfig
sh                          landisk_defconfig
sh                            hp6xx_defconfig
powerpc                      cm5200_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-a012
i386                 randconfig-a011-20220926
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
hexagon              randconfig-r041-20220928
hexagon              randconfig-r045-20220928
riscv                randconfig-r042-20220928
s390                 randconfig-r044-20220928
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
arm                         hackkit_defconfig
powerpc                      walnut_defconfig
mips                        maltaup_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
