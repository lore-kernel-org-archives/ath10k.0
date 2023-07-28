Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B56C001DE
	for <ath10k@archiver.kernel.org>; Fri, 28 Jul 2023 04:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPNabzH7XopI3UH+wV4fqDFbIZg8lvw+l/bWa9+YQjA=; b=YAHr2pK4UbtrTT
	8CGdp5Yty5QlpL3Q21hI9vwJ4g263drgLlDTxHU/Nj+EjsPEcy1UF3HIHeHfh57HwZOw+9Qph3zTm
	OxuR0NixEA+vDrrtTT+KhtU7l68duTwE9qPdVsc7UEFjmP+i3FigshYOUpyyNBEaH65a5c5AXj4pV
	3H4HKmzaGye+Ae5XpDSU5V+XMl3HEWmiqMviTSvW0Ue9qq+Qfd5h13AWINUlZQ+9YZYJAeded9Yk4
	eQwKbebdpaGB2tfjaBRFfONmyzXElPBPs8ZJpWlBsdm5Gl7gC6xbHtgbrg24ZaD924N3AmWTi9kdo
	+r9UXyOp/Ns+IMw7Ap+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPFI1-001bFJ-0Q;
	Fri, 28 Jul 2023 04:41:21 +0000
Received: from [192.55.52.120] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPFHx-001bEc-1l
	for ath10k@lists.infradead.org;
	Fri, 28 Jul 2023 04:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690519277; x=1722055277;
  h=date:from:to:cc:subject:message-id;
  bh=K0XOuDjc4ZJd/8dV0gC21bM2D/jKLH9iZuZhCKO/0EY=;
  b=eYgpxeYhvpOWMPrGIU8+zXlKW+t1fP3QFr28tVwBCX3osGz1Q5IGqwCb
   8EDbZ+hg4Gla6pBMLldY0qjDcF+Mv0mYm+goJp/Slz8QdjfOyj95p7Is1
   xygPfBN6OLzwNTzntp7vMMhDwIU0JncsBxiacvhsWPRiAKHhJstzSOpEW
   ZP86BVWydldq7DwEGmgIkHSyXX5sqbZJSBDYmziJ1n7GV/aEoFD//hmgm
   pq6GiVngFcUSKx90ADd4nva/mBChoJtJUOm6OHG/TfQDhKIq5pKdVmdjQ
   LMfk8jneoBAMJmHJWAyhfyoOS0gP6XBEMpp0E/SPaFVe2tvREKrRl43AZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="367376378"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="367376378"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 21:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797289671"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="797289671"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2023 21:41:12 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPFHr-0002sl-2g;
	Fri, 28 Jul 2023 04:41:11 +0000
Date: Fri, 28 Jul 2023 12:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 dfa8dc118e3cef402d4fbc2ae9cab418197d103b
Message-ID: <202307281234.50XYPQyO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_214117_627594_5A5FF7D3 
X-CRM114-Status: UNSURE (   5.36  )
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
branch HEAD: dfa8dc118e3cef402d4fbc2ae9cab418197d103b  Add localversion-wireless-testing-ath

elapsed time: 731m

configs tested: 130
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230727   gcc  
arc                  randconfig-r015-20230727   gcc  
arc                  randconfig-r016-20230727   gcc  
arc                  randconfig-r026-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r022-20230727   clang
arm                  randconfig-r035-20230727   gcc  
arm                  randconfig-r036-20230727   gcc  
arm                  randconfig-r046-20230727   clang
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230727   clang
csky                                defconfig   gcc  
hexagon              randconfig-r034-20230727   clang
hexagon              randconfig-r035-20230727   clang
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-r001-20230727   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230727   gcc  
microblaze           randconfig-r005-20230727   gcc  
microblaze           randconfig-r012-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r023-20230727   clang
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230727   gcc  
parisc               randconfig-r031-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r036-20230727   clang
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230727   gcc  
sh                           se7712_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230727   gcc  
sparc                randconfig-r014-20230727   gcc  
sparc64              randconfig-r002-20230727   gcc  
sparc64              randconfig-r014-20230727   gcc  
sparc64              randconfig-r015-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230727   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r013-20230727   gcc  
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230727   gcc  
xtensa               randconfig-r011-20230727   gcc  
xtensa               randconfig-r021-20230727   gcc  
xtensa               randconfig-r024-20230727   gcc  
xtensa               randconfig-r032-20230727   gcc  
xtensa               randconfig-r033-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
