Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A47C433F5
	for <ath10k@archiver.kernel.org>; Mon, 23 May 2022 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F4sAmpJfTmGzZYMJ0kCBrpIY/Ge5g56YLZXYb3kJZz4=; b=PVA2dirv5NdsH6
	RmYoUPeO8Wh9cOrWkKbw1v2iZn0NPKQlVqS2EHrHX31KYcIupB6byPRfeDLhizUvJmvRfEEdq04qV
	M6E5CykSj+mu+RVfgzwFFow2dtK75O6UJl4MXtU84/K6zlIqzDZtw9JbbhCitEkTT/Kl00GBhPMPQ
	H+f5qOSA1VONGJEgjhuccc+rbiGFfxyxnLve7AiKndoAKdg9/Pnx1CNJml0RLWHAw1nM/FaB2ulou
	xsx/7OUs1hqJgUh/qKVlT0nf+KytKODwJsg9I5FxMrkMAQ3v8ALegq5uYFfHj3Xjby/r2dCYPwPno
	gEWyHfGlur/zTaXIHM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3r9-002c0y-EW; Mon, 23 May 2022 08:56:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2vX-002CKb-8v
 for ath10k@bombadil.infradead.org; Mon, 23 May 2022 07:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=R8uKPK78gU2Jwv03ScDCW3ALh+YnVOeUVN6HSHXAXNs=; b=fBFxtQLvnOwjkaUQGzuLjiLoYp
 tdnt8r8ptLWw+H7j7LjBmUaw/NugCFsNiSwAx2Ltf2b7nBgD6psz2EMjvICjCIKNgPkGeN2s8f7eI
 IQ84IigwPymVkuOB9R03CfzW1B5+3HoEzA7zFgESHAlxVj5YAXrVVcw7yZzsTf3Hsw/amTAhCtukT
 xkJrPvNG9ieyUUUuuLvv9jRwiEcGIr2BZk5ZNUioCnL6QPpunPtzY1njfqHuF7O5WGdLHp2EtavX2
 d4zeVyupz70GxWfoVtxY/BWhRzM1Enl48No9HVYtEEerNP7JtJEgqsPSI/zz7orzBV4EZI00If7lK
 K/s07pjw==;
Received: from mga01.intel.com ([192.55.52.88])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nswMD-000iC3-Qd
 for ath10k@lists.infradead.org; Mon, 23 May 2022 00:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653267337; x=1684803337;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=J3ghirvu0NV/UhOBoYhq7S4SKIwOVxGA4Mqt0Mc3VEo=;
 b=T5TiT/360G5YB+Adnraf76IrLGLP+oLqRVGVY2yj28WuffCvc0kfRjpT
 8TyKrKQFFQVXl3BvQ15KZdGzblprtvcqCEPl9L5aMCgcGGlLdgPhT6Q54
 CGBoM2HKOzF7+/s13tKLcogrsWpDletbIdW7lkrkeOW4Gjk366F8pNcIG
 RpcnDlHccQk+NUu7Dd8CXfKA2jPcCbIKO9RK1PcN0Qf3ecQhpgXa3l286
 N0vs4qww4t6XeIaSgZ1FixDw/sJgVPMOGCq/MUOcdZ7pB3n1Jg04+TMRb
 qJD5DkJWfcU6DL3y2+Fw8Sdbv8nkVfVn75d/htglp8LQDwNMy9bF33FPh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="298377479"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="298377479"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 17:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="716455986"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2022 17:54:26 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nswL3-0000lS-SE;
 Mon, 23 May 2022 00:54:25 +0000
Date: Mon, 23 May 2022 08:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 2be8afe05833c65017c8c56953f3640acfc42a40
Message-ID: <628adb19.lGxtIJ+zoNn+IbCk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015538_608986_E764F83C 
X-CRM114-Status: UNSURE (   7.34  )
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
branch HEAD: 2be8afe05833c65017c8c56953f3640acfc42a40  ath9k: replace ternary operator with max()

elapsed time: 725m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm                            hisi_defconfig
arc                        vdk_hs38_defconfig
sh                            shmin_defconfig
parisc                              defconfig
mips                      fuloong2e_defconfig
arm                         axm55xx_defconfig
mips                     loongson1b_defconfig
csky                             alldefconfig
um                             i386_defconfig
ia64                          tiger_defconfig
arm                           h3600_defconfig
sh                           se7721_defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
arm                        clps711x_defconfig
arm                          pxa3xx_defconfig
arc                              alldefconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
m68k                                defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
m68k                          hp300_defconfig
m68k                             alldefconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
i386                          randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
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
powerpc                     mpc512x_defconfig
powerpc                          allyesconfig
powerpc                      ppc44x_defconfig
arm                           omap1_defconfig
arm                            mmp2_defconfig
powerpc                     skiroot_defconfig
arm                       imx_v4_v5_defconfig
powerpc                    gamecube_defconfig
mips                     cu1830-neo_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
arm                          moxart_defconfig
mips                         tb0219_defconfig
powerpc                   bluestone_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
