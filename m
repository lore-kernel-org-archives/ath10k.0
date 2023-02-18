Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E6FC61DA4
	for <ath10k@archiver.kernel.org>; Sat, 18 Feb 2023 05:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1ffUSEPjQ5HZdHHTQNCG+2cHEUSIj8/cRCvLNqxyYA=; b=Kl8ahgAe8vNMqL
	WnqOabrsFmG/9PTQgDX9kMiqu+RFNph+S9X0i9P0N0UX1aQMRE+AsItzJmJSN6zrpI8RZSv3WJ0D4
	s3G9OMhKMclmQQioU7320mh2PnnB7ZKy/LFIPX2hf5aGF49wzjJ8ogb3U+/szXfcpFngwDE72Zvwx
	RO9SUhd6TWG3cJJ1E4UzaLAoe9/BJgZW3U/cbHNcFKixRl//NKadX6085s0OZH0TKYSvF8fc9jv9Z
	gB8YU35IggRnPcdarhJ4E+M8ke9t7F6FFMxtRglDni13xV+Xi3nU0Y2NXadNNqR9nYsT56zGDzc0c
	vKI6Y8VD8/6mrZ0Qeciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTFy1-00GQGA-Ev; Sat, 18 Feb 2023 05:41:01 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTFxx-00GQEZ-St
	for ath10k@lists.infradead.org; Sat, 18 Feb 2023 05:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676698857; x=1708234857;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LYUrBXZWmRCOZSYh4hg3sUDYaw43yzKIy6J4hY51PVE=;
  b=PNgEWVqUNWl8kvUqQ0uVJH+ep3A5JWkwwLXlkvl+YNjuYBoXaEjJ1G6a
   R33Y2jwFXLB6ii5VHOxR7jjeGBFnCK4HjbiZEzjrjztzayIEda0ixP5Fu
   +R0Tb79FUrVbc8NSoynLm57NidgRSHRJH47UEVqKyxvEoSIjLWLGG0BmZ
   idtsIkquqDDRksEwLz3cn6xTYmvMD87r0b06Pa1Fkn3jsrDhnYg5LXgRp
   /BynaKssXFENHyzWi4K9g5aKCiJ/Z8aJVQJi/smXcl3LRkJm8DrFBrgA+
   XpRPVQ4lItdTrQeCVIRlb0yoM2GZ2Wmj8LmWMxuRkNkRz10+JkvAA9aek
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396826748"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="396826748"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 21:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="672821040"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="672821040"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2023 21:40:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTFxo-000C9T-2E;
	Sat, 18 Feb 2023 05:40:48 +0000
Date: Sat, 18 Feb 2023 13:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 18f687750d02a93c146988d032c0c55169de2cce
Message-ID: <63f064cc.hsTiENTNLEcgQ+Ge%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_214058_055804_EFE0097E 
X-CRM114-Status: UNSURE (   4.29  )
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
branch HEAD: 18f687750d02a93c146988d032c0c55169de2cce  Merge branch 'ath-next' into ath-qca

elapsed time: 785m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230217
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                            pleb_defconfig
arm                            qcom_defconfig
arm                            xcep_defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
ia64                          tiger_defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                       m5208evb_defconfig
m68k                        mvme147_defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
openrisc                       virt_defconfig
parisc                              defconfig
parisc64                         alldefconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                       maple_defconfig
powerpc                     taishan_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230217
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230217
sh                               allmodconfig
sh                           se7724_defconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-r046-20230217
hexagon              randconfig-r041-20230217
hexagon              randconfig-r045-20230217
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
mips                          ath25_defconfig
mips                      maltaaprp_defconfig
powerpc                   lite5200b_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                    socrates_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
