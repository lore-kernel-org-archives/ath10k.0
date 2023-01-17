Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C838C3DA78
	for <ath10k@archiver.kernel.org>; Tue, 17 Jan 2023 07:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lzpK/pobjMYLBMKz/HA05tWQVNkX6r+tq9KAKhlq0PA=; b=IttUdTbuIZIun9
	TIy4hqE69vr4eW+nbHsiARBkBK3an7J6ISGl+eWOS7Qgvt37gnBlRRBS+eOycDGwsb+W1p0V7mTAd
	4+y24GLt0FuB08TbkBNdnydkndc0CNc/3i62tzefohwfKXIqdO11K19n96K8/Ff+DB5knE698/zUs
	5RcBB8ad6FRlqoBpP+cZb9WsVCZzbeB5UH+nctGDIWHOKQJpxxuuXiQR5ogpAXgxaX+fKBJWE/Jfa
	wN5GZK/gOZNvwSMvU+LXgbaWqF/OE/IuBKp/sIw+90Tqh4ywfv3eDmmb7cw8Gzq0ivXORisY6+bAi
	3nCo9iJ8iaMUxD2UU98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfxV-00D6sM-46; Tue, 17 Jan 2023 07:00:37 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfxS-00D6rR-DV
	for ath10k@lists.infradead.org; Tue, 17 Jan 2023 07:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673938834; x=1705474834;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qj7x9ZSeEOEu4U44jZmpM0fidwquQ1yzdY9Ci+BNnAI=;
  b=Tt2q6xABBqMr/zvECdTF7IIEmiDloUCAXtqAs1fzPYcVAYnitgqmg83I
   IKePQqB02zQICoBNzmw6N/OEXqWitDelARAtsWxXU3VLrz6ZF6CnXHwGm
   Sco89GW7IgueMj8Cd2C5TZV/wIfZHeutbu91CnJbEJumFrfJQRNFWmR0m
   n5MfDP+riXoUe2rtlyRMdjEiCaK+27OYju52vyvnxl8GdSX5MJOqOfQ+4
   lJS4/vlXq80ryp7KnXZVZx1uPP29S10F/zO7mqqAty2CvHJqbtNqQqqdH
   ozFGnyfYmfuuOrz2WgNrpySFnlvQB2tC5bhcwzEJF0MqnOPVUxTgxqdeU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="312487597"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="312487597"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 23:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="652463972"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="652463972"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Jan 2023 23:00:19 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHfxB-000130-2H;
	Tue, 17 Jan 2023 07:00:17 +0000
Date: Tue, 17 Jan 2023 14:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b9dbf85f778b04e820769f775ae8ded64df5f91d
Message-ID: <63c6474e.QfQn1+CmpPWctR+f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_230034_556066_73CF4108 
X-CRM114-Status: UNSURE (   6.58  )
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
branch HEAD: b9dbf85f778b04e820769f775ae8ded64df5f91d  wifi: ath9k: Fix potential stack-out-of-bounds write in ath9k_wmi_rsp_callback()

elapsed time: 720m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
s390                                defconfig
arm                                 defconfig
i386                             allyesconfig
s390                             allmodconfig
x86_64                              defconfig
i386                 randconfig-a014-20230116
x86_64                           rhel-8.3-bpf
i386                 randconfig-a013-20230116
s390                             allyesconfig
x86_64                           rhel-8.3-syz
i386                 randconfig-a012-20230116
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
i386                 randconfig-a015-20230116
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                 randconfig-a011-20230116
arm                              allyesconfig
i386                 randconfig-a016-20230116
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a015-20230116
m68k                         apollo_defconfig
um                               alldefconfig
mips                         db1xxx_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                 kfr2r09-romimage_defconfig
riscv                randconfig-r042-20230116
arm                  randconfig-r046-20230117
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230117
arc                  randconfig-r043-20230116
arc                  randconfig-r043-20230115
sh                        sh7763rdp_defconfig
sh                         ap325rxa_defconfig
alpha                            alldefconfig
arc                         haps_hs_defconfig
arm                  randconfig-r046-20230115
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                         s3c6400_defconfig
arm                            lart_defconfig
sh                        sh7757lcr_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64               randconfig-k001-20230116
i386                          randconfig-c001
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arm64                               defconfig
sh                        dreamcast_defconfig
arm                       multi_v4t_defconfig
s390                          debug_defconfig

clang tested configs:
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
arm                     am200epdkit_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
riscv                randconfig-r042-20230115
arm                  randconfig-r046-20230116
s390                 randconfig-r044-20230115
hexagon              randconfig-r041-20230115
hexagon              randconfig-r041-20230116
hexagon              randconfig-r045-20230115
hexagon              randconfig-r045-20230116
i386                              allnoconfig
powerpc                   lite5200b_defconfig
mips                  cavium_octeon_defconfig
hexagon              randconfig-r045-20230117
hexagon              randconfig-r041-20230117
riscv                randconfig-r042-20230117
s390                 randconfig-r044-20230117
x86_64                        randconfig-k001
x86_64                          rhel-8.3-rust
arm                         lpc32xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
