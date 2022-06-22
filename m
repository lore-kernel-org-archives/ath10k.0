Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913DAC43334
	for <ath10k@archiver.kernel.org>; Wed, 22 Jun 2022 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YczJWA/jDN7d1ytdY0lMdm316N/NhREu3cLvJk/7WdI=; b=pUJaPCLPp6FSOD
	zxs/Fp8IcWkVbPjqeeA927u0PXN2ikmrK4vblB4rdhF9nqZK/C5CEjzu3RqmhimLl8esfWu9lnCyC
	+eSmjiWOCO5a4CDafETt+R14Um5kRXawsHg1rztnje6GV8jolmN0QfTW3NA3yK2PmDqmJNjSGh5b5
	cjs+INipJ5B4AsatSn9/kS5jqefDuvSSH6GRotF5dwKIgjQIkmMkbAae0XESl+rv1qVzVUfCUgG3R
	QScFXrep1ciWNcmAHhaCijVvRtt8HY1HHTphcMoLQQ16uZQxd13hY1TgSmWf+JAnITkUIp2PPSxLo
	s6GM/qnqwCUpJUh46AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44A0-00BhcQ-I2; Wed, 22 Jun 2022 17:29:00 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o449x-00Bhc0-LH
	for ath10k@lists.infradead.org; Wed, 22 Jun 2022 17:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655918937; x=1687454937;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nmQlgSc3v4CM3NV3hGQSex2LJv9hqIFAEydBf2WpWtM=;
  b=BZrspQVfPYQuJG9gsgb20klIZ5l0gy+O67iFOhJdEN10cKUcKmEyqpqh
   oox09fA3M0tYZhZyOE1qZgS01LdXhdpDTmFIny/EdsRATN00Y7FFweUAe
   SHQ5Jsf4wBBJ9iZZLbCs5dA++wRDmUV5IPVNZ/+CMx/JYeNjWEesUvNYv
   lhwd0diMcKq0s8VNXnHf3c/rdRjvqEkplucs7PvIwK2m+Zf+SCc41dgm2
   odgrZ6z7tFEq9Ix0D0BOysu3WNTGD2+fkXQU+JKSW26ujSx0moGGjizrt
   ukrVDTrytrAC8dcRh5lYatSiOSLHKjCbxfmTRHN+utQH4bds/gi1/NWxx
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260917676"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="260917676"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 10:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="592290027"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2022 10:28:55 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o449u-0001WX-QI;
	Wed, 22 Jun 2022 17:28:54 +0000
Date: Thu, 23 Jun 2022 01:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 e4a9152057de2ad44db02de5d9562c7ec4195ed7
Message-ID: <62b3514a.cAOupeoUdQFnRrO1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_102857_761775_DBC487F8 
X-CRM114-Status: UNSURE (   4.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: e4a9152057de2ad44db02de5d9562c7ec4195ed7  Merge branch 'ath-next' into ath-qca

elapsed time: 2205m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                               defconfig
m68k                       m5249evb_defconfig
ia64                         bigsur_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                             alldefconfig
ia64                      gensparse_defconfig
sh                                  defconfig
sh                          polaris_defconfig
sh                           se7712_defconfig
arm                      integrator_defconfig
arm                         vf610m4_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      pasemi_defconfig
arm                             rpc_defconfig
arm                     eseries_pxa_defconfig
openrisc                            defconfig
powerpc                     tqm8541_defconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                                 defconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
sparc                            allyesconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a002-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a006-20220620
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64               randconfig-a003-20220620
x86_64               randconfig-a004-20220620
x86_64               randconfig-a002-20220620
x86_64               randconfig-a005-20220620
x86_64               randconfig-a006-20220620
arc                  randconfig-r043-20220619
s390                 randconfig-r044-20220619
arc                  randconfig-r043-20220622
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                       cns3420vb_defconfig
s390                             alldefconfig
arm                         bcm2835_defconfig
arm                        magician_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                        icon_defconfig
mips                      maltaaprp_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a012-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a014-20220620
x86_64               randconfig-a013-20220620
x86_64               randconfig-a015-20220620
x86_64               randconfig-a016-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a014-20220620
i386                 randconfig-a015-20220620
i386                 randconfig-a013-20220620
i386                 randconfig-a011-20220620
i386                 randconfig-a016-20220620
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220619
hexagon              randconfig-r045-20220620
riscv                randconfig-r042-20220620
hexagon              randconfig-r041-20220619
hexagon              randconfig-r041-20220620
s390                 randconfig-r044-20220620
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
