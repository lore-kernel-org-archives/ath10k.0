Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596B2C47258
	for <ath10k@archiver.kernel.org>; Sun, 21 Jan 2024 02:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=trZbUd3IYc3gtAkFRtBk94UIZoELF6PqMc8yc9hok9s=; b=jel1fhFCsIZhiNpHvaMv8DKLmF
	Klj6VENEztZvhvaCz+qLOb2L2KZuQuC2OEoZyk2V3ey5r28QMRX7DzoUyBdhIWuN/dUiaAXwwVq1+
	P6y8P8Dif90JNo9Wq1m00gnhn/wdKJ73KrRZVMPKJJPKKfhHMjsC8VPeKF7ISVgxUcOmnA+f6a947
	2a8BJKl+ikOAesuMqQvIT+uQLqblPtYxC+iBRjxley1YkgqXVjCdap4MWjcqyjmLMRSHzAbk4sJFR
	lrb78xeQiNj4KESXE+E/ImAEfrYmXdFl8mnFIFZzpRSY5G6WQlCaQSSU+iaEnOuXyJsn/F9+3IyT9
	gtIizpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRNIh-008mlg-0F;
	Sun, 21 Jan 2024 02:11:07 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRNIb-008ml0-1N
	for ath10k@lists.infradead.org;
	Sun, 21 Jan 2024 02:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705803061; x=1737339061;
  h=date:from:to:cc:subject:message-id;
  bh=yp3Azv3xNhzJihJbhPsPF5ObCe1az1aXulXw2glJBwk=;
  b=iqstPcMtIg8PcX5wVo68FYN0egUsO1AI6nSbzet6N4TFJhVa42A7FaSC
   bytsQe+L9SxRLA7QB3KirnZzv8At/XRFnuN0ol56lJ/D1eOtBrpx28E0c
   HA1PfEvycDUSG0sfVvGP97W8zj5AsMLzIcrz2Sh8Bc1oCUKtSgSrqH42A
   5IQj9qqt1JZSEe7F7k8dNWIKkS91HFn7s8TNHSQU53vB1vCm4ouhuW/TT
   4kfvczTVFnB4EqULzavVZKXcKBYqCy65Vc3uiadizruk7p1c7WhwGuO6Z
   YBvk2GQ3Iol8e5l6sez9gFlobSK1+UzU9SOjTW8X32324t0Qypcs22CMX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="14504886"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="14504886"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 18:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="788665555"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="788665555"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2024 18:10:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRNIW-0005bO-2E;
	Sun, 21 Jan 2024 02:10:56 +0000
Date: Sun, 21 Jan 2024 10:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 32546abffb9410c71b8038a65ec28d2aab79f8c8
Message-ID: <202401211050.5CymcjMD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_181101_502006_8243DB87 
X-CRM114-Status: UNSURE (   4.28  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 32546abffb9410c71b8038a65ec28d2aab79f8c8  wifi: ath12k: Fix issues in channel list update

elapsed time: 1934m

configs tested: 115
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240121   gcc  
arc                   randconfig-002-20240121   gcc  
arm                               allnoconfig   gcc  
arm                            mmp2_defconfig   clang
arm                   randconfig-001-20240121   gcc  
arm                   randconfig-002-20240121   gcc  
arm                   randconfig-003-20240121   gcc  
arm                   randconfig-004-20240121   gcc  
arm                        realview_defconfig   gcc  
arm                         s5pv210_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                 randconfig-001-20240121   gcc  
arm64                 randconfig-002-20240121   gcc  
arm64                 randconfig-003-20240121   gcc  
arm64                 randconfig-004-20240121   gcc  
csky                              allnoconfig   gcc  
csky                  randconfig-001-20240121   gcc  
csky                  randconfig-002-20240121   gcc  
hexagon               randconfig-001-20240121   clang
hexagon               randconfig-002-20240121   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240120   clang
i386         buildonly-randconfig-002-20240120   clang
i386         buildonly-randconfig-003-20240120   clang
i386         buildonly-randconfig-004-20240120   clang
i386         buildonly-randconfig-005-20240120   clang
i386         buildonly-randconfig-006-20240120   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240120   clang
i386                  randconfig-002-20240120   clang
i386                  randconfig-003-20240120   clang
i386                  randconfig-004-20240120   clang
i386                  randconfig-005-20240120   clang
i386                  randconfig-006-20240120   clang
i386                  randconfig-011-20240120   gcc  
i386                  randconfig-012-20240120   gcc  
i386                  randconfig-013-20240120   gcc  
i386                  randconfig-014-20240120   gcc  
i386                  randconfig-015-20240120   gcc  
i386                  randconfig-016-20240120   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240121   gcc  
loongarch             randconfig-002-20240121   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip22_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240121   gcc  
nios2                 randconfig-002-20240121   gcc  
parisc                randconfig-001-20240121   gcc  
parisc                randconfig-002-20240121   gcc  
powerpc               randconfig-001-20240121   gcc  
powerpc               randconfig-002-20240121   gcc  
powerpc               randconfig-003-20240121   gcc  
powerpc64             randconfig-001-20240121   gcc  
powerpc64             randconfig-002-20240121   gcc  
powerpc64             randconfig-003-20240121   gcc  
riscv                 randconfig-001-20240121   gcc  
riscv                 randconfig-002-20240121   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240121   clang
s390                  randconfig-002-20240121   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240121   gcc  
sh                    randconfig-002-20240121   gcc  
sparc                            allmodconfig   gcc  
sparc64               randconfig-001-20240121   gcc  
sparc64               randconfig-002-20240121   gcc  
um                    randconfig-001-20240121   gcc  
um                    randconfig-002-20240121   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240121   gcc  
x86_64       buildonly-randconfig-002-20240121   gcc  
x86_64       buildonly-randconfig-003-20240121   gcc  
x86_64       buildonly-randconfig-004-20240121   gcc  
x86_64       buildonly-randconfig-005-20240121   gcc  
x86_64       buildonly-randconfig-006-20240121   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240121   clang
x86_64                randconfig-002-20240121   clang
x86_64                randconfig-003-20240121   clang
x86_64                randconfig-004-20240121   clang
x86_64                randconfig-005-20240121   clang
x86_64                randconfig-006-20240121   clang
x86_64                randconfig-011-20240121   gcc  
x86_64                randconfig-012-20240121   gcc  
x86_64                randconfig-013-20240121   gcc  
x86_64                randconfig-014-20240121   gcc  
x86_64                randconfig-015-20240121   gcc  
x86_64                randconfig-016-20240121   gcc  
x86_64                randconfig-071-20240121   gcc  
x86_64                randconfig-072-20240121   gcc  
x86_64                randconfig-073-20240121   gcc  
x86_64                randconfig-074-20240121   gcc  
x86_64                randconfig-075-20240121   gcc  
x86_64                randconfig-076-20240121   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240121   gcc  
xtensa                randconfig-002-20240121   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

