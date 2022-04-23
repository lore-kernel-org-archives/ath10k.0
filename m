Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AC6C433EF
	for <ath10k@archiver.kernel.org>; Sat, 23 Apr 2022 23:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12XOPvDze4F/AtvoikG9Af/c3u9pOJgS3YHDb1RIs4s=; b=hFASviEQW6/q+I
	PPVTyi0LcfU65+8kVNoN871KQcONVIJ4crXvSaZ8zYnrOEanJlvA/NzpShOyI35EVAOrRBUo2Sm//
	2mjUhYIVOu5Q9qH9UMKXoozP9qlHAG1YPNgPsCJElABfvnTC6iupj5Wk5rw45+uP3WOqlJzas4vX9
	VfAe/td0yJjWybM7bdIuBs88PTVlQOUJefLIWVjiuFjnDyINXptGVIBTT2+8OIfUV0xCH/kx74tgL
	F9CLn6CBf4EubMw0DPdYLA/5J/9H3HeNu9bT07CxW4evaPXP9GoaMR2D10VzG20U/cOlistH1Mk8k
	cxlJ7tlmrtDFVDLwktNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niP5q-005IE5-V1; Sat, 23 Apr 2022 23:23:10 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niP5n-005ID1-7I
 for ath10k@lists.infradead.org; Sat, 23 Apr 2022 23:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650756187; x=1682292187;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=8MDC+GbonnVUxiKugZCvvVW7B5CVHAOUB+Me8Lxu858=;
 b=W5r/H+TIT+i8CtkuduKTmimg9BPP6IcjYcn/0gFAgLLLMFofqfXSEtT5
 kMaPi9BGJEl+9lmadMmbDWx25ikYOWi8wJkZ3U5GVLxBry6g8y0VZ/Jl5
 hLEdec7z0t7E/ln5zI9V7AGvGgMNYu9Su7zIOSvAdICWhjXNGb5lqaNfy
 d2CiLneVVLDzEIRes4UE1zS3JI2rvyWNygyHD4L1sPTIJFTvafdHQ/o2a
 TVCrmmDO62MfK0J4cVHKRlhiCO5gFfAkFlU1xdb3TH81ot9J3/Uz4RY5E
 1ZlI5QD9/KYQ2nlrIIs9Ama5t8drR1vXpQAZCw8Jff+kRvoE5ZPI+fZDc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="264461913"
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; d="scan'208";a="264461913"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2022 16:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; d="scan'208";a="512074386"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2022 16:22:57 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1niP5c-0000hm-TV;
 Sat, 23 Apr 2022 23:22:56 +0000
Date: Sun, 24 Apr 2022 07:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 01be26cde012478db958d9bde530877c46031e76
Message-ID: <62648a4c.vX9iePx37pDeSSNn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_162307_338674_FA7B8720 
X-CRM114-Status: UNSURE (   4.56  )
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
branch HEAD: 01be26cde012478db958d9bde530877c46031e76  Add localversion-wireless-testing-ath

elapsed time: 762m

configs tested: 153
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
arc                        nsim_700_defconfig
sh                        apsh4ad0a_defconfig
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
xtensa                  audio_kc705_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                                defconfig
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
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
arm                         hackkit_defconfig
hexagon                             defconfig
powerpc                    mvme5100_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc44x_defconfig
arm                         orion5x_defconfig
mips                     cu1830-neo_defconfig
powerpc                     tqm8540_defconfig
mips                          ath25_defconfig
arm                          pxa168_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220424
riscv                randconfig-r042-20220424
hexagon              randconfig-r045-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
