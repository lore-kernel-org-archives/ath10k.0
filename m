Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85931C76196
	for <ath10k@archiver.kernel.org>; Sat, 25 Mar 2023 03:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aVp7COFL2MWfvZkTyd3XGJCHy4RWMSS3YDba/YM7e5Q=; b=PpPi++4Nu0zgP8
	RX0Zt6Og4V1WaQL744LIWYv05emA+Egr5mhFs9TIwqB0J3c34hjXA9/tmcmQLLvMuDaSAgOzd/NlA
	IOcdEyafIjlpKOLoWdmssJM3TvJpiWikP+rCimllO/aHnTCJUl4ZYqVqqA+wqPb54ePoAHGLqK6Au
	EsPzb2B7NnxRe3bku/Q57IOUCnF/br36EMlzhY5J2RS2QRkPkcrd4eHtV9/0mF4PwPP39GNlnNHbY
	8vd4NK/BwFHlMzqmUIWg1WmMEQimZaItWm4dGKkW5eLcIUQU21tVV/MFkeOybir2VP30sxU0Q+st9
	A6huXOqiu6UeRgq98nqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfuj6-00631a-1R;
	Sat, 25 Mar 2023 03:37:56 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfuj0-00630v-2P
	for ath10k@lists.infradead.org;
	Sat, 25 Mar 2023 03:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679715470; x=1711251470;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f2Q104z/jWsiONFzRzbXtceJBGKCQVuqJmctdVkO5xM=;
  b=COgW9Wr8RLxrLXhqAWWLJAh6Ur2RMGinspyHxOtP7adxdAorB4o1YNXH
   TRoHRHlXauBTUd61TKCaMCR0zXERvCsphdcjgi0P9yUfXS38LL653iWaN
   6LEfmuf7tY5g00bfL2JVl0CyzwwuVNcjXfLbt3wbOvureZYQbOx9WfZzF
   S37NzT0cMtEFKhfIIwVwtGf0HUc0j5TY/1ESygQ9YVH2Zt3DCYz9eTP9+
   iKyoF2RTgaaifl/eVFKIfLaf7/HiXI20k099ZcAzfWsEePP1cZXTCrsKw
   uWPX1+x9Y9Mi9n/0YPhRJ2HrKyYovn3hHsVUfHSNYKb+TnnRIsdWimQUM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341501119"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="341501119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 20:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="685408354"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="685408354"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Mar 2023 20:37:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfuiu-000Fub-2R;
	Sat, 25 Mar 2023 03:37:44 +0000
Date: Sat, 25 Mar 2023 11:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d90137a547f80c39d755e9b88e049cc4b17a388f
Message-ID: <641e6c65.WHna5kELihe9nYYE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_203750_844701_D8DDCA08 
X-CRM114-Status: UNSURE (   5.23  )
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
branch HEAD: d90137a547f80c39d755e9b88e049cc4b17a388f  wifi: ath10k: Serialize wake_tx_queue ops

Unverified Warning (likely false positive, please contact us if interested):

drivers/net/wireless/legacy/ray_cs.c:2084:13-14: WARNING opportunity for min()
drivers/net/wireless/legacy/ray_cs.c:2115:2-4: WARNING: possible condition with no effect (if == else)

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- xtensa-randconfig-c033-20230322
    |-- drivers-net-wireless-legacy-ray_cs.c:WARNING-opportunity-for-min()
    `-- drivers-net-wireless-legacy-ray_cs.c:WARNING:possible-condition-with-no-effect-(if-else)

elapsed time: 725m

configs tested: 128
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230322   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230322   gcc  
alpha                randconfig-r021-20230322   gcc  
alpha                randconfig-r035-20230322   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230322   gcc  
arc          buildonly-randconfig-r004-20230323   gcc  
arc          buildonly-randconfig-r006-20230323   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r024-20230322   gcc  
arc                  randconfig-r033-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r001-20230322   gcc  
csky         buildonly-randconfig-r006-20230322   gcc  
csky                                defconfig   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r013-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230322   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r034-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                        omega2p_defconfig   clang
nios2        buildonly-randconfig-r005-20230322   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r012-20230322   gcc  
openrisc             randconfig-r016-20230322   gcc  
openrisc             randconfig-r022-20230322   gcc  
parisc       buildonly-randconfig-r003-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230322   gcc  
parisc               randconfig-r031-20230322   gcc  
parisc               randconfig-r034-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230323   clang
powerpc      buildonly-randconfig-r002-20230323   clang
powerpc                        fsp2_defconfig   clang
powerpc              randconfig-r001-20230322   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230323   clang
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230322   clang
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230322   clang
s390                 randconfig-r011-20230322   gcc  
s390                 randconfig-r035-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230322   gcc  
sh           buildonly-randconfig-r002-20230322   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r014-20230322   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc        buildonly-randconfig-r005-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230322   gcc  
sparc64              randconfig-r002-20230322   gcc  
sparc64              randconfig-r026-20230322   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r033-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
