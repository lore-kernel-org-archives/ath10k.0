Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4DAC61D97
	for <ath10k@archiver.kernel.org>; Fri, 24 Nov 2023 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NYYAUwvQe0cfnjjAO1hbmQLhtc95T7ChAPLOZehaKMU=; b=cpyiV9KNGapyMI
	0nuu2DU+SmYeG3ErPu5AUeWRHAlPw7+WEINb8minwc5Z/b1WsePZCy08lK1PQWfJOkRd4M5z74Iq4
	1SaMmin3nb0xzBBv1rUx7Up08JO0EmM+W0KM9Xwq3m3lSPylbMwq9XJhZjhYtQh/jaMCK4OLZwLT+
	m2yw5FWXN6jKeesJ5gt/pQT7+14aNiaEe4XfbkEqhTgR8+YqHt2G57lmwbTnE/PfKbQvV3Y0JXFQJ
	yv5J4NwJJKbEVIzdD5JWMBx0VMUgcsSRJ5aHyTKsLYu8HQYQu6RyAP5J1uRqNu64iNO48+2ZkXYiP
	nNEv5d6JWSUbqZHRD+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VhB-007FOa-1L;
	Fri, 24 Nov 2023 12:54:09 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Vh8-007FNj-2d
	for ath10k@lists.infradead.org;
	Fri, 24 Nov 2023 12:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700830446; x=1732366446;
  h=date:from:to:cc:subject:message-id;
  bh=3KgQP0xBplO+TDcD+hi/0/Zr16JuY5aXE82i+Lm1uek=;
  b=ewzTQV7exf1Mo4VIIHSuxSL76HJpcmu74CnHw3RcQlsQSdMMVnttZcWf
   FreIbGKSxwAVzAijUld4kGkuFRcsIdfx4RZUtwCml2WR1QB4J60R7gcLI
   /FHmnF6XeWv5dx/vHhAhIwLwhgR8nSgI0txALQ+t6gNtxhD81BGYqaXuC
   yqXbFJS2HxoP36kpVzxtDduwMQM4cZwcBZJtmT7Z9NL7m1PkS3hm7vX6b
   B7crO46BrwyMG/65kWUKQDTg/3W2PNP7mGfEiGZS7AGTYZKFWObed7snL
   F1hsmDDt89ntA0FiLItIuc372z6fDAPgkDYqmLF43KSSjnCf8Mz96vCK3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392185478"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="392185478"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760953155"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="760953155"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 04:54:02 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Vh1-0002m0-37;
	Fri, 24 Nov 2023 12:53:59 +0000
Date: Fri, 24 Nov 2023 20:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 16a212b4f33c4edd9ce9a9e0953b5389216e8ed9
Message-ID: <202311242018.M6wHjt8G-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_045406_863740_1FBE54EF 
X-CRM114-Status: UNSURE (   4.25  )
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
branch HEAD: 16a212b4f33c4edd9ce9a9e0953b5389216e8ed9  Add localversion-wireless-testing-ath

elapsed time: 2526m

configs tested: 80
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231123   gcc  
i386         buildonly-randconfig-002-20231123   gcc  
i386         buildonly-randconfig-003-20231123   gcc  
i386         buildonly-randconfig-004-20231123   gcc  
i386         buildonly-randconfig-005-20231123   gcc  
i386         buildonly-randconfig-006-20231123   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231123   gcc  
i386                  randconfig-002-20231123   gcc  
i386                  randconfig-003-20231123   gcc  
i386                  randconfig-004-20231123   gcc  
i386                  randconfig-005-20231123   gcc  
i386                  randconfig-006-20231123   gcc  
i386                  randconfig-011-20231123   clang
i386                  randconfig-012-20231123   clang
i386                  randconfig-013-20231123   clang
i386                  randconfig-014-20231123   clang
i386                  randconfig-015-20231123   clang
i386                  randconfig-016-20231123   clang
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231123   gcc  
x86_64       buildonly-randconfig-002-20231123   gcc  
x86_64       buildonly-randconfig-003-20231123   gcc  
x86_64       buildonly-randconfig-004-20231123   gcc  
x86_64       buildonly-randconfig-005-20231123   gcc  
x86_64       buildonly-randconfig-006-20231123   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231123   clang
x86_64                randconfig-002-20231123   clang
x86_64                randconfig-003-20231123   clang
x86_64                randconfig-004-20231123   clang
x86_64                randconfig-005-20231123   clang
x86_64                randconfig-006-20231123   clang
x86_64                randconfig-011-20231123   gcc  
x86_64                randconfig-012-20231123   gcc  
x86_64                randconfig-013-20231123   gcc  
x86_64                randconfig-014-20231123   gcc  
x86_64                randconfig-015-20231123   gcc  
x86_64                randconfig-016-20231123   gcc  
x86_64                randconfig-071-20231123   gcc  
x86_64                randconfig-072-20231123   gcc  
x86_64                randconfig-073-20231123   gcc  
x86_64                randconfig-074-20231123   gcc  
x86_64                randconfig-075-20231123   gcc  
x86_64                randconfig-076-20231123   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
