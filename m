Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFF5C4332F
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5sg94xew4pK50A89c5hOu1y8uiZiUIBqVUTzFIlngbk=; b=dAxwlrxBLbKepp
	O6WTg3xupY+2w5rKByA/vJoPepLhGFBe5lSyEYGKTP+nJOo67FdmKMIzQ6CAcWe1/etTAKKmLcinl
	SXnrP5TtPLj2GlL727yl+eTrpT6+9f/7y3SpnYcCrLtfvTAvWyYMD8ALYEFJ4YJtqd1DYzctvKYNn
	LLYoSQ6M+BIxNirNeqyrFCdA/uXrOvVH7AZmkpZsMfZG1KK5OGYupkWjF3FB4MKwsl6qUFLpRzMIe
	44MMldJ3eNxGwywc5t9mI0B+SmTJZ7ab9p9r6nlxwr3Uu8T3sSAAMXiQrn6k7dZ7IbBdaFwlH0xJk
	kNaUwpHPw6eiZi7Y/n4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigpa-0092Si-LE; Wed, 12 Oct 2022 18:51:50 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigpX-0092RE-B5
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 18:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665600707; x=1697136707;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4TebUz+0rE6ThCEnLdSjgyK+qgq4dVPnVrk6Za+Fl2w=;
  b=ORxDXXLAt8/2QfBrVl+G5lm1XZBKRyT+3NzYBpWkS+c+/uIyGT0frWHk
   cnfx55rjlztz6/O9mq80fZpTrRjNXFNduaBr5z29LoGXzFjBPblts7wXs
   S5UEJOlkJZD0YpD8niSuDJdIBY+9BTfIf5V0d1kD3z/ouG8Wqx/IkXFMI
   OtcHQ8vPidgutUFihmVxUeUFBa6cJZRAKIETDfJdqi6tOfNKE0F3vGDcT
   vhShbaSm/CMmL8P2Uk90wrZu9J24ESByuYr/rlimI3OohV84G5OxH9nZt
   Ljb767EELcjJPYzDP3Jrx+ZTmrUbaQCl5v673c5RJ7qgnVq4bX/PcSATD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="304869731"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="304869731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 11:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="657883411"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="657883411"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2022 11:51:42 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oigpR-00045m-1J;
	Wed, 12 Oct 2022 18:51:41 +0000
Date: Thu, 13 Oct 2022 02:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c99965b22dde0aedefb3b6c6873e99a49b6ab1ac
Message-ID: <63470ca0.W96iIX0Pc/zRSZaA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_115147_423851_624358F7 
X-CRM114-Status: UNSURE (   4.41  )
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
branch HEAD: c99965b22dde0aedefb3b6c6873e99a49b6ab1ac  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                             allmodconfig
x86_64                              defconfig
ia64                             allmodconfig
x86_64                        randconfig-a013
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a011
alpha                            allyesconfig
arc                  randconfig-r043-20221012
i386                             allyesconfig
riscv                randconfig-r042-20221012
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
alpha                               defconfig
x86_64                        randconfig-a015
m68k                             allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
s390                 randconfig-r044-20221012
s390                                defconfig
mips                             allyesconfig
s390                             allyesconfig
arm                                 defconfig
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arm64                            allyesconfig
i386                          randconfig-a001
arm                              allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
arc                              alldefconfig
sh                            shmin_defconfig
sh                         apsh4a3a_defconfig
openrisc                            defconfig
arm                        keystone_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc834x_mds_defconfig
mips                       bmips_be_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        clps711x_defconfig
powerpc                      arches_defconfig
mips                     loongson1b_defconfig
mips                          rb532_defconfig
xtensa                           allyesconfig
sh                           se7750_defconfig
powerpc                     rainier_defconfig
powerpc                    amigaone_defconfig
mips                           ci20_defconfig
m68k                                defconfig
riscv                    nommu_k210_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
sh                          landisk_defconfig
sh                         ecovec24_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221012
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
riscv                             allnoconfig
powerpc                 mpc8560_ads_defconfig
mips                      maltaaprp_defconfig
x86_64                        randconfig-k001
powerpc                      katmai_defconfig
mips                     cu1830-neo_defconfig
powerpc                      obs600_defconfig
mips                           mtx1_defconfig
powerpc                        icon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
