Return-Path: <SRS0=fHIY=O6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B45C433FE
	for <ath10k@archiver.kernel.org>; Sun, 10 Oct 2021 20:20:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0121D60EB4
	for <ath10k@archiver.kernel.org>; Sun, 10 Oct 2021 20:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0121D60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nbZ2ZzVciWCc2GH+ybkM5kNRsa7uhKJxXmpBjH7b7cc=; b=WqRepTlMcRrwSi
	bLfBhTBbyh+WUCGxnskL1gJFjk6FijVl3+oC81U60VCiCW2CMCjTEENb2m+gnWZvbunMqD3KcBdxn
	dm77cyxg1lVNtyDMTzvMesp/wZABL05NtRaEq6P4cIt9lUvKJ1PoVtARmDYeluKA06t82qgNhL392
	1ymmfRvoenTPS/SfTW0Fki3ORPy9dJpTysWzCmjmqmKp/sZE8sdDXGO1dfVEEOSbtBJESkho5AkQi
	5oUqB0/YRevD/0US7laXdwWngEIjHphkN31jzAdreX7UwpOCVN2A+FJI4I0wEvokWmyNQ/6pq/3qv
	LeCQQNwcEZwQZBWoSE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZfIT-007LDZ-84; Sun, 10 Oct 2021 20:19:49 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZfIP-007LCz-UA
 for ath10k@lists.infradead.org; Sun, 10 Oct 2021 20:19:47 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="206879921"
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; d="scan'208";a="206879921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 13:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; d="scan'208";a="440527667"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 10 Oct 2021 13:19:42 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mZfIL-0001V7-L3; Sun, 10 Oct 2021 20:19:41 +0000
Date: Mon, 11 Oct 2021 04:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 122b99170e38ea045c64ef2a2b8d2e68ac0042be
Message-ID: <61634ac4.YQciAGS9oxUft08R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_131946_077133_90E43B42 
X-CRM114-Status: UNSURE (   4.04  )
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
branch HEAD: 122b99170e38ea045c64ef2a2b8d2e68ac0042be  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 170
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211010
mips                        workpad_defconfig
openrisc                         alldefconfig
mips                     decstation_defconfig
m68k                          amiga_defconfig
xtensa                    smp_lx200_defconfig
ia64                            zx1_defconfig
parisc                           alldefconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            qcom_defconfig
powerpc                       ebony_defconfig
arm                        cerfcube_defconfig
m68k                        mvme147_defconfig
powerpc                      chrp32_defconfig
powerpc                    adder875_defconfig
arm                        realview_defconfig
arm                        trizeps4_defconfig
mips                           ip28_defconfig
sh                          polaris_defconfig
mips                            gpr_defconfig
powerpc                     tqm8560_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                           stm32_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         lpc18xx_defconfig
mips                         tb0219_defconfig
mips                      fuloong2e_defconfig
arm                          iop32x_defconfig
powerpc                    gamecube_defconfig
mips                        vocore2_defconfig
m68k                       m5249evb_defconfig
powerpc                     rainier_defconfig
x86_64                              defconfig
microblaze                          defconfig
sh                        edosk7705_defconfig
m68k                         amcore_defconfig
arc                              alldefconfig
arm                          badge4_defconfig
arc                    vdk_hs38_smp_defconfig
parisc                generic-32bit_defconfig
mips                         mpc30x_defconfig
arm                           viper_defconfig
mips                        nlm_xlp_defconfig
mips                     cu1830-neo_defconfig
arc                        nsim_700_defconfig
i386                                defconfig
alpha                               defconfig
mips                   sb1250_swarm_defconfig
powerpc                     akebono_defconfig
sh                        sh7763rdp_defconfig
arm                      pxa255-idp_defconfig
mips                      maltaaprp_defconfig
mips                         bigsur_defconfig
mips                     cu1000-neo_defconfig
mips                            e55_defconfig
arc                          axs103_defconfig
powerpc                    sam440ep_defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
powerpc                      mgcoge_defconfig
powerpc                       holly_defconfig
arm                       aspeed_g4_defconfig
arc                            hsdk_defconfig
csky                                defconfig
openrisc                    or1ksim_defconfig
mips                           ip27_defconfig
x86_64                           allyesconfig
sh                           se7724_defconfig
arm                            mmp2_defconfig
arm                       spear13xx_defconfig
sh                      rts7751r2d1_defconfig
powerpc                        fsp2_defconfig
arm                          ep93xx_defconfig
powerpc                       eiger_defconfig
h8300                    h8300h-sim_defconfig
sh                             sh03_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     mpc512x_defconfig
powerpc                      makalu_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                       ppc64_defconfig
h8300                            alldefconfig
openrisc                            defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
arm                  randconfig-c002-20211010
x86_64               randconfig-c001-20211010
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20211010
x86_64               randconfig-a006-20211010
x86_64               randconfig-a001-20211010
x86_64               randconfig-a005-20211010
x86_64               randconfig-a002-20211010
x86_64               randconfig-a003-20211010
i386                 randconfig-a001-20211010
i386                 randconfig-a003-20211010
i386                 randconfig-a004-20211010
i386                 randconfig-a005-20211010
i386                 randconfig-a002-20211010
i386                 randconfig-a006-20211010
arc                  randconfig-r043-20211010
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211010
mips                 randconfig-c004-20211010
i386                 randconfig-c001-20211010
s390                 randconfig-c005-20211010
x86_64               randconfig-c007-20211010
powerpc              randconfig-c003-20211010
riscv                randconfig-c006-20211010
x86_64               randconfig-a015-20211010
x86_64               randconfig-a012-20211010
x86_64               randconfig-a016-20211010
x86_64               randconfig-a014-20211010
x86_64               randconfig-a013-20211010
x86_64               randconfig-a011-20211010
i386                 randconfig-a016-20211010
i386                 randconfig-a014-20211010
i386                 randconfig-a011-20211010
i386                 randconfig-a015-20211010
i386                 randconfig-a012-20211010
i386                 randconfig-a013-20211010
hexagon              randconfig-r041-20211010
s390                 randconfig-r044-20211010
riscv                randconfig-r042-20211010
hexagon              randconfig-r045-20211010

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
