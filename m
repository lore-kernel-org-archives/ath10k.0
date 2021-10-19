Return-Path: <SRS0=SjaR=PH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573E0C433FE
	for <ath10k@archiver.kernel.org>; Tue, 19 Oct 2021 02:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B17F61390
	for <ath10k@archiver.kernel.org>; Tue, 19 Oct 2021 02:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B17F61390
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QX91FHvqGzZ2uTHQxc+lvZExKBIUNQ5wMT4DhCONrHQ=; b=veds4usPlQOYKn
	c3VhrJSAQy1q2QUpQD6HVTCSMZ7W1gHt3oMmM/EQWvWVOkc6hHiraWkA/wAzdmSIFZ/4iinh/P4zZ
	S/fB4rtkcqStosAHo/dXYDWagbTVLG56lAJ/Z7IA7t0oYFDbHXsdlblFIkU6Ux/PLQe0dVznIg0dF
	XxAibPOJ1A5Z2bgTJWO9EU1mwTzrkI60RbARKpjRh4Y0ef8V2XWQxIMlkrY9RVUrG2JVIhJxvKbJz
	iJUFgqyovrNR2Vaj0RecoHBhGhgrrEcRMcCEziWxuwjbtZ4IOWqgZRO31ZobIzcgXRGHLdcyW67a0
	2MBIjHlwLYyaD2tKWtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mceWl-00HZ5F-LC; Tue, 19 Oct 2021 02:06:55 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mceWg-00HZ3t-LS
 for ath10k@lists.infradead.org; Tue, 19 Oct 2021 02:06:52 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="251871789"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="251871789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 19:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="661612881"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 18 Oct 2021 19:06:46 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mceWc-000Bvh-B6; Tue, 19 Oct 2021 02:06:46 +0000
Date: Tue, 19 Oct 2021 10:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 4ae1a0ed7dba1becd8ee8ec9dccd2a72fed10e24
Message-ID: <616e2820.sp6/zlmg8+dMoDWY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_190650_758772_68313AD8 
X-CRM114-Status: UNSURE (   6.54  )
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
branch HEAD: 4ae1a0ed7dba1becd8ee8ec9dccd2a72fed10e24  ath10k: fetch (pre-)calibration data via nvmem subsystem

elapsed time: 727m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
mips                           ip28_defconfig
i386                             alldefconfig
mips                         mpc30x_defconfig
arm                             ezx_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         bcm2835_defconfig
powerpc                    mvme5100_defconfig
arm                            pleb_defconfig
sh                         microdev_defconfig
m68k                       m5275evb_defconfig
arm                            qcom_defconfig
powerpc                     pseries_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
sparc                               defconfig
arm                         vf610m4_defconfig
m68k                        mvme147_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            dove_defconfig
sh                     magicpanelr2_defconfig
arm                         s3c6400_defconfig
powerpc                      ppc6xx_defconfig
sh                            shmin_defconfig
powerpc                        icon_defconfig
s390                       zfcpdump_defconfig
mips                           rs90_defconfig
m68k                       bvme6000_defconfig
h8300                            alldefconfig
mips                            e55_defconfig
x86_64                              defconfig
powerpc                      pasemi_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      acadia_defconfig
ia64                            zx1_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc8560_ads_defconfig
arm                          badge4_defconfig
powerpc                        cell_defconfig
m68k                        m5307c3_defconfig
powerpc                      mgcoge_defconfig
m68k                        m5407c3_defconfig
arm                        keystone_defconfig
powerpc64                        alldefconfig
arm                           sunxi_defconfig
riscv                    nommu_k210_defconfig
m68k                       m5475evb_defconfig
arm                       imx_v6_v7_defconfig
sh                             espt_defconfig
powerpc                       eiger_defconfig
powerpc                     tqm8560_defconfig
arm                           corgi_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  randconfig-c002-20211019
i386                 randconfig-c001-20211019
x86_64               randconfig-c001-20211019
arm                  randconfig-c002-20211018
i386                 randconfig-c001-20211018
x86_64               randconfig-c001-20211018
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc                              defconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211018
i386                 randconfig-a003-20211018
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211018
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019
hexagon              randconfig-r041-20211018
s390                 randconfig-r044-20211018
riscv                randconfig-r042-20211018
hexagon              randconfig-r045-20211018

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
