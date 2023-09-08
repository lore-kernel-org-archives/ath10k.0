Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55297EC8747
	for <ath10k@archiver.kernel.org>; Fri,  8 Sep 2023 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jibpG9xu63Ye+QdpXyjttvDugtZlNEwtjlxK+BkRhm4=; b=GUHNSWzB5gzVfE
	jbugmt3YzVDG/NNmJCkDmefu26QhtARkzKchaYcpgZe62yvn23oPl7baPlqjx1YJrjXADRxxXD8e7
	Ne4FZx2GImouSNigp56bCMomurX3C8Vl40uXQW8YdZiEIq+YNOeqZbqTe3KsbHNznsW5K1tSSq+9s
	WtHGKN0sAzdFvoziKxKKxXQrXZ2yRMqJJkVwS5eLM2THqgZpptC65z9829U20iFdfOTbbrEyqVFdx
	hsuEwCnrO6uxCRVNYAkcAdHCGNneGpHMzf8U1jP1VmOMJBVBFX3rj8lNRTJpkR46r7G3gvZL4G/Dr
	uKN4MXc/WVc+yMGenqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeQ9m-00Ct23-1x;
	Fri, 08 Sep 2023 01:19:34 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeQ9i-00Ct1j-0c
	for ath10k@lists.infradead.org;
	Fri, 08 Sep 2023 01:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694135969; x=1725671969;
  h=date:from:to:cc:subject:message-id;
  bh=6J78zZ95dWNV8GjlDBTpykKT3vzYLP2I9bzSF7OGQbc=;
  b=Eqrp/5M0SVSpNCJ51NdK/enAGeC4RsWecjy67rOqkGVbB7Am4xs2pZPM
   UZGPWXSLqMrSZfdvsTsX7MPaAiU+1AgPSYRgESZtiog5PXIONXG0f6oJq
   zy5ThkCmjd/yuhnldouKd7F8IXZ4fJ069XNzYwfGSMk7y/18WTtIR/DYR
   YXlr7YnIiKMFPcMVVV4IpPUXKDg0F7uYr8g4G/pnUyRGADY5TWM0onuIu
   9xB3+ihWGpwvJh7i83yQZguWAdH3fpEL7GqapwKTiNZg0flLt7M30pRXd
   agIE4v9/6V7siOhr0X9u6aylL2h+MKagQ6xR/mZsBfPJGA78fcJl3UpVM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381332604"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="381332604"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885421950"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="885421950"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2023 18:18:27 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeQ8u-0001mL-0e;
	Fri, 08 Sep 2023 01:18:40 +0000
Date: Fri, 08 Sep 2023 09:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath11k-hibernation-support] BUILD SUCCESS
 4b6266a3bc8cbda7f08188a5d6200a2b2d78ea42
