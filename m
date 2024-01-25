Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BF4C48260
	for <ath10k@archiver.kernel.org>; Thu, 25 Jan 2024 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4rdxr+2ssB/WbzgLka2degfCfwK75xvO5006tz1vQHc=; b=s3UeURRqIRGJuW+hS51WvpzZNv
	SA3DXgbFb44iIzbk+JQPvTacF7OiZjPo3Tm/oPOUQN1ORyhQjXcFFSNcxulDvHlF0dlI/d/sx9QBZ
	gV5EyEhJJ5fn5fu7J02OIJW/TrOd84LCJG+rGo1nbMNpWsCtrF+wqUaS+VY6aWsqIQoXYWdJgyjIm
	GP994mg7K0dyGFJarJSziHqPQ8ax5xl6yEpv4z3X5Y82OnQE+XdVYX0/uqVPjgOgUKgPjtiZ88E6x
	NKPy6F0e6uMi3hfE5WCRJ5Z3JMt8lzLuL9Cx6lUXLfBdnHeUffoIvwICPdAtHmu0bC4CoSPV52cw3
	DnvkxTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0TG-00000000I99-10Ue;
	Thu, 25 Jan 2024 14:12:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0SK-00000000HXY-2vdQ
	for ath10k@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4rdxr+2ssB/WbzgLka2degfCfwK75xvO5006tz1vQHc=; b=GQz8+OCaKrJazHjtjLwgfFjuBW
	JJNR0Z0fVoPdMEP5esnNeukBvZVGNcSJNIu1PSvXQrm6Mx+dEjXG7KHZ/eSTAIiB6jxglla3B2kEA
	t2P0RnZiw6AQJFihM6jXhpbrwmic5BTr58/U9lRWoXup0dR98gJJeFzHvk2Z+lOmnHpwWfgM+xodX
	qk8BTz7bPKhI0LVDKd2C6ZDPzPR9/CejQy+V+QSecDZZgpcyNYx0/siTvFc0CUowBsVqqy2nHbM2K
	uQJ7tU1DiBfQUJPrgzj0JOYFeO+8JRqwguU56koEFdDs9rAoEsWlTRulgAe1jLRj0S6yNJZH7fW9L
	pOyuslEw==;
Received: from mgamail.intel.com ([134.134.136.65])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxpc-00000005BHD-0GbB
	for ath10k@lists.infradead.org;
	Thu, 25 Jan 2024 11:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706181820; x=1737717820;
  h=date:from:to:cc:subject:message-id;
  bh=hqpX2sx95R0WTbBYoz4Z0v368jf8qbzR94Xs6jWCZs0=;
  b=hvhvsMG9xclHRM54fwdHJOYQwxgUya1i0XuseYCigA1dwW4CCnDd/hr4
   XaQIcNYr+wBFZ0rtngXfqJMkYCigkg0X9dHHllVjzhbwErRwSz5lRnu5y
   uGYpsD4Pgon/amvRwTGQ/LLBOD7bjiODFO+Epc/tEwtSTsWdsJqSUPmMC
   Qye99zZEZy/nUDVtAijtp4j897pARLRcaRMz6jC0CiBElioSkASIOibbv
   hox4yuOtWEyjMXEPoQKoL5F7ug2d+ZT+tzzerDFAW3jKyjUpzjBSA+QjT
   qOYW8o1yALmM3/2642JwZhjrSlUFATDLYHnc6S09Plhk8AmnuU7fklrCV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405883638"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405883638"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="877018912"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877018912"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2024 03:22:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSxoV-0008wH-0r;
	Thu, 25 Jan 2024 11:22:31 +0000
Date: Thu, 25 Jan 2024 19:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 6ef1f0e7300f60b29ff78794fc846986f6bca869
Message-ID: <202401251923.nJG6u74Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_112340_639909_786D94C5 
X-CRM114-Status: UNSURE (   5.34  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 6ef1f0e7300f60b29ff78794fc846986f6bca869  Merge branch 'pending' into master-pending

elapsed time: 1469m

configs tested: 131
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240125   gcc  
arc                   randconfig-002-20240125   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240125   gcc  
arm                   randconfig-002-20240125   gcc  
arm                   randconfig-003-20240125   gcc  
arm                   randconfig-004-20240125   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240125   gcc  
arm64                 randconfig-002-20240125   gcc  
arm64                 randconfig-003-20240125   gcc  
arm64                 randconfig-004-20240125   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240125   gcc  
csky                  randconfig-002-20240125   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240125   clang
hexagon               randconfig-002-20240125   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240124   clang
i386         buildonly-randconfig-002-20240124   clang
i386         buildonly-randconfig-003-20240124   clang
i386         buildonly-randconfig-004-20240124   clang
i386         buildonly-randconfig-005-20240124   clang
i386         buildonly-randconfig-006-20240124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240124   clang
i386                  randconfig-002-20240124   clang
i386                  randconfig-003-20240124   clang
i386                  randconfig-004-20240124   clang
i386                  randconfig-005-20240124   clang
i386                  randconfig-006-20240124   clang
i386                  randconfig-011-20240124   gcc  
i386                  randconfig-012-20240124   gcc  
i386                  randconfig-013-20240124   gcc  
i386                  randconfig-014-20240124   gcc  
i386                  randconfig-015-20240124   gcc  
i386                  randconfig-016-20240124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240125   gcc  
loongarch             randconfig-002-20240125   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240125   gcc  
nios2                 randconfig-002-20240125   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240125   gcc  
parisc                randconfig-002-20240125   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240125   gcc  
powerpc               randconfig-002-20240125   gcc  
powerpc               randconfig-003-20240125   gcc  
powerpc64             randconfig-001-20240125   gcc  
powerpc64             randconfig-002-20240125   gcc  
powerpc64             randconfig-003-20240125   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240125   gcc  
riscv                 randconfig-002-20240125   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240125   clang
s390                  randconfig-002-20240125   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240125   gcc  
sh                    randconfig-002-20240125   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240125   gcc  
sparc64               randconfig-002-20240125   gcc  
um                    randconfig-001-20240125   gcc  
um                    randconfig-002-20240125   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240125   gcc  
x86_64       buildonly-randconfig-002-20240125   gcc  
x86_64       buildonly-randconfig-003-20240125   gcc  
x86_64       buildonly-randconfig-004-20240125   gcc  
x86_64       buildonly-randconfig-005-20240125   gcc  
x86_64       buildonly-randconfig-006-20240125   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240125   clang
x86_64                randconfig-002-20240125   clang
x86_64                randconfig-003-20240125   clang
x86_64                randconfig-004-20240125   clang
x86_64                randconfig-005-20240125   clang
x86_64                randconfig-006-20240125   clang
x86_64                randconfig-011-20240125   gcc  
x86_64                randconfig-012-20240125   gcc  
x86_64                randconfig-013-20240125   gcc  
x86_64                randconfig-014-20240125   gcc  
x86_64                randconfig-015-20240125   gcc  
x86_64                randconfig-016-20240125   gcc  
x86_64                randconfig-071-20240125   gcc  
x86_64                randconfig-072-20240125   gcc  
x86_64                randconfig-073-20240125   gcc  
x86_64                randconfig-074-20240125   gcc  
x86_64                randconfig-075-20240125   gcc  
x86_64                randconfig-076-20240125   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240125   gcc  
xtensa                randconfig-002-20240125   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

