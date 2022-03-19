Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BF6C433F5
	for <ath10k@archiver.kernel.org>; Sat, 19 Mar 2022 03:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bcH+H5qlO7aNQcltBJY6oFaHep3NCG8B0v4Qx1tnmwM=; b=YBtwo55MFF7+ND
	f5KK9uLJVGJoeySrr9h7hvGHZc6Umr1l5iI5U7y8MnQgPMCaBbXb1c7v2OrbRbeF0fDVMFV6694un
	w+UTN/dugvVbknzX5nMucvnqqR6dAbUkWDyNouAXzez7C1WvpCJMGXbWYCnxZ6eZBtXfSoTX1vEGP
	dY1XjOmpbNne8+oaKJdMoNug813xWdIBzQcL57wKJ8hs+X0InNXNp4KcZqUyQfVDTYH1wLIJGvJn4
	pmADC0TyTe3weFCjFs0vGhRMqwXJPtRnHzbcBtIgB8RxYSAWGUAOz5Z/S/ZJoqfV/05njUlHr5tvI
	rnG2ViuP7zbwNSG2kn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVQ7M-003AsO-Mq; Sat, 19 Mar 2022 03:51:04 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVQ7J-003Arp-Ex
 for ath10k@lists.infradead.org; Sat, 19 Mar 2022 03:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647661861; x=1679197861;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=0FqzCDGW1BGovyH0uvr+FVLwGY3dkoR5TZMcMNEpimk=;
 b=iJ1/StDeQHacYJBn5HBPzTKWa5vnYo5JbvG8UbowR0DCAccmb+LkK9BR
 82AxrY1aLFeMbthgzYnJiQPXp1XWMwoggqfT03YXNXIkGL/YiNUSv1So/
 MS2HKTVtWzKV4dDbqZbkNSViKU1OodwuHiyVqJTvwH3n/T0AWVwUBeena
 oM8N3VHINpoUmgEr6EGi4XPy3P5/ePYLOxI8eEtYmWV/X3hi5oz+TLVud
 gID9Y7Z08DbJ2bX7abNpS4tSgZTaz9R744WrY1sXpiIgyuv5Rw2Lck/Mi
 4x2VIy6GuIBBonOh5iUCEd0d/ls3Pr1phUWU+Ig8B8DEuEpZ6y7bTzy6I g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="317981631"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="317981631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 20:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="635994770"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2022 20:50:59 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nVQ7G-000FWo-MW; Sat, 19 Mar 2022 03:50:58 +0000
Date: Sat, 19 Mar 2022 11:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 3e0f69bea2c2cb7f050b316ccba47cb61ebf240b
Message-ID: <6235531f.kNXtZsLGaKdUINJL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_205101_595803_0FD6D778 
X-CRM114-Status: UNSURE (   5.32  )
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
branch HEAD: 3e0f69bea2c2cb7f050b316ccba47cb61ebf240b  Add localversion-wireless-testing-ath

elapsed time: 720m

configs tested: 134
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
m68k                           sun3_defconfig
m68k                        m5307c3_defconfig
sh                        edosk7705_defconfig
mips                         mpc30x_defconfig
arc                                 defconfig
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
sh                          r7780mp_defconfig
sh                ecovec24-romimage_defconfig
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
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
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
mips                          malta_defconfig
mips                     loongson1c_defconfig
mips                           rs90_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220318
hexagon              randconfig-r041-20220318
riscv                randconfig-r042-20220318
hexagon              randconfig-r041-20220317
s390                 randconfig-r044-20220318
hexagon              randconfig-r045-20220317

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