Message-ID: <202309080925.W9ciHoJW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_181930_346109_29E4A944 
X-CRM114-Status: UNSURE (   5.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-hibernation-support
branch HEAD: 4b6266a3bc8cbda7f08188a5d6200a2b2d78ea42  wifi: ath11k: remove MHI LOOPBACK channels

elapsed time: 728m

configs tested: 288
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r033-20230907   gcc  
alpha                randconfig-r033-20230908   gcc  
alpha                randconfig-r034-20230908   gcc  
alpha                randconfig-r035-20230907   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230908   gcc  
arc                  randconfig-r001-20230908   gcc  
arc                  randconfig-r005-20230907   gcc  
arc                  randconfig-r012-20230908   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                         at91_dt_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                            hisi_defconfig   gcc  
arm                        neponset_defconfig   clang
arm                   randconfig-001-20230907   clang
arm                   randconfig-001-20230908   gcc  
arm                  randconfig-r004-20230907   gcc  
arm                  randconfig-r013-20230907   clang
arm                  randconfig-r021-20230907   clang
arm                  randconfig-r022-20230907   clang
arm                  randconfig-r035-20230907   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230908   gcc  
arm64                randconfig-r003-20230908   gcc  
arm64                randconfig-r023-20230907   gcc  
arm64                randconfig-r026-20230908   clang
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r015-20230907   gcc  
csky                 randconfig-r036-20230908   gcc  
hexagon               randconfig-001-20230907   clang
hexagon               randconfig-001-20230908   clang
hexagon               randconfig-002-20230907   clang
hexagon               randconfig-002-20230908   clang
hexagon              randconfig-r015-20230908   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230907   clang
i386         buildonly-randconfig-001-20230908   gcc  
i386         buildonly-randconfig-002-20230907   clang
i386         buildonly-randconfig-002-20230908   gcc  
i386         buildonly-randconfig-003-20230907   clang
i386         buildonly-randconfig-003-20230908   gcc  
i386         buildonly-randconfig-004-20230907   clang
i386         buildonly-randconfig-004-20230908   gcc  
i386         buildonly-randconfig-005-20230907   clang
i386         buildonly-randconfig-005-20230908   gcc  
i386         buildonly-randconfig-006-20230907   clang
i386         buildonly-randconfig-006-20230908   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230907   clang
i386                  randconfig-001-20230908   gcc  
i386                  randconfig-002-20230907   clang
i386                  randconfig-002-20230908   gcc  
i386                  randconfig-003-20230907   clang
i386                  randconfig-003-20230908   gcc  
i386                  randconfig-004-20230907   clang
i386                  randconfig-004-20230908   gcc  
i386                  randconfig-005-20230907   clang
i386                  randconfig-005-20230908   gcc  
i386                  randconfig-006-20230907   clang
i386                  randconfig-006-20230908   gcc  
i386                  randconfig-011-20230907   gcc  
i386                  randconfig-011-20230908   clang
i386                  randconfig-012-20230907   gcc  
i386                  randconfig-012-20230908   clang
i386                  randconfig-013-20230907   gcc  
i386                  randconfig-013-20230908   clang
i386                  randconfig-014-20230907   gcc  
i386                  randconfig-014-20230908   clang
i386                  randconfig-015-20230907   gcc  
i386                  randconfig-015-20230908   clang
i386                  randconfig-016-20230907   gcc  
i386                  randconfig-016-20230908   clang
i386                 randconfig-r001-20230907   clang
i386                 randconfig-r003-20230907   clang
i386                 randconfig-r005-20230908   gcc  
i386                 randconfig-r011-20230908   clang
i386                 randconfig-r023-20230908   clang
i386                 randconfig-r024-20230908   clang
i386                 randconfig-r025-20230908   clang
i386                 randconfig-r026-20230907   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230907   gcc  
loongarch             randconfig-001-20230908   gcc  
loongarch            randconfig-r004-20230908   gcc  
loongarch            randconfig-r016-20230907   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r006-20230907   gcc  
m68k                 randconfig-r013-20230908   gcc  
m68k                 randconfig-r025-20230907   gcc  
m68k                 randconfig-r033-20230908   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r031-20230907   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                     loongson1c_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                 randconfig-r012-20230907   clang
mips                 randconfig-r032-20230907   gcc  
mips                           rs90_defconfig   clang
mips                           xway_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230908   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r036-20230907   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230908   gcc  
parisc               randconfig-r035-20230908   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r006-20230908   gcc  
powerpc              randconfig-r021-20230908   clang
powerpc              randconfig-r024-20230907   gcc  
powerpc              randconfig-r034-20230907   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64            randconfig-r012-20230908   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230907   clang
riscv                 randconfig-001-20230908   gcc  
riscv                randconfig-r002-20230907   clang
riscv                randconfig-r021-20230908   clang
riscv                randconfig-r032-20230908   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230908   clang
s390                 randconfig-r003-20230908   gcc  
s390                 randconfig-r016-20230908   clang
s390                 randconfig-r024-20230908   clang
s390                 randconfig-r034-20230908   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r005-20230908   gcc  
sh                   randconfig-r036-20230908   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230908   gcc  
sparc                randconfig-r004-20230908   gcc  
sparc                randconfig-r032-20230908   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230908   gcc  
sparc64              randconfig-r011-20230907   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230907   clang
x86_64       buildonly-randconfig-001-20230908   gcc  
x86_64       buildonly-randconfig-002-20230907   clang
x86_64       buildonly-randconfig-002-20230908   gcc  
x86_64       buildonly-randconfig-003-20230907   clang
x86_64       buildonly-randconfig-003-20230908   gcc  
x86_64       buildonly-randconfig-004-20230907   clang
x86_64       buildonly-randconfig-004-20230908   gcc  
x86_64       buildonly-randconfig-005-20230907   clang
x86_64       buildonly-randconfig-005-20230908   gcc  
x86_64       buildonly-randconfig-006-20230907   clang
x86_64       buildonly-randconfig-006-20230908   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230907   gcc  
x86_64                randconfig-001-20230908   clang
x86_64                randconfig-002-20230907   gcc  
x86_64                randconfig-002-20230908   clang
x86_64                randconfig-003-20230907   gcc  
x86_64                randconfig-003-20230908   clang
x86_64                randconfig-004-20230907   gcc  
x86_64                randconfig-004-20230908   clang
x86_64                randconfig-005-20230907   gcc  
x86_64                randconfig-005-20230908   clang
x86_64                randconfig-006-20230907   gcc  
x86_64                randconfig-006-20230908   clang
x86_64                randconfig-011-20230907   clang
x86_64                randconfig-011-20230908   gcc  
x86_64                randconfig-012-20230907   clang
x86_64                randconfig-012-20230908   gcc  
x86_64                randconfig-013-20230907   clang
x86_64                randconfig-013-20230908   gcc  
x86_64                randconfig-014-20230907   clang
x86_64                randconfig-014-20230908   gcc  
x86_64                randconfig-015-20230907   clang
x86_64                randconfig-015-20230908   gcc  
x86_64                randconfig-016-20230907   clang
x86_64                randconfig-016-20230908   gcc  
x86_64                randconfig-071-20230907   clang
x86_64                randconfig-071-20230908   gcc  
x86_64                randconfig-072-20230907   clang
x86_64                randconfig-072-20230908   gcc  
x86_64                randconfig-073-20230907   clang
x86_64                randconfig-073-20230908   gcc  
x86_64                randconfig-074-20230907   clang
x86_64                randconfig-074-20230908   gcc  
x86_64                randconfig-075-20230907   clang
x86_64                randconfig-075-20230908   gcc  
x86_64                randconfig-076-20230907   clang
x86_64                randconfig-076-20230908   gcc  
x86_64               randconfig-r026-20230908   clang
x86_64               randconfig-r031-20230908   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r014-20230907   gcc  
xtensa               randconfig-r033-20230907   gcc  
xtensa               randconfig-r034-20230907   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
