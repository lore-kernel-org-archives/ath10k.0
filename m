Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6024DC433F5
	for <ath10k@archiver.kernel.org>; Sat,  1 Oct 2022 10:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a1dagC8Aq35N1ud/HiQWMerRwl12VenvHo1qqPBtNSo=; b=A9frFNUGV10tcu
	fwwNAVa1Jrk4UCUi+j8dtC0YMoa6hjtEimlMScH7Gq40Rn5QZJWo6Iw3g4SSicQBQ8/0NjuYxpMiV
	nQBoa2g95DNh+xAdHSIUk36WH+c8vwrG3UI+s1vu164VwPMDtUUkzsPwjslZl7d+zSEzOo0sUUe2T
	njxMFePmBAykW7ADbEV0mlhGYypDPR5yH7/G74VyeZr7K27xV7LZCWIKG1NhulKvGdQ3/63EukwEX
	8uMmi/aqOBby0RJ1GSojvye6xXMIx3BYHhigzfgEayOmx6EmswuMIoDawCnEqQdYPx4/Cr5Lnx8jo
	twN1zWR5XrYiBzdR8Mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeZhA-00E7tX-Go; Sat, 01 Oct 2022 10:26:08 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeZh6-00E7rr-2K
	for ath10k@lists.infradead.org; Sat, 01 Oct 2022 10:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664619964; x=1696155964;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1cnUJrVFnj8HoSeAOxMiSS5Jkl90oJrVeMHCsO9D220=;
  b=O6ht0B/RCLUTweEaAvNOtTAZD0s6BERWhwYmT+y8/lF4D/eBvNq3s1Un
   i8rwNx718cp9s0wjd35rHjPPTC9Lawn+dZL8eCyUICi3tEmWYFa88bCZ4
   /P5KdFg+koEU52lmcSlTo7YHQRdReLKtnRxfojpBKqno3EfayUMnhKy1D
   ZS0TL0NDGvuS2BOw118gEsAoP0nL/opbqky0Ro3f8aXAzKvGT9n1r4V/u
   gDdoKL9WCvAgoMreZZrzQHno3oH2TV27PSfAaZRJLwMfsU+n7+sttf7YW
   E05jHaEW5y4bcdMCTwJLjmxOFP/frPaU9O32gGmHYqPd9qP/LMWgzqE1T
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="299968808"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="299968808"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2022 03:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="951838835"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="951838835"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Oct 2022 03:25:26 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oeZgT-00028F-1s;
	Sat, 01 Oct 2022 10:25:25 +0000
Date: Sat, 01 Oct 2022 18:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 023baf1318ef21442fab3842bf03883bc81223e0
Message-ID: <63381564.OAXziRe2nT7nyh2O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_032604_154614_9C463CEE 
X-CRM114-Status: UNSURE (   5.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 023baf1318ef21442fab3842bf03883bc81223e0  Add localversion-wireless-testing-ath

elapsed time: 1642m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
powerpc                           allnoconfig
m68k                             allyesconfig
arc                                 defconfig
m68k                             allmodconfig
s390                             allmodconfig
arc                              allyesconfig
alpha                               defconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
arm                                 defconfig
s390                             allyesconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a005-20220926
i386                             allyesconfig
i386                 randconfig-a006-20220926
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20220925
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
powerpc                          allmodconfig
riscv                randconfig-r042-20220925
x86_64                        randconfig-a004
arm64                            allyesconfig
mips                             allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a006
arc                  randconfig-r043-20220926
i386                          randconfig-a014
s390                 randconfig-r044-20220925
i386                          randconfig-a012
i386                          randconfig-a016
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
arm                        shmobile_defconfig
ia64                                defconfig
xtensa                          iss_defconfig
arm                            mps2_defconfig
m68k                       m5249evb_defconfig
riscv                               defconfig
sh                   sh7770_generic_defconfig
mips                           ip32_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
riscv                randconfig-r042-20221001
arc                  randconfig-r043-20221001
s390                 randconfig-r044-20221001
arc                          axs101_defconfig
mips                 decstation_r4k_defconfig
sh                           se7712_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                         lpc18xx_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
sh                         ecovec24_defconfig
arm                           h5000_defconfig
m68k                          atari_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7705_defconfig
arm                       aspeed_g5_defconfig
mips                  maltasmvp_eva_defconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a003-20220926
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                randconfig-r042-20220927
arc                  randconfig-r043-20220927
s390                 randconfig-r044-20220927
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                       ppc64_defconfig
arm                           sunxi_defconfig
powerpc                     rainier_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                        warp_defconfig
arc                      axs103_smp_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
x86_64                        randconfig-a001
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220926
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220926
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220925
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a005
riscv                randconfig-r042-20220926
i386                          randconfig-a011
s390                 randconfig-r044-20220926
i386                          randconfig-a015
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
riscv                    nommu_virt_defconfig
powerpc                        icon_defconfig
arm                          pxa168_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          moxart_defconfig
arm                         mv78xx0_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
