Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C980C00A5A
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 01:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EkabHN3jSyQqw2KA0iqcz10tJyKCHMQOtxR3UZXOVWA=; b=vnd2+dV1SPnAf8
	RvImyq7m0FtnXI1PIxWp0z6dfqoMYaQR5I2TPLVb1JfJy6Z89uEVNm/jXkoUxQnYmjL+e7q4w9qMp
	4hkD9LjkQrLP2DcfVOhWJ/w8aGeH3vc6jrRqGeo/kwlnPGRRoaqksHcUh+74Gr7sNrqAsxM7FmVb6
	3kPxiCog8SYrdmYWrRjbVS7IKl4AG3ir4iPD+xxHcu6vtz7ws3XlUp5V9GPnZbJ5if1GnDMMFH4su
	nMDObzxCkyuCskJSg6GdDM8v7ZF05SxJbw378WUsxg1qYpCnsrsmDIiFPNaJmtrR7pfUiSOWFPawT
	o2TeLX8Ij+X03Fxo33uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxGt-00GTVR-Jl; Wed, 18 Jan 2023 01:29:47 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxGq-00GTUq-N1
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 01:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674005384; x=1705541384;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LoFHVTWK0eGGqeiMH3d+WLpCCKiBBbX4wKZmi9lnwiQ=;
  b=dv65vZGsDM03iQjfbphqDavDi8O9tny2zvMDpCd6/rh+P552lY+5CNiB
   Cb36WrGq++9Z2imN0aNiC5dzywFuiF9M5NffFuEsISsfefAgZU/x7ZqO6
   +XyQiEOJ+XAHK0Vh9o4M29k8hA4tcN99wiNeSeOXByP/+LtzlYyZcDt58
   s+UKYTP9EPdni05Z+IVx7nr4frUsumB8H+8kM7IYcq8be+2C0G6bi5dQM
   KbIQc221LgP/oFqZnmUkHrP9h8WgcgItJbmVZthVta9P438pjRdtpPbXf
   j1WgiriZ9hq1ZxUgdhRRsZDTNXz4iDGWMIbHgXFkWMHA1JMFK5TbEeJqp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="322560854"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="322560854"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 17:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="652724208"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="652724208"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Jan 2023 17:29:40 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHxGm-0001Wu-0G;
	Wed, 18 Jan 2023 01:29:40 +0000
Date: Wed, 18 Jan 2023 09:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b234851cd3142c1033dc4e59313744e7d69430f4
Message-ID: <63c74b6e.0yyJByZRqc0wDhN0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_172944_847420_5CB7792A 
X-CRM114-Status: UNSURE (   6.34  )
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
branch HEAD: b234851cd3142c1033dc4e59313744e7d69430f4  ath6kl: minor fix for allocation size

elapsed time: 728m

configs tested: 143
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
i386                                defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arc                                 defconfig
alpha                               defconfig
x86_64                           allyesconfig
s390                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
s390                             allmodconfig
i386                          randconfig-a016
x86_64                           rhel-8.3-bpf
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a004
x86_64               randconfig-a011-20230116
arc                              allyesconfig
x86_64                        randconfig-a002
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
ia64                             allmodconfig
powerpc                          allmodconfig
i386                             allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a015-20230116
arm64                            allyesconfig
x86_64               randconfig-a014-20230116
x86_64                        randconfig-a006
arm                              allyesconfig
x86_64               randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a011-20230116
arc                  randconfig-r043-20230115
i386                 randconfig-a016-20230116
s390                 randconfig-r044-20230116
i386                 randconfig-a015-20230116
riscv                randconfig-r042-20230116
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117
i386                 randconfig-c001-20230116
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
xtensa                  cadence_csp_defconfig
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
sh                     magicpanelr2_defconfig
m68k                            q40_defconfig
ia64                      gensparse_defconfig
mips                  decstation_64_defconfig
m68k                          multi_defconfig
powerpc                    sam440ep_defconfig
sh                         ap325rxa_defconfig
riscv                            allyesconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
m68k                          hp300_defconfig
arm                            lart_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a001-20230116
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a006-20230116
i386                 randconfig-a005-20230116
x86_64                        randconfig-k001
hexagon              randconfig-r041-20230116
arm                          sp7021_defconfig
powerpc                     ppa8548_defconfig
riscv                randconfig-r042-20230117
hexagon              randconfig-r045-20230117
s390                 randconfig-r044-20230117
hexagon              randconfig-r045-20230115
hexagon              randconfig-r041-20230117
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
riscv                randconfig-r042-20230115
arm                  randconfig-r046-20230116
s390                 randconfig-r044-20230115
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230115
powerpc                        fsp2_defconfig
mips                           rs90_defconfig
powerpc                 mpc836x_rdk_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      acadia_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
arm                         hackkit_defconfig
mips                          malta_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8560_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     kmeter1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
