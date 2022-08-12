Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364EAC25B06
	for <ath10k@archiver.kernel.org>; Fri, 12 Aug 2022 02:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ytCuYpCRko5bIzNqINLKvNJ/qUIdI157Ab9eazdX+yo=; b=wt2MzEuzsGHGzR
	Z4SlbzJDbTGB6Mu3/bMsBqgQ4JqWiqaQ9u2mG6GM2UjGAL3R7CRrUm0vd8PI/k4WAADcq8c1TaESx
	7SEqfgeCvITucYqjvv6DmEddDvlV700BXBawa9n/Alk4Z6Qw/t5wKuC58so5oYVfL5O4uURo+negh
	lT5vnIvmwby7KlEzEDdjITd/Q9uGuxndYKqti2NeIXJk09zoGGnqaUpZfEfLOiPbvH99RKY7M8/Lf
	8ACD6jxqjllphmO7VndOVVnlkQ+hM3GnCaFSizghQkzONe3fA5JXV4sCnfKDgI96PiBRNR0Z0TMC9
	4fCZxrgYLl9J2DqNQgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMKHj-008MuB-Ui; Fri, 12 Aug 2022 02:20:27 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMKHh-008MqG-9V
	for ath10k@lists.infradead.org; Fri, 12 Aug 2022 02:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660270825; x=1691806825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c0vMo07aSlR5xoDpnEclZrIWcB6UDhU9ht8zL7h3qIs=;
  b=i3rwr82b1JnBGPsSya6MYObhAooLxpcWz1oBp+nbsmguTGtnNjIGwuOE
   l30HmH8MAJivmu/lGbEvNiQgRdKM1qUQ+r7l6zOuQRWLVJEO4A2LzEArZ
   1BCmgyjEne0soWd7UuA+58nDqY4TAOh2Z4uOdIWo7Mx1F4rg34sY+XONK
   8UlgdKEd4pwuKIZi9qEAj0bwJ3W7sbHlvxFLdaG39bJ4RQngKlGUCibew
   03m1L/wwmEnqcIVqcgbUB9TNkDJcTow6fbczHMCmr7aD8wyFBXfw84dl3
   S0afJc5zDngs/YN6lDNnERfyu3nluNwjrysA0xWmqtaK05Q2apcXq/mO2
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="271278897"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="271278897"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 19:20:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="673928289"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2022 19:20:20 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMKHb-0000yR-2m;
	Fri, 12 Aug 2022 02:20:19 +0000
Date: Fri, 12 Aug 2022 10:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 e82bf2417c8e49527db04491a988832e0ec9d5a1
Message-ID: <62f5b8bf.m9Fv4RC287uNBRMz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_192025_415255_DE2E0236 
X-CRM114-Status: UNSURE (   5.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: e82bf2417c8e49527db04491a988832e0ec9d5a1  wifi: ath12k: remove extra line from hw.c

elapsed time: 717m

configs tested: 76
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64                           allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a002
arc                  randconfig-r043-20220811
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
ia64                             allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a001
arm64                            allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
xtensa                  cadence_csp_defconfig
arm64                            alldefconfig
ia64                            zx1_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
sh                   secureedge5410_defconfig
sh                          rsk7264_defconfig
m68k                       m5475evb_defconfig
sh                        sh7757lcr_defconfig
arc                           tb10x_defconfig
sh                            titan_defconfig
arm                           tegra_defconfig
m68k                        mvme147_defconfig
csky                             alldefconfig
mips                            gpr_defconfig
i386                          randconfig-c001

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r045-20220811
x86_64                        randconfig-a014
x86_64                        randconfig-a005
riscv                randconfig-r042-20220811
x86_64                        randconfig-a001
i386                          randconfig-a015
hexagon              randconfig-r041-20220811
x86_64                        randconfig-a016
x86_64                        randconfig-a012
s390                 randconfig-r044-20220811
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001
mips                        omega2p_defconfig
mips                  cavium_octeon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
