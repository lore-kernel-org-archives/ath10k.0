Return-Path: <SRS0=b4Sx=JU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5263EC433ED
	for <ath10k@archiver.kernel.org>; Fri, 23 Apr 2021 03:59:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE5A61422
	for <ath10k@archiver.kernel.org>; Fri, 23 Apr 2021 03:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE5A61422
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pz17WpjmZhHPgyhO/TFbU9nBWoFzrQpXYBvSAcPSbck=; b=K3Mt1HrTG+lD5La7Ove0zICBFg
	12W6Upw9MHkALcUpdvlwwWcbfz9YgKu4Fe4SbX2ZMz0bAeJ0o8LOKPGPUuWTizN9WfNF3jVqhjMgf
	jgwvmPMque/r00E8s26uz3BTc0YxHKeFWvGAXVUrtB1YFPrUM6SkGKkpYVZNWiE3lzRCOEzW2qJKR
	qsvuD2DC4jY+tc+NGqCFFpu+7S4DGXFriok7JF437US9JfYCfoQnj2688fmZ+Ugj9wr60NsYk9GD7
	skKQFl/n0YY91S5/MU+b6tr9bPtJP5z7gIbDBMVF9MfAQQC+bTKSy9/iX8rGU/tw6524yGCRVqwoW
	e14WxsCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmwd-000Xeo-Jq; Fri, 23 Apr 2021 03:57:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmwO-000XeI-HL
 for ath10k@desiato.infradead.org; Fri, 23 Apr 2021 03:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9xcoEzQoexqJlePbqyG1Kkyin0WH+zZR/pqD/Nw1dv4=; b=JL2WwZqDr5IdLE5uLs6GACftG9
 Fw5LVk6CUIm0ba8BS3rWiQrM6pxLO0VUKfCr8GI3SOXiKTlQW1/icu3/B9ggEcm+nGq6ei0+E1BHp
 esvPVf805J2QUo5rXcty3lxekR/xYzkRBnR52gvRylnq3Edl4w2MtOoYWNNVlIdaV0MMprn7voE2d
 p/wW+ScFjNox6Q8cLgxYEJ1dMiGRsExu8ZVhKUcZZqsYkznXgLlv/0Nn1t0eKxrwdssJq9ehjHj7b
 8zi7+4cPRTJGb3Y7uebnTIfDhXNC8/aG89oeafz0ehCmmV/aA4qtY6AasV1PsN6jO0GlSBCWsFyjO
 cGvzSY3g==;
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmwL-00E7ye-OS
 for ath10k@lists.infradead.org; Fri, 23 Apr 2021 03:57:15 +0000
IronPort-SDR: Qr2XlEcpSHRi//64/SW7Qk7ZFVTw3Ois7Dsyo4tPI73L/vOwR8L7nqBwpvlNTpOOOP2i8v22A3
 28KpnxczHZRw==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="216694420"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="216694420"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 20:57:08 -0700
IronPort-SDR: ZewwCt/TG314lPHMHA5NF6LE0zfri1CQtLQG1uDv/4E78Rx12+kZ9xbhV9yYaim2nCkNxFN5Zz
 DG5tHM/iX0xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="614604703"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2021 20:57:07 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZmwE-0004Vu-SH; Fri, 23 Apr 2021 03:57:06 +0000
Date: Fri, 23 Apr 2021 11:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master] BUILD SUCCESS 5e3f64cc5ff2ef0a1b9b7cf3d6ca06f1e3939f07
Message-ID: <60824578.fz6/AyNGXhAWcSjn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_205713_847318_ADD1C4A8 
X-CRM114-Status: UNSURE (   4.78  )
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
branch HEAD: 5e3f64cc5ff2ef0a1b9b7cf3d6ca06f1e3939f07  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 164
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                          rm200_defconfig
arm                     am200epdkit_defconfig
mips                         mpc30x_defconfig
mips                           ci20_defconfig
arm                           spitz_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      acadia_defconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
powerpc                 linkstation_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
nios2                            alldefconfig
mips                         bigsur_defconfig
arm                           h3600_defconfig
sh                   rts7751r2dplus_defconfig
arm                     eseries_pxa_defconfig
parisc                           alldefconfig
powerpc                      mgcoge_defconfig
mips                        omega2p_defconfig
arm                          exynos_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
powerpc                       ebony_defconfig
arc                            hsdk_defconfig
arm                       versatile_defconfig
arm                        cerfcube_defconfig
arm                       mainstone_defconfig
mips                      bmips_stb_defconfig
arm                        mvebu_v5_defconfig
arm                        mvebu_v7_defconfig
ia64                            zx1_defconfig
arm                           sunxi_defconfig
arm                           sama5_defconfig
mips                malta_qemu_32r6_defconfig
mips                     cu1000-neo_defconfig
arm                           u8500_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                          kfr2r09_defconfig
sh                        sh7763rdp_defconfig
csky                             alldefconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
mips                         rt305x_defconfig
powerpc                      chrp32_defconfig
arm                         mv78xx0_defconfig
arc                              alldefconfig
powerpc                      ppc40x_defconfig
xtensa                  cadence_csp_defconfig
openrisc                  or1klitex_defconfig
mips                      pic32mzda_defconfig
nios2                            allyesconfig
mips                        maltaup_defconfig
mips                        vocore2_defconfig
powerpc                       maple_defconfig
sh                           se7751_defconfig
m68k                            mac_defconfig
mips                   sb1250_swarm_defconfig
h8300                       h8s-sim_defconfig
sparc                               defconfig
powerpc                     ep8248e_defconfig
mips                          rb532_defconfig
powerpc                     tqm8548_defconfig
powerpc                     mpc512x_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                            dove_defconfig
arm                        neponset_defconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
ia64                          tiger_defconfig
um                           x86_64_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
x86_64               randconfig-a002-20210423
x86_64               randconfig-a004-20210423
x86_64               randconfig-a001-20210423
x86_64               randconfig-a005-20210423
x86_64               randconfig-a006-20210423
x86_64               randconfig-a003-20210423
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
i386                 randconfig-a014-20210422
i386                 randconfig-a012-20210422
i386                 randconfig-a011-20210422
i386                 randconfig-a013-20210422
i386                 randconfig-a015-20210422
i386                 randconfig-a016-20210422
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
