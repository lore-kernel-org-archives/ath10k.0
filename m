Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC293C433F5
	for <ath10k@archiver.kernel.org>; Fri, 11 Feb 2022 02:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBH8aNwkbmIqiC+kuH9TyQk91qJay5Zk32ButnEH2pE=; b=zaqtBPMzg5YCFH
	EkitE3U+ac0sbJylekxDgbW5MpTw7Wa8K9xX9DGJhVE5zm3J0ZMbGuHLrUL1ut2QdfHcdTS5SR2s/
	L96CrfwciqL0BJnHbNdMZ6Hacf1+is3sqLInlu88VJ8/5Yo6bj/SZL44GwYbrv7/CnianH1ZouWBt
	i9/qhCr22gNOPriRor+MbxKsZ5PtO86zp7F0+qRR0uDpHczD6AmT//ARNVyidqQTU0k5AhG2GJCDN
	T2MkEzp/v1DyxGtYPGSssKaeSnZGGR1Ehkn5RoqQWa6fldSnYJnPeJwXNmP0XRic9podDo+ihCDR0
	HrpxQ/Ki66adBrt0popg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nILZx-005Vot-8c; Fri, 11 Feb 2022 02:22:33 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nILZt-005Vng-83
 for ath10k@lists.infradead.org; Fri, 11 Feb 2022 02:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644546149; x=1676082149;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5f02YVZLBpzARFrhomDZHXLQNd5D+umKlFi57u+HvE4=;
 b=Fz17NOZb1fIA5YVsHh6D2TT+u/ZrDMb3A0GFgxEqVrXWmsC5E9NqLBIj
 PngcGigylZInFF9PBvO567S0AozOs8qRbwsnkjfAOoGQM8iF9zZbokUUk
 4Ob/mmt+e0oFvXqlph4JemZPREejdWQhsU3XvXcKhaglyr2XbEdjaXwkL
 ITnDchoadTpp4NGELUbtYH3RX5XJvkwbf7WU45spyw4j+w9B3WBHJvI6G
 qPLQjMGx8ZWteSPyR+rR5BdHaLM6NXOqae20ZeMzln3jF6G5VftnHQ8U3
 ZmQQ7nm6tAI3riHLsnHxdGrL492XkDKQJiHwqABW40HL16zeu9oK6w6nS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248473610"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="248473610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 18:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="500622951"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 10 Feb 2022 18:22:25 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nILZp-00042X-0X; Fri, 11 Feb 2022 02:22:25 +0000
Date: Fri, 11 Feb 2022 10:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 b33173e0197961a561314419cc67b32fd7cbea03
Message-ID: <6205c859.3aBGr0CmnU0flyvq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_182229_342323_2AC272E9 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: b33173e0197961a561314419cc67b32fd7cbea03  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 137
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220210
i386                          randconfig-c001
sh                           se7722_defconfig
sh                         ecovec24_defconfig
arm                         lpc18xx_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
openrisc                 simple_smp_defconfig
arm                        shmobile_defconfig
mips                           ip32_defconfig
nios2                            alldefconfig
sh                          urquell_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
powerpc                     tqm8541_defconfig
arm                           h3600_defconfig
powerpc                       eiger_defconfig
arm                         s3c6400_defconfig
csky                             alldefconfig
powerpc                      ep88xc_defconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
arc                     nsimosci_hs_defconfig
arm                        cerfcube_defconfig
powerpc64                        alldefconfig
sh                                  defconfig
m68k                        m5407c3_defconfig
sh                   sh7770_generic_defconfig
arm                             pxa_defconfig
csky                                defconfig
arm                      jornada720_defconfig
m68k                          hp300_defconfig
powerpc                     tqm8555_defconfig
xtensa                              defconfig
arm                           sunxi_defconfig
alpha                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
arm                  randconfig-c002-20220211
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220209
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
i386                          randconfig-c001
mips                 randconfig-c004-20220210
riscv                randconfig-c006-20220209
powerpc              randconfig-c003-20220209
mips                 randconfig-c004-20220209
arm                  randconfig-c002-20220209
powerpc                    ge_imp3a_defconfig
arm                        multi_v5_defconfig
powerpc                      ppc44x_defconfig
powerpc                     tqm5200_defconfig
powerpc                       ebony_defconfig
mips                      pic32mzda_defconfig
mips                       rbtx49xx_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220210
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220210
hexagon              randconfig-r041-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
