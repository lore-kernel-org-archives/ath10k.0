Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D852FEB64D9
	for <ath10k@archiver.kernel.org>; Sat, 17 Jun 2023 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jcfwm8B6QEHXEFAA2wUsoWUvP2/AF3h+cxU7HcEv7KQ=; b=zibsRtnAMDB0X4
	W+qEghs68zBVs8ekGe/E87iuZnHVKZeeHA6YdUg0toEZzrSTnq3oVxYs7AYs0CP5BVnF7GSFe4WUQ
	XfRrV2uzptykf78JFtbUEuqY23jsB48J/i0jjN+syGVuPi3Cbf4qvaWQPMFmTq0dlRUKjuSCQ04pv
	dXe1/CHQYD0D9hhaq9zZvV62KMn9y8Dia4hTExAhDsRp41lPhF77eGXWNlE5jqS6wW9jJgNg0IRlR
	ZO3f1GbeUleh57EEC8xIXtyhva8pHGPeQKq8YBi/DsYCv2+uWoSR0/dhovLSN6cJFWEvjx2UAWB1j
	m3sRW2UMitsUDS6oVPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAX9W-003lR0-2b;
	Sat, 17 Jun 2023 14:43:46 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAX9T-003lQU-1I
	for ath10k@lists.infradead.org;
	Sat, 17 Jun 2023 14:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687013023; x=1718549023;
  h=date:from:to:cc:subject:message-id;
  bh=I+XEJvQyv2VjWVT8JZmBWE+c025nRWtsPijgREXFwYk=;
  b=Q9KAMjMQdUR/vDXCRn16hAen/sJbkvDwaH584odEmGfhPkLZ+qhnfrjK
   eJUdkp+gaGAwdOEXxZuY6o4omFrlg7aNKuSxsEOwgc//L5bUbWMCKkH3V
   smPSWMvZB9UlXeWw213Ba/OJOsC6CWWp8eiMM6W/QvxYo3fW0TaDCuZo3
   +Riq/4komP5KtKxUsCzb4elBAPPgZj4uBC6IQFgqj38V31OuPF4d80P/O
   TkLBIC39k64WrhGio8WMEW/Kt4kHkoRYlfJuDXhok3f/ZqiXI9mxvfLFH
   PS0DzTmkwGpoW8h9sWRmrl4fKLmEP3Omypi9wxFivGTXm9AGBm8kZhpjX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="361931390"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="361931390"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 07:43:37 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="746780388"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="746780388"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 07:43:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAX9L-0002oq-17;
	Sat, 17 Jun 2023 14:43:35 +0000
Date: Sat, 17 Jun 2023 22:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 ecf65b753c054519987c6324545e9888a0b6083d
Message-ID: <202306172204.qAYdSUfV-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_074343_515279_BB0698F9 
X-CRM114-Status: UNSURE (   4.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: ecf65b753c054519987c6324545e9888a0b6083d  Add localversion-wireless-testing-ath

elapsed time: 1321m

configs tested: 69
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230616   gcc  
alpha                randconfig-r025-20230616   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r035-20230616   gcc  
arc                  randconfig-r043-20230616   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230616   gcc  
arm                  randconfig-r034-20230616   gcc  
arm                  randconfig-r046-20230616   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230616   clang
hexagon              randconfig-r045-20230616   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230616   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r021-20230616   gcc  
microblaze           randconfig-r023-20230616   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r031-20230616   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230616   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230616   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230616   clang
s390                 randconfig-r024-20230616   gcc  
s390                 randconfig-r032-20230616   clang
s390                 randconfig-r044-20230616   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r033-20230616   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r022-20230616   clang
um                   randconfig-r036-20230616   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r004-20230616   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
