Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CE2C433FE
	for <ath10k@archiver.kernel.org>; Sat,  1 Oct 2022 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vzr7Zfi0W/l4gX/wuCsN4y9DNvvo0v3TQ3UIKQgusAg=; b=wft5PPSF0WSH+C
	7EcY28YEplZKbrO+ozQEoAUpoWBRgZ70lt9HaDPF04b/kFIkEspJU5qae7H6BOlCxvFBS2Sk0x7JG
	Elb3ozAkaIs31nCx9Bf3DW0k3Imr4c/bEpwBuOhRypERCx6f3Q/RTHqGS+vOpcQ6tSbamAgLhh70B
	P8UD55XxkrIWEmvsCneOUXs80xHF4jWwpYQSGtJpZjyCZV36MGc4dfcDYNO/WxdCvcSrEOmw5QAwx
	Bl1TjvnhWNMn9qa7vZpiPh2pwPjsXNTC02Bj3qQMST0Cn5+PV7cRSax33UNqFJxPwl3y4RfyRsNLt
	jW6PdzG4z6imiqNQMRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeZKU-00E3fR-NE; Sat, 01 Oct 2022 10:02:42 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeZKQ-00E3dx-Qc
	for ath10k@lists.infradead.org; Sat, 01 Oct 2022 10:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664618558; x=1696154558;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+UwNpsvHJmisqzpP+qnfA7JeP+1J0DxI7ZYU1fF1K2c=;
  b=lj2attMmEF8frp2P3WXkwe2KjPO6wUeZTb4letyzso3pMYQ4G6cjNtuK
   RAj9PFmn9G2H1c22ZlOivSDQ7WyJb8bVOwAsxxvwcXYUwBQHKt5X2wruY
   8xoTnEclUDEetiadX9cJmYpSEE+NU0nbWvp7EYvsHWVVrSqVhnoOM+RsU
   0pf9lcyd2dxQ2ZRFE/M3Zf50Gh7H/uskmh1HsnurI5O12VVUFzyj96ZkR
   7mmyaoEGkZ+JTvgTUBBjbHzwEqubi8/HbzgjxTwIZZ9WSTkCxyAftde/h
   5+4DZx9jNZa7bzupI9m4bsvhE14US/DK7nlTOkZwTTlYp4usXJR352Def
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="366413208"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="366413208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2022 03:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685575662"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="685575662"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Oct 2022 03:02:25 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oeZKC-00027P-36;
	Sat, 01 Oct 2022 10:02:24 +0000
Date: Sat, 01 Oct 2022 18:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 ec6c7f15c10f45a63ff39a01621cb0efc1d359dd
Message-ID: <6338102d.ENsB/J4Bcf6sFryq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_030238_941740_63018539 
X-CRM114-Status: UNSURE (   4.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: ec6c7f15c10f45a63ff39a01621cb0efc1d359dd  wifi: ath11k: Fix spelling mistake "chnange" -> "change"

elapsed time: 1618m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
x86_64                              defconfig
x86_64               randconfig-a002-20220926
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64               randconfig-a001-20220926
i386                             allyesconfig
x86_64               randconfig-a003-20220926
i386                          randconfig-a001
m68k                             allmodconfig
arm                                 defconfig
x86_64               randconfig-a004-20220926
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
x86_64                               rhel-8.3
s390                                defconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220926
arc                              allyesconfig
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
arm64                            allyesconfig
alpha                            allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
x86_64                           allyesconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                          axs101_defconfig
mips                 decstation_r4k_defconfig
sh                           se7712_defconfig
arm                         lpc18xx_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
sh                         ecovec24_defconfig
i386                 randconfig-a003-20220926
i386                 randconfig-a001-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a002-20220926
arm                       aspeed_g5_defconfig
mips                  maltasmvp_eva_defconfig
arm                           h5000_defconfig
m68k                          atari_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7705_defconfig
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
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
hexagon              randconfig-r045-20220926
i386                          randconfig-a002
riscv                randconfig-r042-20220926
i386                          randconfig-a004
hexagon              randconfig-r041-20220926
i386                 randconfig-a012-20220926
i386                          randconfig-a006
x86_64               randconfig-a015-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a015-20220926
x86_64               randconfig-a012-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a014-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64                        randconfig-k001
riscv                    nommu_virt_defconfig
powerpc                        icon_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                          pxa168_defconfig
powerpc                 mpc832x_mds_defconfig
hexagon              randconfig-r041-20220925
hexagon              randconfig-r045-20220925
arm                          moxart_defconfig
arm                         mv78xx0_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
