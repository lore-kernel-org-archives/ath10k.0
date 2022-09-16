Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B443C6FA8B
	for <ath10k@archiver.kernel.org>; Fri, 16 Sep 2022 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wa7XsqWaU1lxzh9ko4XfFPnF/Uls0V7whOr6feFgJo8=; b=lmvCSlRzU/aJmS
	G2aC28JyHgP8pZ6nXhteaEOF/NC6q2EY/pie4X+mUn3anze6kD8qDN5sBl9GclbNIdyGjkPGTiQ98
	H5ubfbKnUlZOUoI86dXOn+zBogvbl/zWhg2UARVch6OENj2+sk1p2+WMGoH0+R+om656uGWTAveDk
	NNdEVhpkUKRRnpEwkbRhLptwiOsiIhzNVxDTKQnIiVTapB/LF2EujOlN5POMaCBkV9boI10p59SBu
	dpCuihoNm+rGghLh+YRaSTfWDa1JkcvobCxg5kGcmYTzQ4Hbq5AG1iKjn0z6wLJhBzSkFuNvis3gj
	WHgunNJkA5pIjOW/f8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJRC-00HRiv-Rb; Fri, 16 Sep 2022 22:03:54 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJR6-00HRem-NR
	for ath10k@lists.infradead.org; Fri, 16 Sep 2022 22:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663365828; x=1694901828;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=chsmKit1JJ2mHTLvskBAgn1W+uEANt9SYiEZLb/Guug=;
  b=N71Zw7++2BQyj4RMxgZga7QNjQcMsv0fONeEW/0QkNfEmi86UGM0xuun
   95U/LdN/Cvry800rVkqFH+40gNGMUg6Ahl9Lb6Tu1T1N2/05eVE+34cI8
   lr7w7c/FpbcNDa3T9DZ6AQomdzPNlHuTinknuPFMw21e3RVf7TEoEKbCL
   mfQymzMBq0EBX8pryc4NlkOPu/Osd1t+BSochdMgQfY/O3CD8PAEbj3u8
   7mt8+eTj5xwHWAInZFzMo5cqGMtWOrGdl1xLhMTsaWtNrCIrrCJm+feSB
   Xiu/9S/gdgQIlX2AF5gBASRFnRvIeeDZslgoSF57EcwONndnWeTtLprmv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282114978"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="282114978"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 15:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="862877270"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2022 15:03:40 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZJQx-0002B2-2v;
	Fri, 16 Sep 2022 22:03:39 +0000
Date: Sat, 17 Sep 2022 06:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 deccf8a3cb8ec97a5c51c325c071df958ea3eede
Message-ID: <6324f2b6.ecYyMGAE6mTbx03X%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_150348_855072_9623150D 
X-CRM114-Status: UNSURE (   5.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: deccf8a3cb8ec97a5c51c325c071df958ea3eede  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 134
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220916
x86_64                               rhel-8.3
s390                                defconfig
i386                          randconfig-a001
i386                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a002
i386                          randconfig-a003
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                           allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
s390                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
sh                               allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
x86_64                          rhel-8.3-func
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220916
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arc                              alldefconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
powerpc                      bamboo_defconfig
sh                        edosk7760_defconfig
sh                          polaris_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                    amigaone_defconfig
arm                        oxnas_v6_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
openrisc                       virt_defconfig
mips                      maltasmvp_defconfig
loongarch                           defconfig
sh                         ecovec24_defconfig
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
arc                        nsimosci_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
powerpc                      pcm030_defconfig
powerpc                      pasemi_defconfig
arm                       omap2plus_defconfig
powerpc                      chrp32_defconfig
openrisc                 simple_smp_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7724_defconfig
m68k                          atari_defconfig
sh                          rsk7269_defconfig
powerpc                       maple_defconfig

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-k001
arm                          sp7021_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
hexagon              randconfig-r045-20220917
hexagon              randconfig-r041-20220917

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
