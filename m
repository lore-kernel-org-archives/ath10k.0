Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F60C5475B
	for <ath10k@archiver.kernel.org>; Thu,  7 Mar 2024 00:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8OFWnNeNG3syeC/iwKg1TTAnggItuTFGftycgfKc7k=; b=nFotSlGyUa1a+P10c01QydRT3v
	YvCB8CWK08deKioELuQK1ktKq19dK2My3BTQpvc+m4lIwc28FATT4ITmdgmwZr4yks+nnL9lujkYx
	hr7kG2ST7LjnMXmQk1YiuidYLd8s2DE8/hr3uxJpV/FWQX32uldLxIorJQrL6fn1LQNejFUvLcM14
	yYzFm1btjcB/KGjcn0gK467E/VQyLesR9OH8Qzife2CGloz9K/qMkdMvIrZFNCh6i0gqt0leU6CiW
	zWaH2BM7Zd+0GtNCu+m6tYm/2n8PzTuqhZHbna3N0WCjYytqpxpcm2151Id+AtyeHpmH3SbIQbHGl
	SD/GXcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri242-00000002SEx-2J0w;
	Thu, 07 Mar 2024 00:56:50 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri23z-00000002SDn-1Adh
	for ath10k@lists.infradead.org;
	Thu, 07 Mar 2024 00:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709773007; x=1741309007;
  h=date:from:to:cc:subject:message-id;
  bh=xxqnBXWV6pLLPtwtdvfCaotzrEDNLiry/YBO//O8+IU=;
  b=Dw8oyg5dnJ+M+aJ/M7U5oD6+VVdRiCEwZH5v6SjrNs5Wp9WSNfqI1nf+
   BnLW6c/dWcMSUgrV0z0s/p+ADTpw6hK4DLGGU3LgMEXgW1NZ3lTD7KCvb
   WlITJw3F7SUb42alfvOguHs/HbpnHHxuvjEjFxQqztMJxcDhm2F/9ccTS
   n30rO4VBIZqicOIZQ51wYiCmrPQDR5Elip6zIdz7KmpnDgcNNUk18/iF7
   istUbAuAyPeX7lDVxg1zF302mWR5qwzkQqXGfElgwK75BHvvbVI91lW3Z
   ujMxxlK8o75emCVDryxZ3EHLtNpk080LlQHnBd0FBMGngNhHmwbXk9cgn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4290079"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4290079"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 16:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9827122"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Mar 2024 16:56:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri23o-0004fF-1C;
	Thu, 07 Mar 2024 00:56:36 +0000
Date: Thu, 07 Mar 2024 08:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 ffd4e60352172cc167ff74e8bfd8a331a5830013
Message-ID: <202403070854.WwzQdCPJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_165647_362701_F73CDCDA 
X-CRM114-Status: UNSURE (   4.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: ffd4e60352172cc167ff74e8bfd8a331a5830013  Add localversion-wireless-testing-ath

elapsed time: 1155m

configs tested: 120
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
arc                   randconfig-001-20240307   gcc  
arc                   randconfig-002-20240307   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240307   clang
arm                   randconfig-002-20240307   gcc  
arm                   randconfig-003-20240307   gcc  
arm                   randconfig-004-20240307   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240307   gcc  
arm64                 randconfig-002-20240307   gcc  
arm64                 randconfig-003-20240307   gcc  
arm64                 randconfig-004-20240307   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240307   gcc  
csky                  randconfig-002-20240307   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240307   clang
hexagon               randconfig-002-20240307   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240307   gcc  
loongarch             randconfig-002-20240307   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240307   gcc  
nios2                 randconfig-002-20240307   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240307   gcc  
parisc                randconfig-002-20240307   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240307   gcc  
powerpc               randconfig-002-20240307   gcc  
powerpc               randconfig-003-20240307   gcc  
powerpc64             randconfig-001-20240307   gcc  
powerpc64             randconfig-002-20240307   gcc  
powerpc64             randconfig-003-20240307   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240307   clang
riscv                 randconfig-002-20240307   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240307   clang
s390                  randconfig-002-20240307   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240307   gcc  
sh                    randconfig-002-20240307   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240307   gcc  
sparc64               randconfig-002-20240307   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240307   gcc  
um                    randconfig-002-20240307   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240307   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

