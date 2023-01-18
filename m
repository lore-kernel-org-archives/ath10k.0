Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B4C38159
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=afIRVs/CXvVf0uEVlmVcg0U9EVx1Ve+vdG/oItno0ik=; b=k6j9EIEqagC8tq
	r2EdN3gtoLND1T2htEeITrgp0N1MA0mq/o0BsGM6jA2H8cOnZhoQFlm9FWQ3G/Nsyg2Bdyt1jwogK
	kMRsShlEW9hEyw2TwiA9OFbDm4ReswcGuyeA7AG+sXxxuCgtVqpoA8dWO0YY+ne+gdvnXd9IkYEIC
	14ecA6/fZYEdSDeNBT7aOac6DKrqSkLPzf4rRbRiJlXyvugIKE1Nclhw2DKc95z75yevLRAU3819N
	Co5Y8M+TrvVzGxFQ7nYyyHFR5DfSxnRnbvm0NsLz18tJApYl4A8nqixwWUrqYfPqhKXxzM5gBVBKt
	gfOz5UZCeBoHP0VhvBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDzv-002SvG-HQ; Wed, 18 Jan 2023 19:21:23 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDzq-002Sqt-Fy
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 19:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674069678; x=1705605678;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dmIYci3jYo5zeZtgdPv4vTWM7ejznq6LK1hiBErFlEk=;
  b=f+2OpLtFIAzTV37PN+PMOR+ufUwH0R1uFSdE7zToTaMpHvFd3E/2r5tF
   FqLgxr7vHlCCSUjNbMp5OZKqg0JOkWytJvjhLssfkSbpIWYJI96kweWB1
   zy86VnFzD3fountMnmcv6rskcyd2LpxTfFIJBgEZUtUaX9EDp59aRiOTK
   WZY7rbZtzm8An1bJ8Xg1NHt560S5dpztMGXXYa/+p5umBSjpsEf2Aju+K
   cJNfozVOh5OXGPWeXI7XYDwWXHAxYPTBDuS/RzAjYpn5sxmMREuWPIQRv
   FliUtzjJn1g8HNp1RXx43p7C/4lX+66oH7gOguyttcpuB2weUgQ+vdpTL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387426934"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="387426934"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609773187"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609773187"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 11:21:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIDzi-0000eK-2A;
	Wed, 18 Jan 2023 19:21:10 +0000
Date: Thu, 19 Jan 2023 03:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 25844d62c9351ba63242a700097adff33329eeb8
Message-ID: <63c84696.Zr001C8mmxemS41K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_112118_609741_F02CA2DF 
X-CRM114-Status: UNSURE (   6.06  )
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
branch HEAD: 25844d62c9351ba63242a700097adff33329eeb8  ath6kl: minor fix for allocation size

Unverified Warning (likely false positive, please contact us if interested):

drivers/net/wireless/ath/ath10k/ce.c:80:19: warning: unused function 'shadow_dst_wr_ind_addr' [-Wunused-function]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath10k-ce.c:warning:unused-function-shadow_dst_wr_ind_addr

elapsed time: 721m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
arm                                 defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
i386                             allyesconfig
s390                             allyesconfig
i386                          randconfig-a014
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
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
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
i386                          randconfig-c001
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
sh                             sh03_defconfig
powerpc                     ep8248e_defconfig
powerpc                      ppc6xx_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                                  defconfig
powerpc                mpc7448_hpc2_defconfig

clang tested configs:
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                          rhel-8.3-rust
arm                        mvebu_v5_defconfig
mips                      malta_kvm_defconfig
arm                      tct_hammer_defconfig
arm                       spear13xx_defconfig
mips                     loongson2k_defconfig
mips                  cavium_octeon_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
mips                          ath25_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                         hackkit_defconfig
mips                           ip22_defconfig
powerpc                          allyesconfig
powerpc                      ppc64e_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
arm                         orion5x_defconfig
powerpc                  mpc885_ads_defconfig
mips                        omega2p_defconfig
arm                          collie_defconfig
mips                          rm200_defconfig
powerpc                     skiroot_defconfig
arm                          ep93xx_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                              alldefconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
