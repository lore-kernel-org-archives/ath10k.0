Return-Path: <SRS0=h5s7=GW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A09BC433E6
	for <ath10k@archiver.kernel.org>; Tue, 19 Jan 2021 07:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D4723127
	for <ath10k@archiver.kernel.org>; Tue, 19 Jan 2021 07:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D4723127
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=veUo7OfAzoB+23dMVmenATLWJLGt4+H4uoMbUhEC3vQ=; b=Dgmb5wihunqgirHUr1QW3SqkZq
	RmaUhYJzHMiCgEWa8QoasPPLtXGv23iqAdJbepCZED4kSwPIG5YGi+4m57sUa/wXRHMbHrGosJRNi
	JTaXJgJSLs9Y0N6fiHxBcUiEtvNCZzfffRPwb8OA4G5UJhT6ZLcuwb8RukThw9ATeXl3DossSn3QM
	iJlVns0k4pe4/W4EHfKBWgWxoPfzYq5Di4C8D5S8bkBz5uupYn+llGl0Yl17jubx+DYxBfvkRWWa+
	d5G64r3MBR5qvHyRVI7EV8A4vgXCGikO/nzyKKXcE/0rZwrmwgBSxypmUTaEs5qHQxo79d4HDtW19
	NK62whCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1kz6-0007aw-3c; Tue, 19 Jan 2021 06:59:24 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1kz2-0007ac-BH
 for ath10k@lists.infradead.org; Tue, 19 Jan 2021 06:59:22 +0000
IronPort-SDR: izThY/lQT7kwa6ao5pzQnU94E/mIifN7ObtIjWBgMBCZv0fbDbwcakdNhSc3+HqSwLisa4WXVp
 vodtwjUKThTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="166553821"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="166553821"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 22:59:11 -0800
IronPort-SDR: 9fkmPAv15UFPwPoGYJweXxUSJCpp/IRtqrdVq7fk8Fki2RqQY7HWaHoHdJtLat64xV5SwXb5UA
 5/hGRFoOfjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="355448637"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2021 22:59:09 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l1kyq-0004pl-UY; Tue, 19 Jan 2021 06:59:08 +0000
Date: Tue, 19 Jan 2021 14:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 13112a10a90ece17774a25bc363a7561c26aa19f
Message-ID: <6006830b.I1uQ85EiVbWpNMed%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_015921_180529_563D3D32 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 13112a10a90ece17774a25bc363a7561c26aa19f  ath9k: Add separate entry for LED triggers to fix module builds

elapsed time: 794m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                 kfr2r09-romimage_defconfig
sparc                            allyesconfig
sparc64                             defconfig
arm                          pxa910_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         s3c6400_defconfig
arm                         lpc32xx_defconfig
sh                           sh2007_defconfig
powerpc                     kmeter1_defconfig
powerpc                      tqm8xx_defconfig
sh                          polaris_defconfig
m68k                        mvme147_defconfig
arm                          tango4_defconfig
powerpc                  iss476-smp_defconfig
s390                       zfcpdump_defconfig
powerpc                      ep88xc_defconfig
powerpc                      mgcoge_defconfig
arm                            xcep_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         nhk8815_defconfig
h8300                     edosk2674_defconfig
mips                     decstation_defconfig
mips                malta_qemu_32r6_defconfig
arm                         s3c2410_defconfig
sh                              ul2_defconfig
m68k                          multi_defconfig
powerpc                      pcm030_defconfig
sh                   sh7724_generic_defconfig
xtensa                    smp_lx200_defconfig
arm                             ezx_defconfig
arm                           viper_defconfig
arm                        shmobile_defconfig
arm                       netwinder_defconfig
parisc                generic-32bit_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8548_defconfig
h8300                               defconfig
mips                          rm200_defconfig
arm                        magician_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                      tct_hammer_defconfig
mips                           jazz_defconfig
powerpc                     skiroot_defconfig
i386                             alldefconfig
m68k                            q40_defconfig
powerpc                 mpc8560_ads_defconfig
mips                    maltaup_xpa_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                               tinyconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210118
i386                 randconfig-a005-20210118
i386                 randconfig-a006-20210118
i386                 randconfig-a001-20210118
i386                 randconfig-a003-20210118
i386                 randconfig-a004-20210118
x86_64               randconfig-a015-20210118
x86_64               randconfig-a013-20210118
x86_64               randconfig-a012-20210118
x86_64               randconfig-a016-20210118
x86_64               randconfig-a011-20210118
x86_64               randconfig-a014-20210118
i386                 randconfig-a011-20210118
i386                 randconfig-a012-20210118
i386                 randconfig-a016-20210118
i386                 randconfig-a015-20210118
i386                 randconfig-a013-20210118
i386                 randconfig-a014-20210118
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210118
x86_64               randconfig-a006-20210118
x86_64               randconfig-a001-20210118
x86_64               randconfig-a003-20210118
x86_64               randconfig-a005-20210118
x86_64               randconfig-a002-20210118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
