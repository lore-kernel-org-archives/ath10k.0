Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CCFC32793
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHopAFFXqqWMt+hLtVZ74eVnddnWcN0zadK6ptYWhgo=; b=v7f7P6fvI7XJN1
	DwMssQlUqZsp82abqdaA2Z0D0879ozO2Ap9bJrtHfjT8k1yJQWCie5j3cJapmg2oFLSTL7TZY8v3Z
	kxmKXfrJDEbIj0xnn/jdoW8g3LiwXy/+zPlalCvFj2u6J8KCzlzEtrNWg80U4wYVyF1UfBacS6Ie1
	Ii5qd6fIDztKkHpWoBQpuQK3Ep8i5kmDzlWG9ZflsIpk0PUc/j8bpNGcKdtjpEzoTkR3vvrRBtWW4
	eh1RBW7jjn6eOAszX/sczZPEiqgT6pAbnyhx0b6Z3nyTw++oYnY8kdXpEXA41Xi4MVTOwAj1DN7SC
	GvCvaD1Re+Peydovv9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDzs-002StW-0n; Wed, 18 Jan 2023 19:21:20 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDzo-002Sqt-KW
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 19:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674069676; x=1705605676;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZSh3i7o3ndg/E4LxaWvVjsGZJF2Pnh7V9+38VqjwhCo=;
  b=UlKZPO4rapUvVZ6vvQlfKC85GUoHp3BsPDyPu9zpVLXRza6aid6Vlbx0
   b0h/KVWZUC6tRnl1J3kpcFu/Q75GQRR9yN8glOUYyD36SR7AUhuUKZ409
   prw2oc3OyIipGqq4TxrrNs02l+Ueddf8XsmlLdpycgehAM89CL1GcEV+K
   oVANpBDguzVnY7NikNz1wu+e3vRc6Ud1XmDLYJBpxMl/vZjrVfx54dMaA
   GG4lMuskB23jkpqyiuXFnUAlMtIaX//VuV32p4SLkiehGKtpB0GV2qziw
   56zriM6iuhLynhsqfyoZ11jCYGJgcHNuK0/OAKu3KVTLOTCBl8EqSM7kC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387426936"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="387426936"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609773188"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609773188"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 11:21:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIDzi-0000eO-2j;
	Wed, 18 Jan 2023 19:21:10 +0000
Date: Thu, 19 Jan 2023 03:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 c7eda91f0fb0f8269511ab5e32db5ac878e946a5
Message-ID: <63c8469a.wfiyKEQwS07JBVjM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_112116_790193_AB61DB6A 
X-CRM114-Status: UNSURE (   5.71  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: c7eda91f0fb0f8269511ab5e32db5ac878e946a5  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
x86_64                            allnoconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                              defconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
ia64                             allmodconfig
arm64                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arm                              allyesconfig
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
m68k                            q40_defconfig
powerpc                     taishan_defconfig
sh                            titan_defconfig
powerpc                 mpc837x_mds_defconfig
mips                      maltasmvp_defconfig
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
powerpc                       eiger_defconfig
arc                     nsimosci_hs_defconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                       m5208evb_defconfig
arm                         s3c6400_defconfig
sh                        dreamcast_defconfig
xtensa                              defconfig
mips                       bmips_be_defconfig
arm64                            alldefconfig
sh                 kfr2r09-romimage_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
arm                        mvebu_v5_defconfig
mips                      malta_kvm_defconfig
arm                      tct_hammer_defconfig
arm                       spear13xx_defconfig
mips                     loongson2k_defconfig
mips                  cavium_octeon_defconfig
mips                          ath25_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                          allyesconfig
powerpc                      ppc64e_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
arm                         orion5x_defconfig
arm                         hackkit_defconfig
mips                           ip22_defconfig
mips                        omega2p_defconfig
arm                          collie_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                              alldefconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
