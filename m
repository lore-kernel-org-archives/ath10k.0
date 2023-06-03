Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520A2C7EE29
	for <ath10k@archiver.kernel.org>; Sat,  3 Jun 2023 05:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evV0zMLQv/t/5g3qkAXQD5B8tR8WhLQgpJ1hl3To+UU=; b=clzkJvlMWSXNJ4
	8BXMt2e3mmquw6SAxFVjmE8EcRDt7EUFwoMLpJTEw+H4iWdFlGLwbIYlnPNOXrJQmeVoNYMICiUdc
	9l93siNWPuLtQyYQFAlUVAyRQamr5Yf7irGZUe5Rvjx5B1ubl75Ibn6nLMjhIE5sVdI64J8odMbDL
	eozP+2zMtzb8892D+SSAchhTD3Qp9ZcwtqMAMmnBzjnXUfXXuHPBhlztfB+XN+MLBKgKkNIiKMQAK
	Boja75+nkwnHcKEU9coP04ca1vg9shngJHFy2/eVmH6daOs60r9DbW1AAEZo+6gH4O6oqy2Q+vALa
	k6WLfbdbfQZomk83teBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5JUB-008okc-2C;
	Sat, 03 Jun 2023 05:07:31 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5JU8-008oje-2Q
	for ath10k@lists.infradead.org;
	Sat, 03 Jun 2023 05:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685768848; x=1717304848;
  h=date:from:to:cc:subject:message-id;
  bh=ExO+8N5Np6stma3Wroku+/BNXCjn26kbP0HsTnzqceQ=;
  b=Sq4aaHdTt3D40E+u/vw3z/kfZBj4FVWt44PhcIZBh3clUGnZZJAdsTz5
   sHg47yNIVnjXePJ2NyleQxFB6RBNKIOEpzm0591Jg6NJqfDi/MGwob1Z8
   Huyq9LC1VEzfyyEJ5UXAgmavMdw2HHjHzVplbN7ebyx+PysSYl+BpmXE7
   W6poDTkHKXWtODgTuLSLg4OZB7Ue5Jsys4q9JBp8/R3oYHkM1jFmJiO7J
   li5pWpwrYuD1Yx92CuzAPmnKI4P4sll+pi6USuschXc5qcHQ/aByg5jd9
   ZBCL/qkAu1FsHgfeEMEHjPTkLz+ZDiD5fAZ+hCzhLlZPKCaTGZUo8TY80
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442411260"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="442411260"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 22:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658486680"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="658486680"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 22:07:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5JTy-0001JG-1l;
	Sat, 03 Jun 2023 05:07:18 +0000
Date: Sat, 03 Jun 2023 13:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 7108b456145fc0b1ae74c5f7fa8bd9ac20dc4f3c
Message-ID: <20230603050644.XhJUX%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_220728_805191_5C2D798C 
X-CRM114-Status: UNSURE (   4.80  )
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
branch HEAD: 7108b456145fc0b1ae74c5f7fa8bd9ac20dc4f3c  wifi: ath11k: update proper pdev/vdev id for testmode command

elapsed time: 724m

configs tested: 114
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r033-20230602   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230602   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r022-20230531   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                  randconfig-r003-20230602   clang
arm                  randconfig-r046-20230531   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230602   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230531   clang
arm64                randconfig-r025-20230531   clang
arm64                randconfig-r026-20230531   clang
arm64                randconfig-r031-20230602   gcc  
arm64                randconfig-r036-20230602   gcc  
csky         buildonly-randconfig-r004-20230602   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-r004-20230602   gcc  
i386                 randconfig-r035-20230602   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                 randconfig-r021-20230531   gcc  
m68k                 randconfig-r034-20230602   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                            gpr_defconfig   gcc  
mips                          malta_defconfig   clang
mips                        maltaup_defconfig   clang
nios2                               defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc       buildonly-randconfig-r006-20230602   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230531   gcc  
parisc               randconfig-r015-20230531   gcc  
parisc               randconfig-r023-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r032-20230602   gcc  
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230531   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230602   gcc  
sh                   randconfig-r002-20230602   gcc  
sh                   randconfig-r012-20230531   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230602   gcc  
sparc64              randconfig-r014-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-r001-20230602   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230602   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
