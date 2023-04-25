Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AECC77B61
	for <ath10k@archiver.kernel.org>; Tue, 25 Apr 2023 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qmxa9tYbe7VDR+WBFgqIEsb9GTzpJ+TOpw77sJwhShg=; b=ddujYixEViux3p
	CK0+a06hbringWGrsn0Tk8cFauhbVkktnF0CazdMnaqiOM1p2fYPn1OgSI5Z3dZ9mY4PVhB2mtbYE
	0AZxexlOpQg0XeYmcDQWhFNUSYEFIZOqAYPU1H+E8TC3IPO00lM5myp83WbKx6ZpocTtRWLS+Lj/p
	Y/8zo+6eoVYEMYmzhonFUzdHnerLbHHubl1XB7ybCxyhOnNPU/3Z+052RVy0tfnOIS1B4pz7zwmxN
	opAH4X7xbKrRfJMxirDYAepEsCPI2XdexMtOxkzrIq5adggFxsP45PSSBf4gKqRDVZpeUTV3L/K6Y
	Qz7Hlmhq7xLZu/apawoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prCJE-000IsH-14;
	Tue, 25 Apr 2023 06:37:52 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prCJB-000IqC-1A
	for ath10k@lists.infradead.org;
	Tue, 25 Apr 2023 06:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682404669; x=1713940669;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dX1C6RTf+cGK/d0HSNOPOm7JrBEpg8HsgwFAYPA6Dxs=;
  b=I7eYMLFFC66OS0xOclvOARQTABrNtUVOfxSAEjezICvMsJRfXXDRRTxH
   HhTeuoxtRY/p2uC7z6Sn3VljYW/MFbLRvPOS9/cD0P/wfP1yQLSu42NMD
   h4kPJRjaXu9oQqZNiHbEs5YZadRU0+gWm8zpajWrhlONjOY4HG/LpNmGp
   VTdIGJ5fJU5wDa83znox06fqNWBvptGSflcQOeMdRHTAP0Mw/PBE2shah
   7q58XGBjdSNh4k4YqPrkaw/SwJ+oXiI5ZbbsG/LGewl+RSWhmHxcQEnmN
   7OWbXn6XE6nGvtwwNVnNU5v+8/wbDZCUD0bGER/w2wlk0fq8s9U66c1ax
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432936649"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="432936649"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 23:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939647153"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="939647153"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2023 23:37:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prCIi-000j6G-24;
	Tue, 25 Apr 2023 06:37:20 +0000
Date: Tue, 25 Apr 2023 14:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 62c8a2592ff0c20e973fb7c8ceb7b95249685678
Message-ID: <64477511.vBm/yZdmMxMpk/KV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_233749_417609_A95A50BB 
X-CRM114-Status: UNSURE (   4.40  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 62c8a2592ff0c20e973fb7c8ceb7b95249685678  wifi: ath11k: support reading radio MAC from DT

elapsed time: 725m

configs tested: 128
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230424   gcc  
alpha        buildonly-randconfig-r002-20230423   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230424   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230424   gcc  
arc                  randconfig-r043-20230423   gcc  
arc                  randconfig-r043-20230424   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230424   gcc  
arm                  randconfig-r023-20230423   gcc  
arm                  randconfig-r046-20230423   gcc  
arm                  randconfig-r046-20230424   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230423   clang
arm64                randconfig-r034-20230423   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230423   gcc  
csky                 randconfig-r031-20230424   gcc  
csky                 randconfig-r035-20230423   gcc  
hexagon              randconfig-r013-20230424   clang
hexagon              randconfig-r014-20230423   clang
hexagon              randconfig-r015-20230423   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r041-20230424   clang
hexagon              randconfig-r045-20230423   clang
hexagon              randconfig-r045-20230424   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
i386                 randconfig-r026-20230424   gcc  
i386                 randconfig-r036-20230424   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r004-20230424   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230424   gcc  
ia64                 randconfig-r005-20230424   gcc  
ia64                 randconfig-r022-20230424   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230424   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230423   gcc  
loongarch            randconfig-r006-20230424   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230423   gcc  
m68k                 randconfig-r033-20230424   gcc  
microblaze   buildonly-randconfig-r005-20230424   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230424   clang
mips                 randconfig-r024-20230423   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230423   gcc  
openrisc     buildonly-randconfig-r005-20230423   gcc  
openrisc             randconfig-r021-20230424   gcc  
parisc       buildonly-randconfig-r006-20230423   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230423   gcc  
parisc               randconfig-r036-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230424   gcc  
powerpc              randconfig-r032-20230423   gcc  
powerpc              randconfig-r032-20230424   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230423   clang
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230423   clang
riscv                randconfig-r014-20230424   gcc  
riscv                randconfig-r042-20230423   clang
riscv                randconfig-r042-20230424   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230423   clang
s390                 randconfig-r044-20230424   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230423   gcc  
sh                   randconfig-r012-20230424   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230423   gcc  
sparc                randconfig-r016-20230423   gcc  
sparc                randconfig-r026-20230423   gcc  
sparc64      buildonly-randconfig-r002-20230424   gcc  
sparc64              randconfig-r023-20230424   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230424   clang
x86_64               randconfig-a002-20230424   clang
x86_64               randconfig-a003-20230424   clang
x86_64               randconfig-a004-20230424   clang
x86_64               randconfig-a005-20230424   clang
x86_64               randconfig-a006-20230424   clang
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230423   gcc  
xtensa               randconfig-r002-20230424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
