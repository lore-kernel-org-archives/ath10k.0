Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE519C77B73
	for <ath10k@archiver.kernel.org>; Tue, 30 May 2023 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pBAIXiO+fngiq3vChiNlEQwywfpEezNA4XYXKGPF+ac=; b=kX0WeUriLmv1uw
	NUkOHsWEg0wnCX6tyafQt9GtAeeQvH9sb55NWaf0Gqfsvj4dxHS+teh0y6VfRnCARkLiVVvn55Yxp
	wlCKp9z0TEJk6oZbrFncVQVkK7g4G3aPgm08nDDpuZFGCk5qYFNm5RToeqE42YFGUcRZx8Y0i0y+W
	bW5GxKL3mXc+hYrYmK4EG5ij9SBj/RpEWiBs04T+nC18YQpCUYSaJ9D6uOJHuh/kQaib81Fn+LQaL
	fwdvAM+seZZMhYT7Xhi//jhDy8KlSMTd2cMtLTPGlDTueYoa5SsiO4Cs3C1etKhHKJXmLKqUZytz0
	9llFhyQdg9wnE4SxgBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xmz-00DhR0-1v;
	Tue, 30 May 2023 11:45:21 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xmw-00DhPm-0H
	for ath10k@lists.infradead.org;
	Tue, 30 May 2023 11:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447116; x=1716983116;
  h=date:from:to:cc:subject:message-id;
  bh=YgLbFypKSIN83V1vdYHBl6nukKfhRvFfhefXi2d61qo=;
  b=ZG6zI5Gw1hZrSHURnUtSTJBcr4Tgn/XcSDH/iKP06ADNJT1/8WvtsEOn
   ylSw/Q0/Ct8h+GzEcRR7XGKO9YdsfKMct+2gFao0f3nfJr9Vsm8qODfAx
   WPPIr3Od4orisyGx9ZlvogOi97gSg0Qe0bBbyXZEjJkNnp3T+37ZmgV3O
   chcBC16rGuheFppaieHXkKxDfZD/LEGMDa2IdDs3KHsh7W79xVHV3Doai
   +CKO6vranaNmUNL2quacq4CUb8qo2swjsgFPvHHm0Y7vm6Oui/SOMprpO
   kzOrJ2QibdF0omiq0ZDjPy172mpOJki2iPdVpZXzw36q1ff5nCOEwhiK7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420649846"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="420649846"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="776299115"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="776299115"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2023 04:44:54 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3xmX-0000Ah-1l;
	Tue, 30 May 2023 11:44:53 +0000
Date: Tue, 30 May 2023 19:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 342527f35338d9373f307e24662f174008b571b2
Message-ID: <20230530114442.C13SF%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_044518_258761_5118893F 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 342527f35338d9373f307e24662f174008b571b2  wifi: ath12k: Add support to parse new WMI event for 6 GHz regulatory

elapsed time: 5875m

