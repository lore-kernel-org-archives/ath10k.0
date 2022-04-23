Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C2C433FE
	for <ath10k@archiver.kernel.org>; Sat, 23 Apr 2022 23:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJrFiTDspqmxz0rglq6qy90M/QSEnB0AuRqyFesjrF0=; b=p+LzJPcOWn5NaN
	vtFNV1MiO4Nt4J2JsCnkIyMFzPSLE1NsVqPr5E7v4EWNA/Q1OJgPRGy8/u6i5Vf9lEq6Z3bNuhnXj
	DsISm0L9hz61L3fivrpCA4F5MYXFvOFxScwtrvVjmG3GEPRvJiZA1frOMOgcwAziy4jhoJnyyrf+8
	LeH79hFDnfHDP1IDtjj6BmA/Y9DiouOfLy92NvpY+dEqXD8gzMJk4JDX5coL4KR9qmX6hxrcW2+HE
	igk/Xd2HubVeAztZuM7lFTftu/+MhaCzehUbFlQtzLEEjKEKz06XBcvpO2AaC7C0EjaSwRjCSGjqE
	bR+Co7OSUgjGBYWmjyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niP5o-005IDX-EY; Sat, 23 Apr 2022 23:23:08 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niP5k-005ID1-5Z
 for ath10k@lists.infradead.org; Sat, 23 Apr 2022 23:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650756184; x=1682292184;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=XPRx2X5p0p1TMM5iL6MF10tsFjIL0xF5nzLg6dUGBzs=;
 b=YxfChOv9JXllGVNvkvLqkOvxVdFWdfsXbMUFzQRlA1f/LQlLzzfaTOoI
 ckCO6K67aUBJNcKw2zBfhzS+hqdeLrjaPDzKpFvRv0HNCjxVIsTkkDsKe
 3XfgRiU20Saa8UsvcDjuukjYWLwisqkwU4BhnT0Hh8PqxegpwGuf77qI/
 1DPeiYZhsbkHlKomZrnxl0FfeEgewh1j7fo7FCZdOiDGZrrN+YnfgEq3W
 5PgUZVymL2+BRZt7IIBu829+QN1OujGTGbt2Qep+ypODrlKrKvlksXi8V
 e5iDoRAa4A25XtNr078GQowhISBO78Cm4unPZqDGbLqC2tJizYVrmPRBp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="264461912"
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; d="scan'208";a="264461912"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2022 16:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; d="scan'208";a="557041633"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 23 Apr 2022 16:22:57 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1niP5c-0000hj-Sd;
 Sat, 23 Apr 2022 23:22:56 +0000
Date: Sun, 24 Apr 2022 07:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e999a5da28a0e0f7de242d841ef7d5e48f4646ae
Message-ID: <62648a3c.rsFGHV4Evqc5CjlE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_162304_338557_71B2CD27 
X-CRM114-Status: UNSURE (   3.78  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e999a5da28a0e0f7de242d841ef7d5e48f4646ae  ath9k: fix QCA9561 PA bias level

elapsed time: 763m

configs tested: 156
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                             pxa_defconfig
sparc                       sparc64_defconfig
xtensa                          iss_defconfig
ia64                             alldefconfig
xtensa                  audio_kc705_defconfig
arm                           imxrt_defconfig
xtensa                              defconfig
alpha                               defconfig
um                                  defconfig
m68k                          atari_defconfig
mips                  maltasmvp_eva_defconfig
arm                          badge4_defconfig
m68k                        mvme147_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           viper_defconfig
openrisc                    or1ksim_defconfig
arc                        vdk_hs38_defconfig
sh                        edosk7760_defconfig
arm                             rpc_defconfig
sh                            hp6xx_defconfig
openrisc                            defconfig
sh                               j2_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    klondike_defconfig
arm                         lubbock_defconfig
sh                           sh2007_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                    xip_kc705_defconfig
arm                             ezx_defconfig
arm                         vf610m4_defconfig
arm                        trizeps4_defconfig
powerpc                         ps3_defconfig
sh                           se7780_defconfig
arm                        spear6xx_defconfig
m68k                            q40_defconfig
ia64                      gensparse_defconfig
sh                          lboxre2_defconfig
arm                      footbridge_defconfig
powerpc                     taishan_defconfig
h8300                               defconfig
powerpc                     tqm8541_defconfig
xtensa                  cadence_csp_defconfig
sparc64                          alldefconfig
m68k                         amcore_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7722_defconfig
arm                            xcep_defconfig
sh                           se7619_defconfig
powerpc                   motionpro_defconfig
powerpc                      pcm030_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            zeus_defconfig
riscv                            allyesconfig
arm                            mps2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220422
arm                  randconfig-c002-20220424
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220424
mips                 randconfig-c004-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
powerpc                      walnut_defconfig
powerpc                     kilauea_defconfig
mips                           ip27_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ppc64e_defconfig
powerpc                      pmac32_defconfig
arm                  colibri_pxa300_defconfig
mips                      malta_kvm_defconfig
arm                         hackkit_defconfig
hexagon                             defconfig
powerpc                    mvme5100_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc44x_defconfig
mips                        omega2p_defconfig
powerpc                     ppa8548_defconfig
arm                          pxa168_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc832x_mds_defconfig
mips                         tb0219_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220424
riscv                randconfig-r042-20220424
hexagon              randconfig-r045-20220424
hexagon              randconfig-r041-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r045-20220422

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
