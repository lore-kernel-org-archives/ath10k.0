Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394E3C7618E
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 05:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ASxa20H1DoNuXZMULXmJJ3zgxVo31bLYAyARzyMqaA=; b=HwgnVRdU0VmzUG
	sBTmykxpsBg4wu2JJOnfq8FbOt5DgYAHXqQoVbY/sJuEb+zrzGEeZxWZVc41CoGU5s9LdWpYCYvea
	8CUjjwC51Qc+yKRvSwD10EI5HoibpuQpydzzBqukOLmik4zQeL35QDGL1pb1zYit5t8ertubWOiGv
	7vsQ1zbk9EzASQr3GFC+e/vL+7JEGUGaM8wO69wRg3fpUCDHZiESwa0W7AtIK83W6B/crduHS0ILp
	x2lYXlXMqF/M1m6l8COVInKzgbybQJnnfjqV/0WOKSD4yYPCLNAH6RH6zJOZyQglKONibh4uF4v7U
	qonl3SlO8VjvyMXnSOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psd8v-00CGaU-13;
	Sat, 29 Apr 2023 05:29:09 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psd8s-00CGZc-05
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 05:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682746146; x=1714282146;
  h=date:from:to:cc:subject:message-id;
  bh=BA/l+zcr7qRQBjN8UIpD8vWCre0ONtVBq05i8EAvVQ0=;
  b=ONBC4crheII8sbc8gw8yAfawbIiOzID9WC0q481UUJkfqixiZj6lxTom
   J1Do3Y4aHWpjYYYa2l6XJ4QSlvT/DCkAME8V0Ecqa7FnXcOUDaTZCUeph
   vshde9OdK5C12RLyXnw4olVnK45u0bBYcGNzhu/fYEY5jCTcEaUpKx7av
   a8tEdv19ENuTV9L+TIl+juMvUGy7g1QcZUs31r6xhtjEPLE8ktsuYRjtf
   fPOBdqcn57tlSWJFTwTplLKB9zbeRJNh1AF+SSn4HIaU/liNfO5uX6Jes
   INkmYszFHHI/LHdj/hr0kEOIEUVtr2RTTGlWjYtdapsCDTO6Qu9Gx+zMw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375924079"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="375924079"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 22:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941383543"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="941383543"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2023 22:29:00 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psd8g-0000vp-0z;
	Sat, 29 Apr 2023 05:28:54 +0000
Date: Sat, 29 Apr 2023 13:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 35ee9081ab62c66abcf45bae13e1924cf18b9b1c
Message-ID: <20230429052809.uuArE%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_222906_077070_03BCA2BC 
X-CRM114-Status: UNSURE (   5.68  )
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
branch HEAD: 35ee9081ab62c66abcf45bae13e1924cf18b9b1c  Merge branch 'pending' into master-pending

elapsed time: 721m

configs tested: 101
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230428   gcc  
alpha        buildonly-randconfig-r005-20230428   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230428   clang
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230428   gcc  
arm                  randconfig-r031-20230428   gcc  
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r036-20230428   clang
csky                                defconfig   gcc  
csky                 randconfig-r022-20230428   gcc  
csky                 randconfig-r033-20230428   gcc  
hexagon              randconfig-r012-20230428   clang
hexagon              randconfig-r013-20230428   clang
hexagon              randconfig-r041-20230428   clang
hexagon              randconfig-r045-20230428   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230428   gcc  
ia64                 randconfig-r032-20230428   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230428   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230428   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r006-20230428   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230428   gcc  
parisc               randconfig-r035-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230428   gcc  
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230428   gcc  
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230428   gcc  
sparc                randconfig-r003-20230428   gcc  
sparc                randconfig-r015-20230428   gcc  
sparc64      buildonly-randconfig-r003-20230428   gcc  
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
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230428   gcc  
xtensa               randconfig-r025-20230428   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