configs tested: 298
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230530   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230526   gcc  
arc                  randconfig-r031-20230530   gcc  
arc                  randconfig-r043-20230530   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230526   gcc  
csky                 randconfig-r025-20230526   gcc  
csky                 randconfig-r032-20230526   gcc  
csky                 randconfig-r032-20230530   gcc  
hexagon              randconfig-r015-20230528   clang
hexagon              randconfig-r041-20230526   clang
hexagon              randconfig-r045-20230526   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230526   gcc  
i386                 randconfig-i001-20230528   gcc  
i386                 randconfig-i001-20230530   clang
i386                 randconfig-i002-20230526   gcc  
i386                 randconfig-i002-20230528   gcc  
i386                 randconfig-i002-20230530   clang
i386                 randconfig-i003-20230526   gcc  
i386                 randconfig-i003-20230528   gcc  
i386                 randconfig-i003-20230530   clang
i386                 randconfig-i004-20230526   gcc  
i386                 randconfig-i004-20230528   gcc  
i386                 randconfig-i004-20230530   clang
i386                 randconfig-i005-20230526   gcc  
i386                 randconfig-i005-20230528   gcc  
i386                 randconfig-i005-20230530   clang
i386                 randconfig-i006-20230526   gcc  
i386                 randconfig-i006-20230528   gcc  
i386                 randconfig-i006-20230530   clang
i386                 randconfig-i011-20230526   clang
i386                 randconfig-i011-20230530   gcc  
i386                 randconfig-i012-20230526   clang
i386                 randconfig-i012-20230530   gcc  
i386                 randconfig-i013-20230526   clang
i386                 randconfig-i013-20230530   gcc  
i386                 randconfig-i014-20230526   clang
i386                 randconfig-i014-20230530   gcc  
i386                 randconfig-i015-20230526   clang
i386                 randconfig-i016-20230526   clang
i386                 randconfig-i051-20230526   gcc  
i386                 randconfig-i052-20230526   gcc  
i386                 randconfig-i053-20230526   gcc  
i386                 randconfig-i054-20230526   gcc  
i386                 randconfig-i055-20230526   gcc  
i386                 randconfig-i056-20230526   gcc  
i386                 randconfig-i061-20230526   gcc  
i386                 randconfig-i061-20230528   gcc  
i386                 randconfig-i062-20230526   gcc  
i386                 randconfig-i062-20230528   gcc  
i386                 randconfig-i063-20230526   gcc  
i386                 randconfig-i063-20230528   gcc  
i386                 randconfig-i064-20230526   gcc  
i386                 randconfig-i064-20230528   gcc  
i386                 randconfig-i065-20230526   gcc  
i386                 randconfig-i065-20230528   gcc  
i386                 randconfig-i066-20230526   gcc  
i386                 randconfig-i066-20230528   gcc  
i386                 randconfig-i071-20230528   clang
i386                 randconfig-i072-20230528   clang
i386                 randconfig-i072-20230530   gcc  
i386                 randconfig-i073-20230528   clang
i386                 randconfig-i074-20230528   clang
i386                 randconfig-i074-20230530   gcc  
i386                 randconfig-i075-20230528   clang
i386                 randconfig-i075-20230530   gcc  
i386                 randconfig-i076-20230528   clang
i386                 randconfig-i076-20230530   gcc  
i386                 randconfig-i081-20230528   clang
i386                 randconfig-i082-20230528   clang
i386                 randconfig-i082-20230530   gcc  
i386                 randconfig-i083-20230528   clang
i386                 randconfig-i083-20230530   gcc  
i386                 randconfig-i084-20230528   clang
i386                 randconfig-i084-20230530   gcc  
i386                 randconfig-i085-20230528   clang
i386                 randconfig-i085-20230530   gcc  
i386                 randconfig-i086-20230528   clang
i386                 randconfig-i091-20230526   gcc  
i386                 randconfig-i091-20230528   gcc  
i386                 randconfig-i091-20230530   clang
i386                 randconfig-i092-20230526   gcc  
i386                 randconfig-i092-20230528   gcc  
i386                 randconfig-i092-20230530   clang
i386                 randconfig-i093-20230526   gcc  
i386                 randconfig-i093-20230528   gcc  
i386                 randconfig-i093-20230530   clang
i386                 randconfig-i094-20230526   gcc  
i386                 randconfig-i094-20230528   gcc  
i386                 randconfig-i094-20230530   clang
i386                 randconfig-i095-20230526   gcc  
i386                 randconfig-i095-20230528   gcc  
i386                 randconfig-i095-20230530   clang
i386                 randconfig-i096-20230526   gcc  
i386                 randconfig-i096-20230528   gcc  
i386                 randconfig-i096-20230530   clang
i386                 randconfig-r024-20230530   gcc  
ia64                         bigsur_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230526   gcc  
loongarch            randconfig-r021-20230526   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230530   gcc  
m68k                           virt_defconfig   gcc  
microblaze           randconfig-r012-20230530   gcc  
microblaze           randconfig-r023-20230530   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230530   gcc  
nios2                randconfig-r022-20230526   gcc  
openrisc             randconfig-r036-20230530   gcc  
openrisc                       virt_defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230526   gcc  
parisc               randconfig-r036-20230526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc8540_ads_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230526   clang
riscv                randconfig-r042-20230530   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230526   clang
s390                                defconfig   gcc  
s390                 randconfig-r013-20230530   gcc  
s390                 randconfig-r014-20230530   gcc  
s390                 randconfig-r034-20230526   gcc  
s390                 randconfig-r044-20230526   clang
s390                 randconfig-r044-20230530   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r012-20230526   gcc  
sh                   randconfig-r013-20230526   gcc  
sh                   randconfig-r014-20230526   gcc  
sh                   randconfig-r022-20230530   gcc  
sh                   randconfig-r026-20230526   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230526   gcc  
sparc                randconfig-r016-20230530   gcc  
sparc                randconfig-r031-20230526   gcc  
sparc64              randconfig-r033-20230526   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230526   gcc  
x86_64               randconfig-a002-20230526   gcc  
x86_64               randconfig-a003-20230526   gcc  
x86_64               randconfig-a004-20230526   gcc  
x86_64               randconfig-a005-20230526   gcc  
x86_64               randconfig-a006-20230526   gcc  
x86_64               randconfig-a011-20230526   clang
x86_64               randconfig-a011-20230528   clang
x86_64               randconfig-a011-20230530   gcc  
x86_64               randconfig-a012-20230526   clang
x86_64               randconfig-a012-20230528   clang
x86_64               randconfig-a012-20230530   gcc  
x86_64               randconfig-a013-20230526   clang
x86_64               randconfig-a013-20230528   clang
x86_64               randconfig-a013-20230530   gcc  
x86_64               randconfig-a014-20230526   clang
x86_64               randconfig-a014-20230528   clang
x86_64               randconfig-a014-20230530   gcc  
x86_64               randconfig-a015-20230526   clang
x86_64               randconfig-a015-20230528   clang
x86_64               randconfig-a015-20230530   gcc  
x86_64               randconfig-a016-20230526   clang
x86_64               randconfig-a016-20230528   clang
x86_64               randconfig-a016-20230530   gcc  
x86_64               randconfig-x051-20230526   clang
x86_64               randconfig-x051-20230528   clang
x86_64               randconfig-x051-20230530   gcc  
x86_64               randconfig-x052-20230526   clang
x86_64               randconfig-x052-20230528   clang
x86_64               randconfig-x052-20230530   gcc  
x86_64               randconfig-x053-20230526   clang
x86_64               randconfig-x053-20230528   clang
x86_64               randconfig-x053-20230530   gcc  
x86_64               randconfig-x054-20230526   clang
x86_64               randconfig-x054-20230528   clang
x86_64               randconfig-x054-20230530   gcc  
x86_64               randconfig-x055-20230526   clang
x86_64               randconfig-x055-20230528   clang
x86_64               randconfig-x055-20230530   gcc  
x86_64               randconfig-x056-20230526   clang
x86_64               randconfig-x056-20230528   clang
x86_64               randconfig-x056-20230530   gcc  
x86_64               randconfig-x061-20230526   clang
x86_64               randconfig-x061-20230528   clang
x86_64               randconfig-x061-20230530   gcc  
x86_64               randconfig-x062-20230526   clang
x86_64               randconfig-x062-20230528   clang
x86_64               randconfig-x062-20230530   gcc  
x86_64               randconfig-x063-20230526   clang
x86_64               randconfig-x063-20230528   clang
x86_64               randconfig-x063-20230530   gcc  
x86_64               randconfig-x064-20230526   clang
x86_64               randconfig-x064-20230528   clang
x86_64               randconfig-x064-20230530   gcc  
x86_64               randconfig-x065-20230526   clang
x86_64               randconfig-x065-20230528   clang
x86_64               randconfig-x065-20230530   gcc  
x86_64               randconfig-x066-20230526   clang
x86_64               randconfig-x066-20230528   clang
x86_64               randconfig-x066-20230530   gcc  
x86_64               randconfig-x071-20230526   gcc  
x86_64               randconfig-x071-20230528   gcc  
x86_64               randconfig-x071-20230530   clang
x86_64               randconfig-x072-20230526   gcc  
x86_64               randconfig-x072-20230528   gcc  
x86_64               randconfig-x072-20230530   clang
x86_64               randconfig-x073-20230528   gcc  
x86_64               randconfig-x073-20230530   clang
x86_64               randconfig-x074-20230526   gcc  
x86_64               randconfig-x074-20230528   gcc  
x86_64               randconfig-x074-20230530   clang
x86_64               randconfig-x075-20230526   gcc  
x86_64               randconfig-x075-20230528   gcc  
x86_64               randconfig-x075-20230530   clang
x86_64               randconfig-x076-20230526   gcc  
x86_64               randconfig-x076-20230528   gcc  
x86_64               randconfig-x076-20230530   clang
x86_64               randconfig-x081-20230526   gcc  
x86_64               randconfig-x081-20230528   gcc  
x86_64               randconfig-x081-20230530   clang
x86_64               randconfig-x082-20230526   gcc  
x86_64               randconfig-x082-20230528   gcc  
x86_64               randconfig-x082-20230530   clang
x86_64               randconfig-x083-20230526   gcc  
x86_64               randconfig-x083-20230528   gcc  
x86_64               randconfig-x083-20230530   clang
x86_64               randconfig-x084-20230526   gcc  
x86_64               randconfig-x084-20230528   gcc  
x86_64               randconfig-x084-20230530   clang
x86_64               randconfig-x085-20230526   gcc  
x86_64               randconfig-x085-20230528   gcc  
x86_64               randconfig-x085-20230530   clang
x86_64               randconfig-x086-20230526   gcc  
x86_64               randconfig-x086-20230528   gcc  
x86_64               randconfig-x086-20230530   clang
x86_64               randconfig-x091-20230526   clang
x86_64               randconfig-x091-20230528   clang
x86_64               randconfig-x091-20230530   gcc  
x86_64               randconfig-x092-20230526   clang
x86_64               randconfig-x092-20230528   clang
x86_64               randconfig-x092-20230530   gcc  
x86_64               randconfig-x093-20230526   clang
x86_64               randconfig-x093-20230528   clang
x86_64               randconfig-x093-20230530   gcc  
x86_64               randconfig-x094-20230526   clang
x86_64               randconfig-x094-20230528   clang
x86_64               randconfig-x094-20230530   gcc  
x86_64               randconfig-x095-20230526   clang
x86_64               randconfig-x095-20230528   clang
x86_64               randconfig-x095-20230530   gcc  
x86_64               randconfig-x096-20230526   clang
x86_64               randconfig-x096-20230528   clang
x86_64               randconfig-x096-20230530   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
