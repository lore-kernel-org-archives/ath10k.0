Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E95C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 20:44:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013642388E
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 20:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 013642388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXydGuMxkWKnVEMD9qRhKAKuax2NkUuhcMBYvGRL3Mo=; b=VRa46vcTTtLJYjY5xDg15ZnVLD
	/7fW0qLPKhYo7tUGr0JhKXxZIdJIE0Ph2R7eaiFQLVNPb/R0xzfQDgkcaWrzXwxnh0xV0gN/kzNPG
	0kQVTth9ifpFaq3zE63R9ONy4xntIIhh4XRdcRm+X0hyqeV9fo1QlTmdBikA+jD1Iyr59/3RM9Yd9
	r/dyFM/BWV4SSfZW4Pk4I7gMaoReCE8OH5EPFuEvvp/WwIWC+KtOrquo7xcnB/wA5H53EQkzEnYVH
	Kn1JWhY6HmBd2Esdx8f0XdbmkEDB+a7tfqao/SPVWjWd9/83C5woBcamtocZtPHvFOeKhEGlVHrSz
	vOR55wGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq077-0001yV-1X; Thu, 17 Dec 2020 20:43:05 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq071-0001wU-Jk
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 20:43:02 +0000
IronPort-SDR: NqY/BX+jtbwb8l5fex+Y90OjGEOtuQ6nP5ku6Pbfs2ZhV87mN8dV/7hQWcudRztWXLAUTjBqsx
 v1jEaRYGG5dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="175429480"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="175429480"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 12:42:57 -0800
IronPort-SDR: MauL+TIv2fMsox7eKRkvCYqnfkEVepqWVbBqEFzRl0DkcEz6T09HlpjKXorPR51UHfEpstnptE
 pgJfepp9Acvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="342737148"
Received: from lkp-server02.sh.intel.com (HELO 070e1a605002) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Dec 2020 12:42:56 -0800
Received: from kbuild by 070e1a605002 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kq06x-0001MX-DJ; Thu, 17 Dec 2020 20:42:55 +0000
Date: Fri, 18 Dec 2020 04:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 b53b653f1e5d22778df8d1d86844ae5eb69020ad
Message-ID: <5fdbc2bd.fM07dGXcsKikPZC1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_154259_812206_AC175DBF 
X-CRM114-Status: UNSURE (   6.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-qca
branch HEAD: b53b653f1e5d22778df8d1d86844ae5eb69020ad  Merge branch 'ath-next' into ath-qca

elapsed time: 723m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       omap2plus_defconfig
sh                                  defconfig
powerpc                 mpc8540_ads_defconfig
arm                        vexpress_defconfig
arm                        cerfcube_defconfig
h8300                     edosk2674_defconfig
arm                          pxa3xx_defconfig
arm                     eseries_pxa_defconfig
mips                         bigsur_defconfig
mips                          ath25_defconfig
arm                          simpad_defconfig
powerpc                      chrp32_defconfig
sh                          landisk_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     taishan_defconfig
arm                       multi_v4t_defconfig
h8300                               defconfig
c6x                        evmc6457_defconfig
sh                            shmin_defconfig
xtensa                       common_defconfig
arm                           sunxi_defconfig
arm                            lart_defconfig
mips                    maltaup_xpa_defconfig
arm                          badge4_defconfig
mips                            e55_defconfig
powerpc                     akebono_defconfig
c6x                        evmc6678_defconfig
microblaze                      mmu_defconfig
powerpc                     skiroot_defconfig
arm                         s3c6400_defconfig
powerpc                     tqm8555_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                         virt_defconfig
mips                          malta_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
arm                         lpc32xx_defconfig
mips                           mtx1_defconfig
sh                         microdev_defconfig
arm                          collie_defconfig
h8300                       h8s-sim_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                      bmips_stb_defconfig
powerpc                   currituck_defconfig
arm                  colibri_pxa300_defconfig
m68k                        m5407c3_defconfig
powerpc                       ppc64_defconfig
arm                         assabet_defconfig
sh                          lboxre2_defconfig
arm                            xcep_defconfig
arm                   milbeaut_m10v_defconfig
arm                           spitz_defconfig
xtensa                          iss_defconfig
arm                         cm_x300_defconfig
sh                             espt_defconfig
c6x                        evmc6472_defconfig
ia64                                defconfig
arm                        spear6xx_defconfig
arm                      footbridge_defconfig
powerpc                     stx_gp3_defconfig
sh                   rts7751r2dplus_defconfig
riscv                    nommu_virt_defconfig
powerpc                     asp8347_defconfig
powerpc                     tqm8540_defconfig
mips                        workpad_defconfig
sparc                       sparc64_defconfig
mips                        nlm_xlr_defconfig
powerpc                      makalu_defconfig
s390                          debug_defconfig
nios2                            alldefconfig
sh                 kfr2r09-romimage_defconfig
mips                         db1xxx_defconfig
mips                         cobalt_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a016-20201217
x86_64               randconfig-a012-20201217
x86_64               randconfig-a013-20201217
x86_64               randconfig-a015-20201217
x86_64               randconfig-a014-20201217
x86_64               randconfig-a011-20201217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
