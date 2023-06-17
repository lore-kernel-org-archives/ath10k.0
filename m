Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720BDEB64DB
	for <ath10k@archiver.kernel.org>; Sat, 17 Jun 2023 05:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LhNgFm+TBgr4Hdhysb+raipNinR/2yGBlY9rrk+IV4Y=; b=PzQt35nYp2Pf8C
	94Be1GsRuz7n0WJyCzCdwxFR30m+TlzzzyqYGMu1wbiy9iT8ytEhLQxHdQ1hxcXweQZys1RM7oNzD
	LEpce3gUvf9zm7dglkJrBLfIh2JM4jRogQV9T55uQpscoJr/DFa7OFCBzFytP2AkzHMmAPsKzYCZQ
	SMHhYJIgwCELxo0xJ6jbfLK4d0/ID7B76h52LQ1Gkdn4KKqMht2rjquiWqQp2NGGPhuI0nFgurGUA
	eAtrB+AXo4INE1kGwcNeiN86xGIzE+Bc4beUmEl+hJILZmHL6Sud0YK5VWc4M4vpQwiVwLKOyyg0O
	hcMGlyPfIRZzcAGauqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAOGW-002lGN-2x;
	Sat, 17 Jun 2023 05:14:24 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAOGT-002lFM-0X
	for ath10k@lists.infradead.org;
	Sat, 17 Jun 2023 05:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686978861; x=1718514861;
  h=date:from:to:cc:subject:message-id;
  bh=mZIYaCPw8rvoKj4DIR1BISiId0W+2p67rCNcRA/5FXs=;
  b=Z5R/yEmPn+NVjR/CuS0aanLqvYbmK9PE5npzlBtS0mCV+iDrzxNoVeY+
   mrdaNsOiyGAjlf7M1bS6R4W4kmQzZPG5JDyqnVHiO0qG+BIgWLvQ/ygip
   TN6HrBPpZCTzkneshUjpUo3Ac7BFITevJaQuda2lbBmfbyUnPIqCR6swq
   MjSXg4HApI34+x3v2p0ND9Q4VBbzt1TRJy1jT8aXsNBJ1GBm3m2zhOxJ0
   WfMDN2CCn9jp9JQJbdPQiZKM4bUyUz0F2CIw+6+WMtyLAYzEzdMr/J4kf
   yjnr3Hd/44S1+eyF4bM01doBQxCG9yChuaRiLHimhDqTvdkJO4Jo0DcGq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="361897497"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="361897497"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 22:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="713103245"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="713103245"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jun 2023 22:14:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAOGO-0002Jh-0S;
	Sat, 17 Jun 2023 05:14:16 +0000
Date: Sat, 17 Jun 2023 13:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 9625e4e89cdd839f6bcd5805fed69957e2ace44e
Message-ID: <202306171313.dGFG5hEY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_221421_251630_0630FBEB 
X-CRM114-Status: UNSURE (   5.80  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 9625e4e89cdd839f6bcd5805fed69957e2ace44e  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 67
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230616   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230616   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230616   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230616   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230616   gcc  
hexagon              randconfig-r021-20230616   clang
hexagon              randconfig-r041-20230616   clang
hexagon              randconfig-r045-20230616   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r032-20230616   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230616   clang
mips                 randconfig-r031-20230616   gcc  
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230616   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r036-20230616   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230616   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230616   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230616   gcc  
sh                   randconfig-r004-20230616   gcc  
sh                   randconfig-r006-20230616   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230616   gcc  
sparc                randconfig-r022-20230616   gcc  
sparc64              randconfig-r035-20230616   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
