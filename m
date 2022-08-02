Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4461C00140
	for <ath10k@archiver.kernel.org>; Tue,  2 Aug 2022 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpicyJ4HgrsWxhHsB5jSVCfDbYWefX52GPDsLy8+ZKs=; b=4A+reoxF+LI1kl
	uTeaKC0wbo4yKhocD0ZDjTEvRGGkFT1OjJb05vM0VVHCa6aQaPiyXG6R6peXd0ldGmKIynjI062wP
	rHqWXhtUNexhH4V8la9ocb0OuJxyySOHrgUtxQWjKO+KBAQ61RhLEyLwTXlnWc+7CPsTO0RHe20rI
	xdOMOvwQzveyWAR0/bScAuO7ziuX/0vRJK0U/rH8oH+8zN2MSWtUDfwPoIrGCM7jzTshN+P+rysMj
	fjREaSij4VzxUK5Oiy3qGTCOZfcRfTiEfzg9q22oeiVHuWJ65w2IezwkifCxWY25MuTfeA2cQufoG
	wcfjrnLrr+xtvKtCoNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIxLj-00Go1F-JJ; Tue, 02 Aug 2022 19:14:39 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIxLf-00GnyP-R8
	for ath10k@lists.infradead.org; Tue, 02 Aug 2022 19:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659467675; x=1691003675;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ftBYAEmeVC5qw7hQcQF7CG+G0YG/OFGIymMOa9rjklI=;
  b=ESDHT7vNxAzaEGRXQz5vIjt4LmP0OA09+i2sSNe51p11wyhid/JfFVTr
   FcJ18dfCYK4Pl4WmrMxMkt06qgMu6mLcme4SGTRuKlpF0yaDynBvIwbus
   y+I3lW54nbShHifJTSeFz2+/rDOkittuD20/wcBMv16DABmInHu8wrwkT
   zzFCW8sC3Jc4VLBS3t+YdvytZcQWYFaKFYuZnbu/0c6XrBt4PXSZ8Tw0j
   KVwhquAMOKeZ/QoIIK4bI2Ry/ve7EJnqPuGJbRigHodVIX5C2a2r2wJrE
   XRuwnG0815V/Nogcd+YObWF7+6VHiVU72NkncoBMmpQAdiGXBOyScdbNN
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="351210958"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="351210958"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 12:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="553034047"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Aug 2022 12:14:30 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIxLZ-000GKd-1T;
	Tue, 02 Aug 2022 19:14:29 +0000
Date: Wed, 03 Aug 2022 03:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 71fffa793629cc92f3c597e28178b027d81fff96
Message-ID: <62e9777e.R0/OO1DIJcR87wrq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_121435_955317_1E001BB6 
X-CRM114-Status: UNSURE (   4.90  )
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
branch HEAD: 71fffa793629cc92f3c597e28178b027d81fff96  wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()

elapsed time: 704m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
x86_64               randconfig-a014-20220801
um                           x86_64_defconfig
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
x86_64               randconfig-a013-20220801
x86_64               randconfig-a015-20220801
x86_64               randconfig-a016-20220801
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
i386                 randconfig-a012-20220801
i386                 randconfig-a013-20220801
i386                 randconfig-a014-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a015-20220801
arm                                 defconfig
x86_64                               rhel-8.3
i386                 randconfig-a016-20220801
x86_64                           allyesconfig
arc                  randconfig-r043-20220801
alpha                            allyesconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20220801
sh                               allmodconfig
riscv                randconfig-r042-20220801
mips                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
ia64                             allmodconfig
powerpc                   motionpro_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
xtensa                           alldefconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
sh                      rts7751r2d1_defconfig
x86_64               randconfig-k001-20220801
i386                 randconfig-c001-20220801
powerpc                        warp_defconfig
powerpc                       ppc64_defconfig
ia64                             alldefconfig
arm                           tegra_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        mini2440_defconfig
powerpc                    adder875_defconfig
powerpc                     mpc83xx_defconfig
arm                           imxrt_defconfig
arc                          axs101_defconfig
sparc                            alldefconfig
ia64                                defconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                     taishan_defconfig
sh                        dreamcast_defconfig
arm                         cm_x300_defconfig
mips                    maltaup_xpa_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a004-20220801
x86_64               randconfig-a005-20220801
x86_64               randconfig-a006-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a006-20220801
hexagon              randconfig-r041-20220801
hexagon              randconfig-r045-20220801
hexagon              randconfig-r045-20220802
s390                 randconfig-r044-20220802
hexagon              randconfig-r041-20220802
riscv                randconfig-r042-20220802
arm                              alldefconfig
powerpc                      katmai_defconfig
powerpc                     akebono_defconfig
arm                   milbeaut_m10v_defconfig
arm                      tct_hammer_defconfig
arm                         shannon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
