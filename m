Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11192C43334
	for <ath10k@archiver.kernel.org>; Sat,  4 Jun 2022 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j8Xl2m5tpL05yJQZm+izc3Y4C27klMsNPyHAUvTskgY=; b=R0OBjjDJOMDEvA
	4WDBCTFrD4ApKIHYfW7CnUxVeHbSWJacIjSsB1HtJYRTDmSK1rrZJJupOsOyCgwjtQMBXxGkPmigM
	RN1Ypq/BhIvWHobhtXTuLDf6UjlSquIhgW+yg+t3Ba8l6Mol2ZNg6ynQ66RQ9meGSOmiLZftiyQnn
	saUxiIpyUWSmwZofu7nhza3ZMzYnLhb58tNfM7V/rD17/OwT2KC9a9h8Tc/b08irAuhtwdCdqddda
	9dkz1tCtFE/ysMjVvuP+DcBEWThmlx9lwsg25R9d3gNREAc6iqfB//rRfOQEKiv9QPwg6hy8MzMhV
	3MqpOaAz8lePMUXg+WXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxQ9e-00B4Qw-23; Sat, 04 Jun 2022 09:33:10 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxQ9b-00B4QL-JA
	for ath10k@lists.infradead.org; Sat, 04 Jun 2022 09:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654335187; x=1685871187;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7OyuTzD+0SIN/wxOYiSI11m4ZP03kPBwZqwrRS3vjkQ=;
  b=XRQFsFJ2k2TLF3Oe9f6+GpEir7XHD596/p0qzAMAWKE8YIRLze2TuSN+
   sa/DgwJIMpwt8RhXKNS2nPBKNt1XBOdLwyU1UQt/mgW6qWcQZrgnHhlD5
   31zmIYwv+F8f7yjC9RT8+H+GgaQNC0jgb+8Ptcnug6SLmM+H6Q637CKMi
   u4nOw05ZAqGXFYycmSntL1PqiNOt8DING27LxMmFvxpouHzA0HFvcbRL3
   8EJxI+K9ChmuyNFfeXFyCCq0gyqRDv3dNpBA0yS2NXe4To/DsW1YP7A2F
   +wvKMUcKqx9DSU0KWoNR2IffCt1LNBZ788/T2CMtvTRUZwPbnes3Cc2VC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="339488727"
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="339488727"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 02:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="668788926"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2022 02:32:28 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxQ8x-000AaZ-JB;
	Sat, 04 Jun 2022 09:32:27 +0000
Date: Sat, 04 Jun 2022 17:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 884853b567cddfcde3cee78d3112b4177a20907b
Message-ID: <629b268b.ROcjf6CgCQV62k4V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220604_023307_726506_A5952B70 
X-CRM114-Status: UNSURE (   5.05  )
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
branch HEAD: 884853b567cddfcde3cee78d3112b4177a20907b  ath10k: reset pointer after memory free to avoid potential use-after-free

elapsed time: 1540m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
i386                          randconfig-c001
powerpc64                           defconfig
mips                      loongson3_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                           ip32_defconfig
arc                          axs101_defconfig
nios2                               defconfig
arm                          gemini_defconfig
arm                         vf610m4_defconfig
arm                           viper_defconfig
sh                        dreamcast_defconfig
powerpc                     mpc83xx_defconfig
s390                             allmodconfig
m68k                         apollo_defconfig
powerpc                     ep8248e_defconfig
sh                           se7780_defconfig
sh                          kfr2r09_defconfig
arm                        multi_v7_defconfig
arc                              alldefconfig
xtensa                    smp_lx200_defconfig
sh                           sh2007_defconfig
powerpc                       maple_defconfig
arm                        trizeps4_defconfig
m68k                            q40_defconfig
arm                           u8500_defconfig
sh                   rts7751r2dplus_defconfig
mips                         mpc30x_defconfig
openrisc                 simple_smp_defconfig
sh                              ul2_defconfig
arm                        keystone_defconfig
arm                       imx_v6_v7_defconfig
sh                     magicpanelr2_defconfig
ia64                                defconfig
arm                        cerfcube_defconfig
xtensa                    xip_kc705_defconfig
arc                    vdk_hs38_smp_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220603
arm                  randconfig-c002-20220531
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
powerpc                          allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
um                             i386_defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
i386                          randconfig-a012
arc                  randconfig-r043-20220531
riscv                randconfig-r042-20220531
s390                 randconfig-r044-20220531
arc                  randconfig-r043-20220601
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func

clang tested configs:
powerpc              randconfig-c003-20220603
x86_64                        randconfig-c007
riscv                randconfig-c006-20220603
i386                          randconfig-c001
s390                 randconfig-c005-20220603
mips                 randconfig-c004-20220603
arm                  randconfig-c002-20220603
powerpc                 mpc8313_rdb_defconfig
arm                         shannon_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220603
s390                 randconfig-r044-20220603
riscv                randconfig-r042-20220603
hexagon              randconfig-r041-20220603
i386                          randconfig-a011
hexagon              randconfig-r041-20220531
hexagon              randconfig-r045-20220531
hexagon              randconfig-r041-20220601
hexagon              randconfig-r045-20220601
riscv                randconfig-r042-20220601
s390                 randconfig-r044-20220601

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
