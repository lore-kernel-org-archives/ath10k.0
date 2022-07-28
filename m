Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C43C04A68
	for <ath10k@archiver.kernel.org>; Thu, 28 Jul 2022 20:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grQ00KkGZ4vZjPyD+Tnaay17JO5IYJp+KMKkSd9iijI=; b=xmjeQSxxetZKri
	YElS+GUMrxmALZTlEHGZo8n09oS28M+aJsdMJOVMd7za4mHQT6LdwTxfb0h2uJJS5S0RRrGCMz6Za
	2IwLa1Dnl8QAHj38ZKP9QYzZpFDK8DXViIwZoeBIm9ECzHDBWX0jHHbgK6cu0dfLzFzmAmvbQKd/x
	5pas3nZcWd5fBdSJKSRq3HGzga7kFE9sGaN65RHNWrd/mbIy1kOz7++K6HnZ162YvM+C/dD78dc/I
	XRSMxUSvsw+7pAJc6UsleN9wmJsqCa3ZePegKPuURLINDQ68tX21kjLv7yyLHfmKBMi4DKW2dT27x
	uczZm9LUqwrheEXSUnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHASK-00EYO0-PA; Thu, 28 Jul 2022 20:50:04 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHASF-00EYMk-Ns
	for ath10k@lists.infradead.org; Thu, 28 Jul 2022 20:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659041399; x=1690577399;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HewXbgbsEHNDgzxgQh1xE95AeYW9Pd0z2oqygdctvys=;
  b=jfxtan/hjU1X+2ZcHGFUo4ebXXx34AfUqr7m/eKbeE0pCWjztZwKACVU
   6pltUp2QWbQa3s3A0pt+Tcr0K8mppEZveRmeEcNKbOYbR9g7js837YecO
   lCHBPSno766C3jOkAFLhHMx6En52R84XHtzVRa+cSCd7vxctBx03NFvXl
   Eb57DrCZjyv+29lLDC578fhWnUwk7m1fJZZPWmKFNrlau3kKedUI8G0Gk
   SIgHYTvw/jm46cnanjVFjRX9q2AbZUFNUabJPdhHpTqgl2/krmQKIQG+2
   BZD0vR7qZOV1m2SNqwsbncBUVqzp5kp8NNNt8DdBHeE379i/y2+/deru3
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="286164513"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="286164513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 13:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="576650329"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 13:49:43 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHARz-000AZX-0k;
	Thu, 28 Jul 2022 20:49:43 +0000
Date: Fri, 29 Jul 2022 04:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 ef7197996efe871c1d0cf1a5e3908bffeb288e32
Message-ID: <62e2f641.PRDCMY6hY1K1znWS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_134959_883745_04C04F0F 
X-CRM114-Status: UNSURE (   5.64  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: ef7197996efe871c1d0cf1a5e3908bffeb288e32  Merge ath-next into ath12k-bringup

elapsed time: 722m

configs tested: 101
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a001
arm64                            allyesconfig
i386                          randconfig-a003
x86_64                        randconfig-a013
powerpc                           allnoconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a006
arm                              allyesconfig
i386                          randconfig-a014
arc                  randconfig-r043-20220728
i386                          randconfig-a005
powerpc                          allmodconfig
i386                          randconfig-a012
riscv                randconfig-r042-20220728
s390                 randconfig-r044-20220728
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
i386                          randconfig-a016
sh                               allmodconfig
x86_64                        randconfig-a002
mips                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
powerpc                         ps3_defconfig
arm                        mvebu_v7_defconfig
arm                         vf610m4_defconfig
xtensa                       common_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                    amigaone_defconfig
sh                          landisk_defconfig
ia64                        generic_defconfig
arc                            hsdk_defconfig
xtensa                           allyesconfig
arm                           u8500_defconfig
powerpc                 linkstation_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arc                           tb10x_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5475evb_defconfig
powerpc                      pasemi_defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
mips                           ip32_defconfig
sh                 kfr2r09-romimage_defconfig
sh                     sh7710voipgw_defconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
arm                          lpd270_defconfig

clang tested configs:
hexagon              randconfig-r045-20220728
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r041-20220728
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a014
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
powerpc                    mvme5100_defconfig
powerpc                      pmac32_defconfig
arm                        spear3xx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig
arm                       imx_v4_v5_defconfig
arm                       versatile_defconfig
powerpc                      obs600_defconfig
x86_64                        randconfig-k001
powerpc                 mpc836x_mds_defconfig
riscv                             allnoconfig
arm                     davinci_all_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
