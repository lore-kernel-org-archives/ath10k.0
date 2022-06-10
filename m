Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75963C433EF
	for <ath10k@archiver.kernel.org>; Fri, 10 Jun 2022 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QOf2tM5u4LjdWQp8INQMQGc9FMrv5rOP4yyizoEfeso=; b=hS4c8ZkpRtVF+t
	DSrDKMu3276W3pjr8oMBK7+4Ky1a1Tyfxc92pD8n1VXBL1NK4x27CyDzeWlb8ej0Ghn7/hyCUCEJB
	Y9PC481n5WPEkxtERmZq1ph/SpKbYVJwTEfuK1C/YGJasS0GYu4uWnwImpyo1VhVb9X19GDlTjyFP
	UFh+u/L7ICeowLMxRRL02NztZ6zOXzY2cO0RmP6Ri2D0LyJhSWmA6EfiMh8fSfZqog2STWqEkv3lA
	AptyWrJJviIClEn+A1JGODqNJeOQp5qRMcU5aqNCxoHuYAg2u7sLxiYJVFlwvX+dRKbGH4ZqCIZf9
	ICBdDANb/KLBLV4eo9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzoTz-00AYKe-Aw; Fri, 10 Jun 2022 23:56:03 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzoTw-00AYJc-Gi
	for ath10k@lists.infradead.org; Fri, 10 Jun 2022 23:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654905360; x=1686441360;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=faalZKSwDQTYcy5gSi4OD/BLfa4dVm+dN/BgxZmKsPc=;
  b=CnIHZ8GFAuXgFnvuGJ1fo4d/PaGc+U6lwP8STIcwmHBwRwK+l0RapQGA
   FcTYNPsflcnsBit2ObSkwSn6IOlTUocDXg2DRyJt5Krx/h+3wLVRPdJ2H
   1n/WiGhjXzWKp6zeQGlga4VSby3v/vAJ/pkFnZ0MKIbYYqoL4rpw4nhvq
   TMMnilaTCfcuMKcuV4uCdRhaX3IS9L2tuI12OUOsAAgsYVRGeIzR5u66S
   7AZhPquI5W/7MJMyKEAxgql3lsXbxBA5d9+fwVB3ki7Uo8RJAqc1R8mtJ
   sIlljHKeAymvm7HiM5JHqEg3qyBXXOvoyF0s9ubkvzBQGkyimu2fINXx0
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="258217674"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="258217674"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="684832050"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 16:55:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzoTs-000INp-4z;
	Fri, 10 Jun 2022 23:55:56 +0000
Date: Sat, 11 Jun 2022 07:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4b67123d1c0dec98842edf48f96b4029ad7842ed
Message-ID: <62a3d9f2.WumOsBvVbTMDlJsY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_165600_637079_B02E45A5 
X-CRM114-Status: UNSURE (   5.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 4b67123d1c0dec98842edf48f96b4029ad7842ed  Merge branch 'pending' into master-pending

elapsed time: 3777m

configs tested: 93
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
nios2                               defconfig
m68k                          sun3x_defconfig
powerpc                 mpc8540_ads_defconfig
arc                      axs103_smp_defconfig
arm                       imx_v6_v7_defconfig
arm                         s3c6400_defconfig
arm                             ezx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220609
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
parisc                              defconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig

clang tested configs:
arm                  colibri_pxa300_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        workpad_defconfig
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220609
s390                 randconfig-r044-20220609
riscv                randconfig-r042-20220609
hexagon              randconfig-r041-20220609
hexagon              randconfig-r045-20220608
hexagon              randconfig-r041-20220608

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
