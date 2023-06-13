Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49911EB64D7
	for <ath10k@archiver.kernel.org>; Tue, 13 Jun 2023 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TDKkSV7AOod3w1oUZKrDDuej+kA1io/UK3ofGGursRE=; b=fW/IFBu1EN7jSD
	O65LKQW8U3csqB+AOWU+m3QJFUvt6/mic5u0Jq3fWmk7UiFEsTs0zVhUpPq4IrCXGJ+r0SZTnQz46
	K4zaoRjZ6lJm96WHyXIUjgxRDnaBra6wGeUEj2QjuRwnEPBcqNGFbowhi00o3ZAIA7IyxPvqPFvqs
	RnTHIcbjN98/iFQUJtTwo2v5U4o3I6Ytnxit8kzqIgZCAU8HhFGdD1mLyBU3/lnjuHv1caHdn86Sr
	Cql+UjSIso2GkP4MCYrmQdul/NLrTuTRA+FZTPQOTZbQbnRkHHf1gxnfJw4T8sYt6+9r5s2n4wAV+
	YuidBVlQgHkZzd8tHmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BY2-009DXQ-3C;
	Tue, 13 Jun 2023 21:27:30 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BXx-009DVt-0T
	for ath10k@lists.infradead.org;
	Tue, 13 Jun 2023 21:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686691645; x=1718227645;
  h=date:from:to:cc:subject:message-id;
  bh=Rys58yDSrb7t0UWS+XZJzlBFysEp7ZxsTad8boctCEc=;
  b=kbvsuAN148CMqaI6yy4QMg2LKGpTkeg0BWdsUFHxz2j0zyTlcQJWfYTn
   vwbKWK8YocFiu1aBpR5rgFi1j/b726C5AWXS7wWyJkDTRQi4VW5SomA9j
   9k3UBjI4I7CMqykMIJWq8Si98OnTWU0VQTwYSAkoM676mOK3G4XW8l4lC
   FCXrnXKMJtCQFAwBvT8G5fOeisEa4sJkd+g41ocTiW9EgUzDfweWgW8Lw
   0UxC6KKJ93LBhr8AoDMgKNbzpw1JEspwB1+276zndlxVfUN0gJyDKQZia
   c6cBNLVNbtXZ/XEsM27QUaZ5s+SbNI4tgOuvSeRjpW9iXKbRySmNT+qGR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355954967"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="355954967"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 14:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="836039949"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="836039949"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Jun 2023 14:27:23 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9BXu-0001n5-1g;
	Tue, 13 Jun 2023 21:27:22 +0000
Date: Wed, 14 Jun 2023 05:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c60d15f389ef9832a8da410e438d81b10327751f
Message-ID: <202306140503.mDFXm4aW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_142725_192960_F1519D3C 
X-CRM114-Status: UNSURE (   5.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: c60d15f389ef9832a8da410e438d81b10327751f  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 99
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230612   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230612   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230612   gcc  
arc                  randconfig-r025-20230612   gcc  
arc                  randconfig-r034-20230612   gcc  
arc                  randconfig-r043-20230613   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230613   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230612   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230613   clang
hexagon              randconfig-r045-20230613   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230612   clang
i386                 randconfig-i002-20230612   clang
i386                 randconfig-i003-20230612   clang
i386                 randconfig-i004-20230612   clang
i386                 randconfig-i005-20230612   clang
i386                 randconfig-i006-20230612   clang
i386                 randconfig-i011-20230613   clang
i386                 randconfig-i012-20230613   clang
i386                 randconfig-i013-20230613   clang
i386                 randconfig-i014-20230613   clang
i386                 randconfig-i015-20230613   clang
i386                 randconfig-i016-20230613   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230612   gcc  
microblaze           randconfig-r004-20230612   gcc  
microblaze           randconfig-r024-20230612   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230612   gcc  
nios2        buildonly-randconfig-r004-20230612   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230612   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r001-20230612   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230612   gcc  
parisc               randconfig-r036-20230612   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r026-20230612   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230612   clang
riscv                randconfig-r006-20230612   clang
riscv                randconfig-r042-20230613   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230613   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230612   gcc  
sh                   randconfig-r035-20230612   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230612   gcc  
sparc64              randconfig-r031-20230612   gcc  
sparc64              randconfig-r032-20230612   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230613   gcc  
x86_64               randconfig-a002-20230613   gcc  
x86_64               randconfig-a003-20230613   gcc  
x86_64               randconfig-a004-20230613   gcc  
x86_64               randconfig-a005-20230613   gcc  
x86_64               randconfig-a006-20230613   gcc  
x86_64               randconfig-a011-20230612   gcc  
x86_64               randconfig-a012-20230612   gcc  
x86_64               randconfig-a013-20230612   gcc  
x86_64               randconfig-a014-20230612   gcc  
x86_64               randconfig-a015-20230612   gcc  
x86_64               randconfig-a016-20230612   gcc  
x86_64               randconfig-r021-20230612   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
