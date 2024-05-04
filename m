Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C05C25B4F
	for <ath10k@archiver.kernel.org>; Sat,  4 May 2024 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rfjVpeaPsaUCA+L22jypl2RBpB77K4IIsL8KrO8WU2g=; b=EOSPlJ4kPq+4XdnKLwYUdltHSg
	Yiv+R78gZzjxzzyU9zMHYpMgydcTXQfYMzbJ2hPgkOpuBNsTE4VOLSzyr1q9ALFjsL0W0YTeDaQFG
	kTvSR1dsexPx/c+mTYUaFMsk9hFjvBlRduDFUZyO1iJJu/gFe2vmGS9CTnZK/FSox6Ef6Ly8gu5cP
	3azjW9ASqu7s+SxfTWzqeZ3Z91FsdutLBqqAVyyx8UisLGXPFv8XR6is+/U2Bgtcod16lRdpT0yf/
	nRmfMkk5Vsc4V1Rztjbd+3vDvjSx5AKVbiFYkEErkIPZzi3LOObI35LdpiF+zHdcKeHJsbP1ssBU7
	5M0SxOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Fez-00000002AzO-0KHu;
	Sat, 04 May 2024 13:42:41 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Fev-00000002Ayn-3ZbR
	for ath10k@lists.infradead.org;
	Sat, 04 May 2024 13:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714830158; x=1746366158;
  h=date:from:to:cc:subject:message-id;
  bh=wOzWvV4yw7gQ8gKNG6kzuR+pqUQhR4DVxxh6nIv0+fg=;
  b=Z0worzsqJCYVMe+i3TS1i+WodCofVzLPf+Pg0u+BuFv4C7CVHGyFbFkj
   ZYtN3XQN4C5GlxAp+XDlzPzuQ68r/wiqhxSRzvPIfRsQp+0lFB1eJ1ScB
   xqT+L/ztgC4dmHnmXD7PyDY2VNkgYc9ihobDkcDHNYzAiqtb5ALcXeBhg
   uL5sSwSq1MPNa7BwNcveqdOlfMII4sqqxMZB11fmmVnp9KbDUPH3lfLqy
   LPSJJF1Z38k8/oqpWz773R2obD04Guj1sC6iOgkfjBbvLsh91MTGD1bRw
   sTHosbwfQrtAeHfq3VBDKj1SI641nrPNDjuyugF01Wv/DoRVhnh9QfLcw
   Q==;
X-CSE-ConnectionGUID: aq66bq3gR1uW6GvLEx7jig==
X-CSE-MsgGUID: 5Cr/fGCqQhm/APyJQvkAGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="22038868"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="22038868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 06:42:33 -0700
X-CSE-ConnectionGUID: FXVD7UMjRHOsI+x89ahMHQ==
X-CSE-MsgGUID: +Co5CCMQRqON+Cgkk+Xz1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32522154"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 06:42:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Fen-000Coa-2D;
	Sat, 04 May 2024 13:42:29 +0000
Date: Sat, 04 May 2024 21:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 50971dc6694c0845fcddfe337ea39c5b723d5a92
Message-ID: <202405042138.AI15Wq27-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_064237_938415_106D852E 
X-CRM114-Status: UNSURE (   3.58  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 50971dc6694c0845fcddfe337ea39c5b723d5a92  wifi: ath12k: drop failed transmitted frames from metric calculation.

elapsed time: 1449m

configs tested: 137
configs skipped: 4

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
arc                   randconfig-001-20240504   gcc  
arc                   randconfig-002-20240504   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240504   clang
arm                   randconfig-002-20240504   clang
arm                   randconfig-003-20240504   clang
arm                   randconfig-004-20240504   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240504   gcc  
arm64                 randconfig-002-20240504   gcc  
arm64                 randconfig-003-20240504   gcc  
arm64                 randconfig-004-20240504   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240504   gcc  
csky                  randconfig-002-20240504   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240504   clang
hexagon               randconfig-002-20240504   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240504   clang
i386         buildonly-randconfig-002-20240504   gcc  
i386         buildonly-randconfig-003-20240504   gcc  
i386         buildonly-randconfig-004-20240504   clang
i386         buildonly-randconfig-005-20240504   clang
i386         buildonly-randconfig-006-20240504   clang
i386                                defconfig   clang
i386                  randconfig-001-20240504   gcc  
i386                  randconfig-002-20240504   clang
i386                  randconfig-003-20240504   gcc  
i386                  randconfig-004-20240504   clang
i386                  randconfig-005-20240504   clang
i386                  randconfig-006-20240504   gcc  
i386                  randconfig-011-20240504   gcc  
i386                  randconfig-012-20240504   clang
i386                  randconfig-013-20240504   clang
i386                  randconfig-014-20240504   gcc  
i386                  randconfig-015-20240504   gcc  
i386                  randconfig-016-20240504   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240504   gcc  
loongarch             randconfig-002-20240504   gcc  
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
nios2                 randconfig-001-20240504   gcc  
nios2                 randconfig-002-20240504   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240504   gcc  
parisc                randconfig-002-20240504   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240504   gcc  
powerpc               randconfig-002-20240504   gcc  
powerpc               randconfig-003-20240504   gcc  
powerpc64             randconfig-001-20240504   clang
powerpc64             randconfig-002-20240504   clang
powerpc64             randconfig-003-20240504   clang
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240504   gcc  
riscv                 randconfig-002-20240504   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240504   clang
s390                  randconfig-002-20240504   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240504   gcc  
sh                    randconfig-002-20240504   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240504   gcc  
sparc64               randconfig-002-20240504   gcc  
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240504   gcc  
um                    randconfig-002-20240504   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240504   gcc  
x86_64       buildonly-randconfig-002-20240504   clang
x86_64       buildonly-randconfig-003-20240504   gcc  
x86_64       buildonly-randconfig-004-20240504   gcc  
x86_64       buildonly-randconfig-005-20240504   clang
x86_64       buildonly-randconfig-006-20240504   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240504   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240504   gcc  
xtensa                randconfig-002-20240504   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

