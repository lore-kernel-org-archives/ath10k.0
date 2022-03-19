Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB22C433F5
	for <ath10k@archiver.kernel.org>; Sat, 19 Mar 2022 03:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YjmD77H7yBnHwV6hsa1qHXcQE3pyJWHrnL2Sih8WzKY=; b=ztChWdo4QmxIAw
	45g3YcQAIepQcuWw6vmFocSxKir7sLhDj2YPKL1J64Eja0RasLuOO00NTSJ6WR2FfE52lKm0iAWzC
	QmFjF1PJVuhSgK2EXBxhgE+QxUElbTwwhwpKVmIHJOrzGokNNhg/PM9JCekkY6Xk1QP0eYYBoWf31
	eOd+73Mdl7lW+Jon0AucX9RrNIYG8TA3hM/sraqmrffCa/N77gwAKkVptnckGAQlB5MrXSZKXKFIg
	C8qIzK4K33OmXq2gkWPyGTWpJ5IXvfE9P8R9y0sVtIrvqxxFI2uCqFxBcwOXMPCMlXjI4p01wxKUy
	eIAU0NLhqXYTqk3570hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVQ7O-003Asg-Hh; Sat, 19 Mar 2022 03:51:06 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVQ7J-003Aro-EG
 for ath10k@lists.infradead.org; Sat, 19 Mar 2022 03:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647661861; x=1679197861;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=6RUy3DliRmQIcZ1AxzKjvYs/WKnjTyHFc8g+DC/6L0c=;
 b=ElGrZnFHF8oln8MZdQ6HTd7pnZOG+fAJov+4jTT55D/0uqSqqNuQ9emL
 G0PHn/AIrtOhdcF4IrbSqGIMn73WRXZKhN7q8HPqk4CpqhhZGBU29jptE
 hFGCyqwB1ZRYq3AM9Xe7/AtGG4bEpFh5Iyho14y2wCl7X52WMwUq6KE0E
 XEhLjJtLqOR5ixY5zgwCoGCbvMAUw83dDIzDUJiCABdKwyRV/6fYv2ICH
 53f512mPvvMmWkHIHvZwbrgcuNwRGClGjx+JFdCZGDCbHIBnkBx4TMQcB
 QjN6vNy4TPnwoPIGAuo0jtF8xP6a8tJ5Mg4cKXBNMYE/2t7Y7vKnV+MtF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="320478155"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="320478155"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 20:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="582055351"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 18 Mar 2022 20:50:59 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nVQ7G-000FWi-LU; Sat, 19 Mar 2022 03:50:58 +0000
Date: Sat, 19 Mar 2022 11:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 b7d174479c8ac365828d474b385da2da858f2089
Message-ID: <6235531a.+5uMn5ZR0dzzh7Mw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_205101_595935_D3F1BAC5 
X-CRM114-Status: UNSURE (   5.88  )
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
branch HEAD: b7d174479c8ac365828d474b385da2da858f2089  ath6kl: fix typos in comments

elapsed time: 723m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arm64                            alldefconfig
arm                            xcep_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                         rt305x_defconfig
ia64                        generic_defconfig
arm                        keystone_defconfig
xtensa                           alldefconfig
arm                          lpd270_defconfig
parisc                           allyesconfig
mips                     decstation_defconfig
arm                      footbridge_defconfig
sh                              ul2_defconfig
arc                                 defconfig
m68k                        m5307c3_defconfig
mips                         mpc30x_defconfig
m68k                           sun3_defconfig
sh                        edosk7705_defconfig
powerpc                   motionpro_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           sh2007_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
arm                           corgi_defconfig
ia64                          tiger_defconfig
powerpc                  storcenter_defconfig
alpha                            alldefconfig
arm                             rpc_defconfig
mips                       capcella_defconfig
sh                             espt_defconfig
sh                           se7619_defconfig
arm                        trizeps4_defconfig
powerpc                       maple_defconfig
alpha                               defconfig
mips                      maltasmvp_defconfig
sh                           se7705_defconfig
openrisc                         alldefconfig
sh                          sdk7780_defconfig
powerpc                      bamboo_defconfig
arm                         lubbock_defconfig
arm                  randconfig-c002-20220318
arm                  randconfig-c002-20220317
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
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
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
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220317
arc                  randconfig-r043-20220318
riscv                randconfig-r042-20220317
arc                  randconfig-r043-20220317
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
powerpc                     tqm5200_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
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
hexagon              randconfig-r045-20220318
hexagon              randconfig-r045-20220317
hexagon              randconfig-r041-20220318
riscv                randconfig-r042-20220318
hexagon              randconfig-r041-20220317
s390                 randconfig-r044-20220318

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
