Return-Path: <SRS0=a9IF=L3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2001BC07E95
	for <ath10k@archiver.kernel.org>; Sat,  3 Jul 2021 00:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D110261285
	for <ath10k@archiver.kernel.org>; Sat,  3 Jul 2021 00:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D110261285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qEWo8eVPqFZxrG7RIWiGIXwHS0jYJlhDsxXD7amIUtQ=; b=Nbeu5WFS9W0UFD
	R/f4kqwzR7mXT8IA3z4KUw59/SFhStutIqi3XzyshTlJwEAQhan8O70l8k/0G7tQ1KCUyaTtI0941
	MfY3D9e6Cx7oHxCVba9vdmgD7/t1GspaHcBp9kQX1dAMA7WV5VX5Umg7cO0AWGxTeOA1hUfztAwt5
	kN6lFpPSRqzEK/PCCWgUdfBOFsHxPbV82oVquDUcfYoNmminLuO2ky/KF8vFjQxidxf4AwkTpCk4x
	c2isk1X3I3Ys9M49SfTFusNPDhtoxUYgpEqltW5BsLpa98By2/PY/ssFQoa51YoEHuvaPMH4AeW23
	sOtrbaZWskJQ01o20kGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzTx2-004N8H-Bo; Sat, 03 Jul 2021 00:56:08 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzTww-004N7W-RS
 for ath10k@lists.infradead.org; Sat, 03 Jul 2021 00:56:05 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="195960754"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="195960754"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 17:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="645188583"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2021 17:55:57 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lzTwq-000BIH-Tk; Sat, 03 Jul 2021 00:55:56 +0000
Date: Sat, 03 Jul 2021 08:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-next] BUILD SUCCESS
 0791ba2bc7d33f544528410d9d77aa1b5018adab
Message-ID: <60dfb57c.eaAMPZ0+w7/2uD7z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_175602_979552_0B9484B9 
X-CRM114-Status: UNSURE (   5.55  )
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
branch HEAD: 0791ba2bc7d33f544528410d9d77aa1b5018adab  ath11k: Remove some duplicate code

elapsed time: 727m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                        generic_defconfig
mips                         tb0226_defconfig
ia64                         bigsur_defconfig
arc                         haps_hs_defconfig
mips                     loongson1c_defconfig
riscv                             allnoconfig
powerpc                     skiroot_defconfig
sh                        sh7757lcr_defconfig
sh                          landisk_defconfig
m68k                       m5208evb_defconfig
nios2                            allyesconfig
mips                malta_qemu_32r6_defconfig
mips                           ip32_defconfig
powerpc                 mpc834x_mds_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                            q40_defconfig
arm                         hackkit_defconfig
sparc                            alldefconfig
powerpc                       eiger_defconfig
xtensa                          iss_defconfig
arm                           tegra_defconfig
arm                          ixp4xx_defconfig
sh                             espt_defconfig
arm                       cns3420vb_defconfig
sh                          r7780mp_defconfig
m68k                          amiga_defconfig
sh                           se7712_defconfig
powerpc                        fsp2_defconfig
sh                        dreamcast_defconfig
mips                          ath79_defconfig
arm                         axm55xx_defconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
powerpc                     stx_gp3_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc834x_itx_defconfig
parisc                           alldefconfig
powerpc                     mpc83xx_defconfig
mips                           ip22_defconfig
nds32                             allnoconfig
powerpc                      walnut_defconfig
mips                            ar7_defconfig
sh                            shmin_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
arm                         lpc18xx_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
powerpc                         ps3_defconfig
powerpc                       maple_defconfig
csky                             alldefconfig
mips                        maltaup_defconfig
sparc64                             defconfig
powerpc                      katmai_defconfig
openrisc                         alldefconfig
powerpc                  storcenter_defconfig
arm                        neponset_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210702
i386                 randconfig-a006-20210702
i386                 randconfig-a001-20210702
i386                 randconfig-a003-20210702
i386                 randconfig-a005-20210702
i386                 randconfig-a002-20210702
x86_64               randconfig-a015-20210702
x86_64               randconfig-a012-20210702
x86_64               randconfig-a014-20210702
x86_64               randconfig-a011-20210702
x86_64               randconfig-a016-20210702
x86_64               randconfig-a013-20210702
i386                 randconfig-a015-20210702
i386                 randconfig-a016-20210702
i386                 randconfig-a011-20210702
i386                 randconfig-a012-20210702
i386                 randconfig-a013-20210702
i386                 randconfig-a014-20210702
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210702
x86_64               randconfig-a004-20210702
x86_64               randconfig-a005-20210702
x86_64               randconfig-a002-20210702
x86_64               randconfig-a006-20210702
x86_64               randconfig-a003-20210702
x86_64               randconfig-a001-20210702

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
