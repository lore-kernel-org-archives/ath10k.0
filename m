Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC44C43334
	for <ath10k@archiver.kernel.org>; Thu, 30 Jun 2022 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=90SgrVVyoDImvR0VM1hss9uA0qeX+kUlIoLC27V44Zk=; b=Ea6QzHSBj/YQPF
	zTmnSRS7bqTQQ2nFjZD2sr3xFCVmz6njTQKccrxKn/ivUOcLw7EY82+tqPfioboHBS0c3hLaYjJFD
	rrHTjCFOvrZ8n4LJdOLTfyPCclTsFGE7eE2zhJKgE0AGr/qmg+g6ajSIbTJNbYod0ZG96etSidhUH
	yXMDfvezLMgImpmNSPUg+AGy2B4oVaVWgFzNI7Cvn5IEzspj6pwn7xXeb6CxEWvhINvYQ6i/VJsU5
	d4/ltU1co5nUkU2ydJs101TALCucAKmRa9m441DYILY4cuyISI9VGdO/WszhxG3gBoMd0nMyHgMXM
	BpMs2B774Z2TvrF5a9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qrx-00GNBY-0F; Thu, 30 Jun 2022 09:53:53 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qru-00GNAY-1b
	for ath10k@lists.infradead.org; Thu, 30 Jun 2022 09:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656582830; x=1688118830;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yuK0ilFDKns4JhJ0YYSCrriv+6mDebv2uYbEnQEpt6U=;
  b=SqQhsM39Go956EitCNvtabEympZAdGb1e0EILoI+BYrpieiJ8pKGBDsF
   i5UmMCJVZzEOx7zXZAL3vlgD4zmP9X5y7NirHgmd9bTfxnxoCTAOUBH+s
   BYjLKeoZ8Zzo21AzUSaTa/ZyKu+dV5IuwARNFfrGiKUu6wRIIy5NUgriW
   WpRArTFx5vYfrjg28N9GIi0t0o4GlzC3yJn3gSf+78ZyP9eQtkMH0o+4p
   tWXjlZQWHSfZHi6oSi4UrtsY0ywLWSPpNfau8hjaWQ/QZo730BlRuXSsd
   QSAjnI8Y9Nob01ItO8ScIPP1QzAJwJFsNGwg2LJLucvz1dC77vFQfW8u2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="265339019"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="265339019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 02:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="693989506"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2022 02:53:43 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6qrm-000CZu-N0;
	Thu, 30 Jun 2022 09:53:42 +0000
Date: Thu, 30 Jun 2022 17:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup-extras] BUILD SUCCESS
 b77706771a58ec0ac8d7e3025d507518eb0784f9
Message-ID: <62bd7275.rEZE/dfozrsBXpsP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_025350_208319_CF3ADAB3 
X-CRM114-Status: UNSURE (   6.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup-extras
branch HEAD: b77706771a58ec0ac8d7e3025d507518eb0784f9  ath12k: Avoid false DEADLOCK warning reported by lockdep

elapsed time: 1580m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                       m5208evb_defconfig
powerpc                      ppc6xx_defconfig
m68k                       bvme6000_defconfig
m68k                         amcore_defconfig
sh                          landisk_defconfig
m68k                       m5475evb_defconfig
sh                               alldefconfig
mips                        vocore2_defconfig
arc                           tb10x_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc834x_itx_defconfig
sh                         microdev_defconfig
mips                          rb532_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220629
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220629
arc                  randconfig-r043-20220629
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                  cavium_octeon_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         s5pv210_defconfig
arm                            mmp2_defconfig
powerpc                      ppc64e_defconfig
mips                       rbtx49xx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
x86_64                        randconfig-k001
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220629
hexagon              randconfig-r045-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
