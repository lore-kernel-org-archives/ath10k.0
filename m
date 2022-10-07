Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FDEC433FE
	for <ath10k@archiver.kernel.org>; Fri,  7 Oct 2022 07:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3CVdsg9hooJUF9+ro7Mb5XHKjKRMgqGSdov5W5ymPY=; b=e55hrWKX3tGDMN
	mNbbqa064o9GugAaHd/AYKLkpH9uSHKRCR+FP+v6GARaGeEe7Ts2vcjPJkD3Ua0SaWv6PFHj/4xk/
	vm0Xk4zbp0CfYUY0MvHgJQvRcXqtxxTXIbkOVBj1OWWVl22O0fNFMGx/yZwXL2d4xvx5owDiVvKhW
	Nb+Mn2mbLBmW4kP7jLH6IUQUkATdhE5R+6NKZhvsC68P7VMr2UrMd9UA+wfXOBRFldQN22KbhDbFP
	fNPvqoE6nKcoPayptK0bVpk+TxdK8Dn7vZ1E2L/zWwIGv/z3mz16nrd4Xr0+n4Rc9xuFAZ97McrZR
	ixbyq68WJxlxiphMUp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghNN-007mOR-NF; Fri, 07 Oct 2022 07:02:29 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghNJ-007mNN-Hi
	for ath10k@lists.infradead.org; Fri, 07 Oct 2022 07:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665126145; x=1696662145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eejw6CtgDhO1vLJVALWELWfITnheR9y///m7fsFClWs=;
  b=K1cOgqOKbSeGFOAjCNkYQRIy6X7+LpSsNYl6Old1pkOuWtXNIhwyw3R5
   JHUKdCjOKMNzyamUgaAAIZiPo1kUWY6wjBu4cEaOwO/HtaDKEGaR7k10I
   v1V6Di33no50CpqHa472FLru8q0GUu61GTZALlVH3jeGx5PX1K9o4BWnD
   fVoUwyPVHkE2v6a3D0t2YCouwYxupSO9VJ3k9jf3/6EuG/KdfnGokLx54
   K4A4SGe+2AL8BZiw6+0DmWN0hp79u0qja4VlfkoQSHP8w6RVHsi8gpZuq
   H92yLcL2ZOuG/4zRzs8zHrJnjLoa8Q1k5kMYfX+c4QqzILO0Zsy0teIam
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="367795747"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="367795747"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 00:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767461613"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="767461613"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2022 00:02:13 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oghN5-0000sN-1J;
	Fri, 07 Oct 2022 07:02:11 +0000
Date: Fri, 07 Oct 2022 15:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 1900ce14f5925cdc9b84c2d55051c40e9f823f2b
Message-ID: <633fceb7.PEilGZB8hVY4DFlj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_000225_665648_D342E9EC 
X-CRM114-Status: UNSURE (   5.55  )
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
branch HEAD: 1900ce14f5925cdc9b84c2d55051c40e9f823f2b  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-kvm
arc                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
alpha                               defconfig
powerpc                          allmodconfig
s390                             allmodconfig
i386                 randconfig-a011-20221003
x86_64                           rhel-8.3-syz
i386                 randconfig-a012-20221003
mips                             allyesconfig
s390                                defconfig
x86_64               randconfig-a011-20221003
powerpc                           allnoconfig
i386                 randconfig-a013-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a012-20221003
m68k                             allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
s390                             allyesconfig
i386                             allyesconfig
i386                 randconfig-a014-20221003
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                         s3c6400_defconfig
mips                     loongson1b_defconfig
powerpc                     asp8347_defconfig
powerpc                  iss476-smp_defconfig
sparc                            alldefconfig
m68k                        stmark2_defconfig
m68k                          hp300_defconfig
arm                        keystone_defconfig
sh                           se7751_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
ia64                             allmodconfig
powerpc                  storcenter_defconfig
powerpc                     mpc83xx_defconfig
mips                  maltasmvp_eva_defconfig
i386                          randconfig-c001
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
mips                        bcm47xx_defconfig
sparc64                             defconfig
mips                      loongson3_defconfig
microblaze                          defconfig
arm64                            alldefconfig
openrisc                    or1ksim_defconfig
powerpc                        warp_defconfig
powerpc                      makalu_defconfig
csky                             alldefconfig
arc                      axs103_smp_defconfig
mips                            gpr_defconfig
powerpc                       eiger_defconfig
powerpc                     tqm8555_defconfig
sh                           se7619_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
xtensa                         virt_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                    adder875_defconfig
powerpc                      pcm030_defconfig
riscv                            allmodconfig
mips                       bmips_be_defconfig
sh                              ul2_defconfig
arc                          axs101_defconfig
xtensa                              defconfig
openrisc                 simple_smp_defconfig

clang tested configs:
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r041-20221003
hexagon              randconfig-r045-20221003
powerpc                 xes_mpc85xx_defconfig
riscv                randconfig-r042-20221006
hexagon              randconfig-r041-20221006
s390                 randconfig-r044-20221006
hexagon              randconfig-r045-20221006
x86_64                        randconfig-k001
powerpc                   microwatt_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      obs600_defconfig
arm                       cns3420vb_defconfig
arm                          collie_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
