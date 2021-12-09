Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B406C433EF
	for <ath10k@archiver.kernel.org>; Thu,  9 Dec 2021 20:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BjXkNpeoHrjyBdGNsPxDdKG/zpKiB9CbY77ra76QZ1c=; b=urzobdJCbY0tyb
	hok69e+dtl+0yEHvw/sutwbVZlNmutcW005S/LyltboeugnVM5VoIdOAGiQmeuM69sYdICEoQ1y4n
	NvndeZKBiEQe0n6gav8zceOfxh+JXYB76JZIClxAzKSV9H36JBi2gcx2JxQKTwb97+TeH6SCqDJzH
	jTA7nQ8RQlvf37LWf1ek5ErWfqW2evyHvNQm3yPIKRYZBNPcr5X1iJsCHZeQ3r19YIVbYSJ9fyH5J
	psagKA+KAzu1h0GIrXFuoC1sUUmWBv60pXxpzLTTepYOhhroYpJflqtsFnD/hbHUKXKVMqxhFoWiw
	hzvPgmfaI23UI/akqzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvQBh-00HV9x-Aj; Thu, 09 Dec 2021 20:38:45 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvQBe-00HV9T-RC
 for ath10k@lists.infradead.org; Thu, 09 Dec 2021 20:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639082322; x=1670618322;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=MvY8hPWY1ceKbsDaT1l6bKGIlUR70b33Qd7gGpK1YsM=;
 b=PNxUFxEwI2dJdIqWAgiYRItEEupokAD9f/9827u3d44a27WpAr3M7sf4
 xUih21Q0LgEoI6b+9/aEb8gm3Dtu2KHqA2mJGcccWd09NsgGe1CVmVVDw
 SnUyDqyxUMABxXPCCDJavZGmj8hcfoTMQ9YI5IvmvKf4Cd617cUO8+Wyz
 OfAfS07Sy3XFS70pM5DEnRgA7tLEn5i26iudyYKZcU49A+pp9HbEJP3uk
 pC/czEI3u6MXp8OkWXXoKmIFFi2bC0cK6RlfN/+L0E01Yi7q8SBAPvtSk
 4O2EPh7eamH0lMtQMFJLe5Ti/qr6Ntdta0PLCKRmnqhFEkSEgYiSgHR89 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="298993111"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="298993111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 12:38:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="463396023"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 09 Dec 2021 12:38:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mvQBa-0002MC-3Y; Thu, 09 Dec 2021 20:38:38 +0000
Date: Fri, 10 Dec 2021 04:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 3bf2537ec2e33310b431b53fd84be8833736c256
Message-ID: <61b26922.0PI809b5bzrrLteq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_123842_969853_B106F4B2 
X-CRM114-Status: UNSURE (   4.60  )
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
branch HEAD: 3bf2537ec2e33310b431b53fd84be8833736c256  ath10k: drop beacon and probe response which leak from other channel

elapsed time: 725m

configs tested: 176
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211209
x86_64                           allyesconfig
arc                      axs103_smp_defconfig
powerpc                      mgcoge_defconfig
arm                        mvebu_v7_defconfig
m68k                        stmark2_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                      chrp32_defconfig
arm                         hackkit_defconfig
arm                             mxs_defconfig
powerpc                       holly_defconfig
mips                         mpc30x_defconfig
sh                           se7206_defconfig
mips                           mtx1_defconfig
m68k                       m5249evb_defconfig
arm                           spitz_defconfig
powerpc64                        alldefconfig
powerpc                    sam440ep_defconfig
powerpc                      tqm8xx_defconfig
m68k                        m5307c3_defconfig
sh                        apsh4ad0a_defconfig
alpha                            allyesconfig
arm                            pleb_defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
sh                          lboxre2_defconfig
mips                     loongson2k_defconfig
sh                          kfr2r09_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            dove_defconfig
powerpc                     tqm8548_defconfig
powerpc                       ebony_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc6xx_defconfig
riscv                             allnoconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
mips                  maltasmvp_eva_defconfig
mips                           rs90_defconfig
mips                         tb0287_defconfig
sh                          landisk_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                      pxa255-idp_defconfig
riscv                               defconfig
mips                       lemote2f_defconfig
sh                           se7705_defconfig
sh                          sdk7786_defconfig
arm                           sama7_defconfig
mips                         cobalt_defconfig
sh                          rsk7201_defconfig
arm                             rpc_defconfig
arm                        multi_v5_defconfig
arm                             pxa_defconfig
riscv                    nommu_k210_defconfig
powerpc                   lite5200b_defconfig
riscv                    nommu_virt_defconfig
powerpc                       eiger_defconfig
powerpc                     ppa8548_defconfig
m68k                          hp300_defconfig
arm                       omap2plus_defconfig
ia64                                defconfig
powerpc                     ep8248e_defconfig
arm                             ezx_defconfig
arm                       multi_v4t_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
powerpc               mpc834x_itxgp_defconfig
um                                  defconfig
arc                     nsimosci_hs_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                        mvebu_v5_defconfig
sh                           se7721_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                        spear6xx_defconfig
arc                            hsdk_defconfig
powerpc                 canyonlands_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
sh                           se7712_defconfig
sh                   secureedge5410_defconfig
sparc64                             defconfig
arm                  randconfig-c002-20211209
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
x86_64               randconfig-a006-20211209
x86_64               randconfig-a005-20211209
x86_64               randconfig-a001-20211209
x86_64               randconfig-a002-20211209
x86_64               randconfig-a004-20211209
x86_64               randconfig-a003-20211209
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
riscv                            allyesconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211209
x86_64               randconfig-c007-20211209
riscv                randconfig-c006-20211209
i386                 randconfig-c001-20211209
mips                 randconfig-c004-20211209
powerpc              randconfig-c003-20211209
s390                 randconfig-c005-20211209
x86_64               randconfig-a016-20211209
x86_64               randconfig-a011-20211209
x86_64               randconfig-a013-20211209
x86_64               randconfig-a015-20211209
x86_64               randconfig-a012-20211209
x86_64               randconfig-a014-20211209
i386                 randconfig-a013-20211209
i386                 randconfig-a016-20211209
i386                 randconfig-a011-20211209
i386                 randconfig-a014-20211209
i386                 randconfig-a012-20211209
i386                 randconfig-a015-20211209
hexagon              randconfig-r045-20211209
s390                 randconfig-r044-20211209
hexagon              randconfig-r041-20211209
riscv                randconfig-r042-20211209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
