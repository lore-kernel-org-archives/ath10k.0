Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261C4C6FA8E
	for <ath10k@archiver.kernel.org>; Thu,  2 Mar 2023 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NALj0ElAcSA3ABZ4xDkIFjrysEY+htVXOi29xQW4yTs=; b=4SPoxmQaqxR5zP
	q7sUH7mffgFTcYgeILGldbeV2nlxmAfBmHHDsykTwlmXLtJxdBW+QC7Q26Qj3lyAZJoxx5kY0bpJF
	UULAa/R+CinbzP+D1uDN2jz7cbidEJi2cmO5jLzbC317xJeZJvootR/pIJowEtesDfflyPBfmdpnT
	XY8alNRVh4ViSq+NM3G8QUmpfM5Y0FYaUjA9+QTxLT68XfnfXoqs0NtH+sNg2XuFZ7X3bVon0fU4F
	JqDQTXHYr63w0gKk4tBhjmA6ut4ofIs7ILdwEbjSt50v3k3nn6DGATCrelrAsrmM7fTzbB9ZjP6oX
	limRyKnHerAOjBuvzGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi5f-0029Ku-JX; Thu, 02 Mar 2023 12:31:19 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi5d-0029In-6z
	for ath10k@lists.infradead.org; Thu, 02 Mar 2023 12:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677760277; x=1709296277;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8xtDa8bRH7H3YH8ezK8w+B3+4tDCFNsFcr8liCpOxgw=;
  b=bVH3qak1kbQvZbFgde14IRsuaQKG0d9i/cyIirdMyzVzsYz4nRHqFlv7
   Awt9w2yCntOg6mO0vIlsHcbuDTC/Soyv5ZTzZaxKhOdxvtSrCz+vXWHLx
   uaf3+8UmM7kqRt9RfX30HqP+OSM1RwYXxqxokYiFvOaB+DeluaM+GTasE
   ec9w/h/TCDMgOGdEvu3YdLhtBHUlZkJfD8VJKkNRVA03F5rn4Eh6rDMch
   sl3afYH1YmpSDRLrZAmeCT6LqEcKjGeczC4JjNaPkjF1fxUcs/3OjXIl1
   Sn66b/+xDUT8CwZMKYqKyg5hT1Caa6STCbiVnBxYnXE2wsqAkCSOhKEZc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="334733636"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="334733636"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 04:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743841050"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="743841050"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2023 04:31:13 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXi5Y-0000Sk-2r;
	Thu, 02 Mar 2023 12:31:12 +0000
Date: Thu, 02 Mar 2023 20:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 79844ef915e120046ace380101834e09369a5aaa
Message-ID: <640096f1.357yWc35+guZeyKb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_043117_364412_D3601B85 
X-CRM114-Status: UNSURE (   5.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 79844ef915e120046ace380101834e09369a5aaa  Merge branch 'ath-next' into ath-qca

elapsed time: 1319m

configs tested: 105
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r025-20230302   gcc  
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230302   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230302   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230302   gcc  
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230302   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r023-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230302   clang
mips                         rt305x_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230302   gcc  
openrisc     buildonly-randconfig-r005-20230302   gcc  
openrisc             randconfig-r014-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230302   gcc  
parisc               randconfig-r006-20230302   gcc  
parisc               randconfig-r035-20230301   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc              randconfig-r034-20230301   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230302   clang
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230302   gcc  
sh                   randconfig-r016-20230302   gcc  
sparc        buildonly-randconfig-r001-20230302   gcc  
sparc        buildonly-randconfig-r003-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230302   gcc  
sparc                randconfig-r033-20230301   gcc  
sparc64              randconfig-r022-20230302   gcc  
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
x86_64               randconfig-a011-20230227   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230227   gcc  
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230302   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
