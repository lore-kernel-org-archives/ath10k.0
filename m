Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3812C001B0
	for <ath10k@archiver.kernel.org>; Sun, 23 Jul 2023 02:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nb/a5WH8IxVOBWoYy8tYz9r0wf66zfeAfCcYMAi5cK4=; b=j8ielbg6S4h3DW
	WKEWLDZm0O0bmg/LrUCxZU8VHeBjd7hqM384zPxcg4sDuTiySWYmJogbR1vX7h1NKokGDGCaKtQoK
	u4VVANiObUy58Y0n+GTRNcX2mf1JlVYieH6zfyhQC0he62y9Q1zgaCf/SofabkqtWRe5DHyvhSWfH
	tHpqvqeUhXQCXBqYc3M6OMBeUacXfo8Nmww6XpYa/rHRKbwZa2slBmHIG9MpDFwJCQTJpc9j4B1oA
	M00c/KLP4XtWuhflR0rmLJlTC11AOvqQYbn1zqZPca7rNAUmJAE7OkFi8TcSGYhGNaboALN71/ism
	kHqhfovpoGSxvWoiKIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNPAO-000750-0H;
	Sun, 23 Jul 2023 02:49:52 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNPAK-00074I-1q
	for ath10k@lists.infradead.org;
	Sun, 23 Jul 2023 02:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690080588; x=1721616588;
  h=date:from:to:cc:subject:message-id;
  bh=wLD7VhOVfZO1dgMcN61kfZlmqmrqj7xpy+Wax2PclP8=;
  b=L4n5r6nvuird79Mx4d0q+HaMV6HCOqsykv/0bPfFGqzm4552KUmjcnUv
   l4Muk5cdhtcVkGvErXh24kLUURbWxhcuN5cOse6eYzYLNDJQBvhHgLq5h
   tjKnc8aP/wqyWBgCiOxo7k1GD9mlf19XYUVegaqaAxmPswr5fuQ9dbdD0
   bUV6s0McplS1WazgGL7pyP+ZeLFrbTuVDtmtncpEuzSPnE3vV/DynUuLW
   EYbxVML4xAseogyIKR6tAJ5JLgpN0Ss0n2/Lzleotw3e+SsFytCnFRzF9
   6Uz2MIYMbh2ifE2M1XvIRgXNevlprl9kC2VG/npzJcLgjngEnlRMTXRfq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="453619644"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="453619644"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 19:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="760388936"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="760388936"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 19:49:43 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNPAE-0008lv-2P;
	Sun, 23 Jul 2023 02:49:42 +0000
Date: Sun, 23 Jul 2023 10:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 fbda2e2abb52d885632b296e815da0f1fc90bb22
Message-ID: <202307231044.RaApogu3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_194948_671109_F84D5991 
X-CRM114-Status: UNSURE (   5.36  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: fbda2e2abb52d885632b296e815da0f1fc90bb22  Revert "wifi: ath11k: Enable threaded NAPI"

elapsed time: 720m

configs tested: 105
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r031-20230722   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230722   gcc  
arc                  randconfig-r043-20230720   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230720   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230722   gcc  
arm64                randconfig-r006-20230722   gcc  
arm64                randconfig-r014-20230722   clang
csky                                defconfig   gcc  
hexagon              randconfig-r021-20230722   clang
hexagon              randconfig-r022-20230722   clang
hexagon              randconfig-r041-20230720   clang
hexagon              randconfig-r045-20230720   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230722   gcc  
i386         buildonly-randconfig-r005-20230722   gcc  
i386         buildonly-randconfig-r006-20230722   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230722   gcc  
i386                 randconfig-i002-20230722   gcc  
i386                 randconfig-i003-20230722   gcc  
i386                 randconfig-i004-20230722   gcc  
i386                 randconfig-i005-20230722   gcc  
i386                 randconfig-i006-20230722   gcc  
i386                 randconfig-i011-20230720   clang
i386                 randconfig-i012-20230720   clang
i386                 randconfig-i013-20230720   clang
i386                 randconfig-i014-20230720   clang
i386                 randconfig-i015-20230720   clang
i386                 randconfig-i016-20230720   clang
i386                 randconfig-r001-20230722   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230722   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230722   gcc  
nios2                randconfig-r032-20230722   gcc  
openrisc             randconfig-r033-20230722   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230722   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230722   clang
riscv                randconfig-r042-20230720   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230720   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230722   gcc  
sh                   randconfig-r025-20230722   gcc  
sh                   randconfig-r036-20230722   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230722   gcc  
um                   randconfig-r023-20230722   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230722   gcc  
x86_64       buildonly-randconfig-r002-20230722   gcc  
x86_64       buildonly-randconfig-r003-20230722   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r035-20230722   gcc  
x86_64               randconfig-x001-20230723   gcc  
x86_64               randconfig-x002-20230723   gcc  
x86_64               randconfig-x003-20230723   gcc  
x86_64               randconfig-x004-20230723   gcc  
x86_64               randconfig-x005-20230723   gcc  
x86_64               randconfig-x006-20230723   gcc  
x86_64               randconfig-x011-20230720   gcc  
x86_64               randconfig-x012-20230720   gcc  
x86_64               randconfig-x013-20230720   gcc  
x86_64               randconfig-x014-20230720   gcc  
x86_64               randconfig-x015-20230720   gcc  
x86_64               randconfig-x016-20230720   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
