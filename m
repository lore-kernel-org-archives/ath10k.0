Return-Path: <SRS0=/di5=KU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAC2C2B9F7
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 00:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063896141C
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 00:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063896141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J3GNleu49A4R4hXW5oX4dGX9361yatBm+xQ4l+1eVu4=; b=jwlffz7bUrD8Gf
	Eyrx9P1jfjI878hJ7YqtYcXWrjabXiSF+kH0ov5csefL1CXQwWXpTvFtwekvYv+LCJjbZtCPZ5qA0
	QDFJFXbkC0mS9G32NvWO8EwVGDYItx73zqDg4L2S2MnOQFGVGd7lqMlPHeiN2u+pl1AkIqZ09sBfN
	a2HLnVYgsIqOFd4lfoSSYWih/4QMYmkGs9axpAkegyTAFPd9EvHDtm/C3HHcSYjoyH6PW1UuSD+P6
	VHE7mieBshJjeN4YZvbhRnQzy1tWA2ZZKyYtTnuODuRejwLvQN6jtjiame3JN0xIQJhgyvwDXAJBS
	di2y9b44F4Fybe27/kcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llLKS-002eVn-1C; Tue, 25 May 2021 00:53:52 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llFkd-001Z7L-Ri
 for ath10k@lists.infradead.org; Mon, 24 May 2021 18:56:37 +0000
IronPort-SDR: guPEXQzSUfBPXOCLg+Bbi3WRAcjhFCb9xo0fW8gA0XAg6MH9IVCSIOspBYw3puMIotCca2Kcb8
 AXkc2h+Giudg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223166450"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="223166450"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:56:29 -0700
IronPort-SDR: duvHWSkmuGU7RdNDt912MPReog3P/UpAh5uys0/Z88bCNxxtW0CRDVcaI1Garb+hv6IWgo9Rza
 NW6mz+Emrjog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="470719085"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 24 May 2021 11:56:28 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1llFkZ-0001Jy-VE; Mon, 24 May 2021 18:56:27 +0000
Date: Tue, 25 May 2021 02:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-next] BUILD SUCCESS
 17818dfa8f2e90a6f40e047a3ea9c39af1a8a87d
Message-ID: <60abf6a6.d5oTHr2bqDjxcQ1M%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_115631_976256_D1A8FC20 
X-CRM114-Status: UNSURE (   6.60  )
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
branch HEAD: 17818dfa8f2e90a6f40e047a3ea9c39af1a8a87d  ath10k/ath11k: fix spelling mistake "requed" -> "requeued"

elapsed time: 730m

configs tested: 192
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      mgcoge_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
powerpc                      pcm030_defconfig
mips                           ip27_defconfig
mips                           mtx1_defconfig
arm                             mxs_defconfig
mips                        bcm47xx_defconfig
arm                         at91_dt_defconfig
arm                            lart_defconfig
sh                         apsh4a3a_defconfig
arm                           spitz_defconfig
powerpc                      makalu_defconfig
xtensa                           allyesconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
arm                          ep93xx_defconfig
powerpc                     stx_gp3_defconfig
sh                        sh7757lcr_defconfig
arm                         axm55xx_defconfig
arm                          pcm027_defconfig
riscv                    nommu_virt_defconfig
powerpc                   currituck_defconfig
xtensa                              defconfig
m68k                        m5407c3_defconfig
mips                      pic32mzda_defconfig
powerpc                     mpc83xx_defconfig
ia64                             alldefconfig
sh                           se7724_defconfig
sparc                            allyesconfig
mips                     cu1000-neo_defconfig
sh                         microdev_defconfig
arm                       spear13xx_defconfig
riscv                          rv32_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     sequoia_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
xtensa                       common_defconfig
powerpc                       maple_defconfig
arm                            qcom_defconfig
sh                   sh7724_generic_defconfig
arm                      integrator_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_k210_defconfig
sh                           se7722_defconfig
arm                          badge4_defconfig
s390                                defconfig
nds32                               defconfig
arm                         lpc18xx_defconfig
openrisc                            defconfig
riscv                               defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7203_defconfig
arm64                            alldefconfig
mips                           xway_defconfig
mips                     loongson1c_defconfig
mips                  cavium_octeon_defconfig
sparc                               defconfig
csky                             alldefconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
arm                           h3600_defconfig
mips                        omega2p_defconfig
sh                        sh7785lcr_defconfig
parisc                generic-32bit_defconfig
powerpc                       eiger_defconfig
parisc                           allyesconfig
sh                          rsk7201_defconfig
powerpc                     powernv_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
mips                        workpad_defconfig
mips                     loongson2k_defconfig
mips                           jazz_defconfig
riscv                            alldefconfig
arm                     eseries_pxa_defconfig
powerpc                    adder875_defconfig
xtensa                    smp_lx200_defconfig
powerpc                      acadia_defconfig
sh                           se7619_defconfig
powerpc                     akebono_defconfig
parisc                           alldefconfig
openrisc                  or1klitex_defconfig
m68k                       m5249evb_defconfig
powerpc                     tqm5200_defconfig
arm                       cns3420vb_defconfig
sparc                            alldefconfig
powerpc                     pseries_defconfig
arm                         palmz72_defconfig
powerpc                  mpc885_ads_defconfig
m68k                             alldefconfig
sh                        sh7763rdp_defconfig
sh                   rts7751r2dplus_defconfig
mips                           gcw0_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
sh                          r7780mp_defconfig
m68k                            mac_defconfig
m68k                            q40_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc64e_defconfig
um                            kunit_defconfig
i386                             allyesconfig
nds32                            alldefconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
mips                         tb0226_defconfig
powerpc                        cell_defconfig
xtensa                         virt_defconfig
alpha                            alldefconfig
arc                 nsimosci_hs_smp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a006-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a011-20210524
i386                 randconfig-a016-20210524
i386                 randconfig-a015-20210524
i386                 randconfig-a012-20210524
i386                 randconfig-a014-20210524
i386                 randconfig-a013-20210524
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
