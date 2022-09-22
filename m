Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD2ECAAD8
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gDmi5F0gnSO4N6PcP50Vio+xvW2vCp5RoFJOOj1BSwk=; b=l+lc2iU2dr6qR5
	EvjPTBfsc1Ew3ciG/qxUCNbjgBBnhP/ltlJ7SonGPT06phEjxWjWYnkQLuAxV51y27zvuEer42FP/
	bCbruIi9K2o0jYXAYu5xfvMH/TKjE5UhIDvBw0sn3oXE0uSptePqgVWIStSKGXA+D4Qy48jxIPZuG
	mVN+tjLniZvFx5sFXVhK3X/qmkP0A7wypw0ft08cbojxPCSvCfT8L7BgsW1F6wTXZQE+/zOd+6jwR
	im35fYRfdlsWhyZRysesOWXpVLxJA2bTtGlV0d0IZ845iqp99V4JpxsasdC4wAgqXB/i5Tpsy0YlL
	/xQvepMwEqWOODAJD2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obT4B-0009bU-RK; Thu, 22 Sep 2022 20:45:03 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obT3u-0009Wt-2h
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 20:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663879486; x=1695415486;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bz7pRC0+QQu1tFNgbb+7L1oBmZ4/g34rWTsYCUM2IJQ=;
  b=D4tE4uECeJw+mgWscQooK3MArLpWefrr5GYJncYCp2CMF8GIg8kRUFog
   fVU8yh7WZrwE8ieLw2ahdvapXikuijO4EF8dthiPrwU/k4naP0EUHWFMt
   30u7PA9tYIjNOcpY/dyssx417SfwnauIPjVIwJi8kOsxPwGCDDtcpKBEJ
   a1FmcJzCA7D2vZnVZE0aUVo8vtl2wAODeX6piL5ku/vwoqNlHqDKOKgvL
   LCJrZE8jV+hZUqtcxmfRT/lHBVrEK+gZevJFpII6MO8Nz3tw1zxW5CNvp
   bpZa8njpF5L2QKBPZ13ZGKmCTznEZNhfCsBr69MabBWSzW9HvSyO1SF3t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="299149892"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="299149892"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 13:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597601409"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 13:44:41 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obT3o-0004wq-1v;
	Thu, 22 Sep 2022 20:44:40 +0000
Date: Fri, 23 Sep 2022 04:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 4e98937a115ce8b27931dafe3c26cdcaacd4c5c5
Message-ID: <632cc904.FNh54UuXMkqu9l52%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_134446_161708_AB41D90C 
X-CRM114-Status: UNSURE (   5.40  )
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
branch HEAD: 4e98937a115ce8b27931dafe3c26cdcaacd4c5c5  wifi: ath11k: Add spectral scan support for 160 MHz

elapsed time: 722m

configs tested: 88
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220922
s390                             allmodconfig
s390                                defconfig
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a004
s390                             allyesconfig
x86_64                        randconfig-a006
x86_64                               rhel-8.3
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                                defconfig
m68k                             allmodconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sparc                               defconfig
loongarch                        alldefconfig
m68k                        stmark2_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
sparc                       sparc32_defconfig
sh                           se7721_defconfig
m68k                          atari_defconfig
mips                             allmodconfig
xtensa                       common_defconfig
i386                          randconfig-c001
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                 mpc837x_mds_defconfig
xtensa                          iss_defconfig
nios2                            alldefconfig
m68k                            mac_defconfig
sh                        edosk7705_defconfig
xtensa                    smp_lx200_defconfig
csky                             alldefconfig
sh                           se7705_defconfig
powerpc                      tqm8xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
powerpc                      ppc64e_defconfig
arm                          ep93xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
