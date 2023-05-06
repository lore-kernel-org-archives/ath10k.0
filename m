Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0925CC77B7C
	for <ath10k@archiver.kernel.org>; Sat,  6 May 2023 02:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aw4mXIEbBF+HxDiEQZmx91HryfiA3gwaF9bVPWcwAE8=; b=0uTEAZYvaIjA97
	cLkb8OWmJT+obF7bBLd3ABKMBSNu6CZTazs6Kc40FbPgioIjvjwhvVdoTQgQh+xnNoqjSAv+tmVVW
	Ul6njElNfbmP9513jrV1C5U7krYL0LZqPf5crlUgWHBfizD5jxh8bQ/BRL7KFs968AFzIYxQZl0NW
	OxUV+veKpsZWKM3wMcmSUkUdNcbrsBXO3vks3iThSgq2Zr/zJymrUWC30h4531zBUQVpJWayZ4BWv
	XF09iymdYPxJR9uzDcZI2AKtJmrE09GxNwCw3jBs/MXBYVbNJXcrHF4RRNyJMWmWguV7+LrqusHee
	EDP8T/OHEvQlKwkS4nZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv84P-00COVI-21;
	Sat, 06 May 2023 02:54:49 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv84M-00COUs-1S
	for ath10k@lists.infradead.org;
	Sat, 06 May 2023 02:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683341686; x=1714877686;
  h=date:from:to:cc:subject:message-id;
  bh=Jn5pb3GE6SP7U6rX+g2oPPUkVYNIOEUkKBC8QnLmEYU=;
  b=nPPKOkHmbno2WecxKlsDje13nDgCNBXCuRQWWlkrYWN4JOuZPoLQ/57L
   79i5jZbUmv51D7+wjSnTbnW8YjGkEqnQOxNXs37AfartUmDfRKDC1j+XF
   oEbVIIrAeW5GVKH/GIgEOTzv5fngoG6uvaAvEZltWvT63o7YiEsPfflqc
   9d3SZLR338SiAaLOWarXVAJ+sYQ8zI6M8Z+arFFTZi28wkGaAyKkrWmaQ
   n7XJ33K7zPliKSqhY/nrypfixLg22PIjj4DY0VGSRqE+7Yg3wIfCAhfU4
   /sf80PeRZ2mg9P4q5Al+wHb4/yclJbRFQ07B+ug8+qt0znPm2FNgKXDWK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377418101"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="377418101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 19:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="872108028"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="872108028"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 May 2023 19:54:35 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv84B-00015n-0P;
	Sat, 06 May 2023 02:54:35 +0000
Date: Sat, 06 May 2023 10:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 92729abf7d3655496fefccc826f29e78afda28d6
Message-ID: <20230506025421.taTGW%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_195446_501047_49B4F4E9 
X-CRM114-Status: UNSURE (   5.26  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 92729abf7d3655496fefccc826f29e78afda28d6  wifi: ath11k: Send HT fixed rate in WMI peer fixed param

elapsed time: 802m

configs tested: 150
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230505   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230504   gcc  
alpha                randconfig-r014-20230503   gcc  
alpha                randconfig-r015-20230505   gcc  
alpha                randconfig-r036-20230501   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230430   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230504   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230505   gcc  
arm                  randconfig-r025-20230430   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230505   gcc  
arm64                randconfig-r004-20230504   clang
arm64                randconfig-r011-20230505   clang
arm64                randconfig-r024-20230430   clang
csky         buildonly-randconfig-r002-20230430   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230505   gcc  
csky                 randconfig-r021-20230505   gcc  
hexagon      buildonly-randconfig-r005-20230430   clang
hexagon              randconfig-r002-20230504   clang
hexagon              randconfig-r005-20230504   clang
hexagon              randconfig-r026-20230430   clang
hexagon              randconfig-r031-20230501   clang
hexagon              randconfig-r034-20230502   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230501   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r004-20230505   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230505   gcc  
ia64                 randconfig-r012-20230505   gcc  
ia64                 randconfig-r022-20230501   gcc  
ia64                 randconfig-r036-20230502   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230430   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230505   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r022-20230505   gcc  
m68k                 randconfig-r026-20230505   gcc  
m68k                 randconfig-r034-20230430   gcc  
microblaze   buildonly-randconfig-r001-20230501   gcc  
microblaze   buildonly-randconfig-r006-20230430   gcc  
microblaze           randconfig-r025-20230505   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230505   gcc  
mips                 randconfig-r024-20230501   gcc  
mips                 randconfig-r035-20230502   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230501   gcc  
openrisc             randconfig-r012-20230503   gcc  
openrisc             randconfig-r022-20230430   gcc  
openrisc             randconfig-r035-20230430   gcc  
openrisc             randconfig-r036-20230430   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230430   gcc  
parisc               randconfig-r031-20230502   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230505   clang
powerpc              randconfig-r001-20230505   gcc  
powerpc              randconfig-r006-20230505   gcc  
powerpc              randconfig-r033-20230501   gcc  
powerpc              randconfig-r035-20230501   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230430   clang
riscv        buildonly-randconfig-r003-20230501   clang
riscv        buildonly-randconfig-r004-20230430   clang
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230505   clang
riscv                randconfig-r021-20230501   clang
riscv                randconfig-r025-20230501   clang
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230501   clang
s390                                defconfig   gcc  
s390                 randconfig-r003-20230505   gcc  
s390                 randconfig-r016-20230503   clang
s390                 randconfig-r032-20230430   gcc  
s390                 randconfig-r033-20230502   clang
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230505   gcc  
sh                   randconfig-r023-20230430   gcc  
sh                   randconfig-r032-20230502   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230503   gcc  
sparc                randconfig-r023-20230501   gcc  
sparc64              randconfig-r033-20230430   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230501   clang
x86_64               randconfig-a012-20230501   clang
x86_64               randconfig-a013-20230501   clang
x86_64               randconfig-a014-20230501   clang
x86_64               randconfig-a015-20230501   clang
x86_64               randconfig-a016-20230501   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230505   gcc  
xtensa               randconfig-r006-20230504   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
