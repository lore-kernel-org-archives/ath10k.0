Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6584C433F5
	for <ath10k@archiver.kernel.org>; Fri, 18 Feb 2022 02:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SEhcBTnBvE7vcDG2PkKuvW6LOMrAh8jwfEOukZN4fwY=; b=VdztrjbNjbAN3H
	I2j65YCgyiAoWzDJG1QRiFYdn/upto43CdfV0THt8T3oZ3YXKVzpuTYSpOIXtlRauBKl9vCSvnAoK
	1v3tdXSeVO+JDWF2A9Tf2rmsMWGLJsyXyF/PJB5yJ6hn71oQqT2ks6I2d8ImGj90k0iJbxLWhrO1n
	4hPSVtlDu84RUxfmZtEYLu8TB+Gn64xeipJEmXVCOrrmXkdbLNS/6RuZHlYYrul0YwnzSR37OxxsZ
	C0eVIEhK2TiggvdF5Iq2KYYjyNuo/JH2zuKVvZHGQ+T8giw5Ped0q6tkOdXgNTM1d/dM4ADh11/oW
	YQuQrLOOorNjBHrjos/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKtOV-00CkF0-L6; Fri, 18 Feb 2022 02:53:15 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKtOT-00CkER-8A
 for ath10k@lists.infradead.org; Fri, 18 Feb 2022 02:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645152793; x=1676688793;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Q6JyXVfLEa434HpYYAkf1DXprecvXdsBVMXuQZLmpEc=;
 b=bD0VLhB4/J4HDwKJsMOs48h1ssEtCFWNc5/GxfN7fp7a+Rl7P+VMSUnK
 nL7W2wgWCPlvEmqf+wrIBuH6IJyDkWVG05PBFpoKDVVFvjIYFvAgollVQ
 pQao1yEIkiIgnViL98hps18DeUlFlQy+VIqTFCfVQaDFvxH5aKcbiNvbg
 As9QKgTNF28dBp3v/AdsggR12PdGulsf6XtYOVifGoYMTp7/zd7z9VMZy
 0VJcydUAIp9ER3X9PUeweHko0ueq/vcLhqy3OVEv0q1xlHDNl9pzbEmPk
 qS9v6bnrgScqtVJfjTyfAK0tw96kFVjDfBuuV/EP3DV0VGyyVoEzz5uFt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251235859"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="251235859"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 18:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="635422091"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2022 18:53:10 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKtOP-0000rm-Oe; Fri, 18 Feb 2022 02:53:09 +0000
Date: Fri, 18 Feb 2022 10:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 313214c242c283062c5a2c4d9c9373a59dc513f4
Message-ID: <620f0a07.UC7coqRAtKW8zQyy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_185313_380579_D94518E6 
X-CRM114-Status: UNSURE (   6.02  )
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
branch HEAD: 313214c242c283062c5a2c4d9c9373a59dc513f4  ath11k: Fix frames flush failure caused by deadlock

elapsed time: 721m

configs tested: 119
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
powerpc                       maple_defconfig
arc                                 defconfig
sh                         microdev_defconfig
mips                  decstation_64_defconfig
parisc                generic-32bit_defconfig
m68k                            mac_defconfig
ia64                         bigsur_defconfig
powerpc                        cell_defconfig
riscv                            allyesconfig
xtensa                  nommu_kc705_defconfig
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       m5475evb_defconfig
arm                        spear6xx_defconfig
arm                            lart_defconfig
sh                            titan_defconfig
h8300                            alldefconfig
nios2                         3c120_defconfig
m68k                         apollo_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      pasemi_defconfig
x86_64                           alldefconfig
mips                           ip32_defconfig
mips                            gpr_defconfig
arc                         haps_hs_defconfig
xtensa                           alldefconfig
arm                           corgi_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                        m5272c3_defconfig
arm                           h5000_defconfig
powerpc                      tqm8xx_defconfig
um                             i386_defconfig
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
ia64                          tiger_defconfig
m68k                           sun3_defconfig
powerpc                      makalu_defconfig
arm                  randconfig-c002-20220217
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
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
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220217
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220217
arm                  randconfig-c002-20220217
i386                          randconfig-c001
mips                 randconfig-c004-20220217
arm                     davinci_all_defconfig
arm                      tct_hammer_defconfig
arm                     am200epdkit_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220217
hexagon              randconfig-r041-20220217
riscv                randconfig-r042-20220217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
