Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21A5CD1292
	for <ath10k@archiver.kernel.org>; Sat,  6 Apr 2024 06:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTrR9r4jCw1aAoyaxgTzevngftL407m9JmPYF0CjNrU=; b=4s6wTl6KBSu//Fp8tP/VUfs83Q
	zei2qC4JMP/kRVQfbVMuOcVVG6zLtgpUtE6UJWWxH/cpmEdrXvobPSHOICoq+w8y6kKjHwdaqPJJX
	ysZePllu0FfG776xElN68M61unQN1uLAuwuE1ASEdLIEXtvrNv0ucqRS+agQn9feKSmPzNvHqDK3F
	UZxq9FFEQ5/UNzWc/uoMeH+l6GnnUYkEzrPI7l9ESm4De33zFlzW0oHSvNh654bvWtfHtP7K1loTd
	T0GGJE+GtgQRjdYwUZTGz99LMI0mUpoUMiwjn6bmCVearfQuTRNs/upYxj509yX/XAp/bp2x0eWQ2
	xkKbe67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rszFB-00000009lv4-0U8r;
	Sat, 06 Apr 2024 06:09:37 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rszF7-00000009lu6-2rjs
	for ath10k@lists.infradead.org;
	Sat, 06 Apr 2024 06:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712383774; x=1743919774;
  h=date:from:to:cc:subject:message-id;
  bh=Cp+j2JrRIVxuAaPHJEDM9ys0qjLIFfGlMwlWr36Tb2U=;
  b=R4UZlhkADA6/tKSFBua9yrn8Hoj9/iPpw6O5eDZ/0kiQUiFFCPcHOOI4
   TxApo8LKHC4ol3TCa3Dbnj+26ie+vqXn71Odnb5Idje2nYqFLQ1RJ2NOq
   9zOn8UrBCPzoos3h0omn25rSOusccSelMFiX1dmrvG7vuFSVF3jiFJu+A
   C8Ym9whZa4FozATVunBnQyy0qOMoEP4lDcskUIBpN0WDgU2gsN/JyxrVu
   QxbO3kY2DbNrm8et8EAY9pyKAOkKUR4ANcn0m/ZHmIS8rhYtwXr+RtvDb
   4NgxPxIZMO2QKhQ834wS23BxaGL5sApK9QHRQ6GwhZjgCl9OsASN+PeHJ
   A==;
X-CSE-ConnectionGUID: jQOifphES1Oj2AP2O3IqDQ==
X-CSE-MsgGUID: HWFVS6OTQnK43RIQsVP2wA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18339728"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="18339728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 23:09:21 -0700
X-CSE-ConnectionGUID: 7v694l/ZRIyRXTLvEYZ1AA==
X-CSE-MsgGUID: I+utOkw1RwCp6lWunvu5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="42545608"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Apr 2024 23:09:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rszEs-0003BU-0c;
	Sat, 06 Apr 2024 06:09:18 +0000
Date: Sat, 06 Apr 2024 14:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 9f6e5447f5eb847075a8e64249e57d478bb824aa
Message-ID: <202404061415.kMYp2pZy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_230933_864698_D781FB5D 
X-CRM114-Status: UNSURE (   3.11  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 9f6e5447f5eb847075a8e64249e57d478bb824aa  Merge branch 'ath-next' into ath-qca

elapsed time: 1058m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v5_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240406   clang
i386         buildonly-randconfig-002-20240406   clang
i386         buildonly-randconfig-003-20240406   gcc  
i386         buildonly-randconfig-004-20240406   clang
i386         buildonly-randconfig-005-20240406   gcc  
i386         buildonly-randconfig-006-20240406   clang
i386                                defconfig   clang
i386                  randconfig-001-20240406   clang
i386                  randconfig-002-20240406   gcc  
i386                  randconfig-003-20240406   clang
i386                  randconfig-004-20240406   clang
i386                  randconfig-005-20240406   clang
i386                  randconfig-006-20240406   gcc  
i386                  randconfig-011-20240406   clang
i386                  randconfig-012-20240406   clang
i386                  randconfig-013-20240406   clang
i386                  randconfig-014-20240406   gcc  
i386                  randconfig-015-20240406   clang
i386                  randconfig-016-20240406   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240406   clang
x86_64       buildonly-randconfig-002-20240406   gcc  
x86_64       buildonly-randconfig-003-20240406   clang
x86_64       buildonly-randconfig-004-20240406   gcc  
x86_64       buildonly-randconfig-005-20240406   gcc  
x86_64       buildonly-randconfig-006-20240406   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240406   gcc  
x86_64                randconfig-002-20240406   clang
x86_64                randconfig-003-20240406   gcc  
x86_64                randconfig-004-20240406   clang
x86_64                randconfig-005-20240406   clang
x86_64                randconfig-006-20240406   clang
x86_64                randconfig-011-20240406   gcc  
x86_64                randconfig-012-20240406   clang
x86_64                randconfig-013-20240406   clang
x86_64                randconfig-014-20240406   gcc  
x86_64                randconfig-015-20240406   gcc  
x86_64                randconfig-016-20240406   clang
x86_64                randconfig-071-20240406   clang
x86_64                randconfig-072-20240406   clang
x86_64                randconfig-073-20240406   clang
x86_64                randconfig-074-20240406   clang
x86_64                randconfig-075-20240406   clang
x86_64                randconfig-076-20240406   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

