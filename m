Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D03C77B7A
	for <ath10k@archiver.kernel.org>; Fri,  2 Jun 2023 00:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bciKeYTyQGYXRYK580QCMxVSdMIxnu7Eb8lHFwAmPkM=; b=UpwfvYIkO3HuNW
	8XEcZzpXgKcEEboZx1gQFc4p7s1G7mLPiDn/+DxqwLSVsfyGnlkIsfFkzCj+m0aglBVyPKDFiuhl1
	ifDA+leL3iePw7gpCbzjLt5lXzHL9fB6I89TK0J3u3eKoPPSsQCwB+zxTTgGvd+FUD2xY3zgKYCsK
	2IAwWbBtN+DCI1Ho4MGBzTzxHm02bt0s70eBYsFROxXwQqYi/NXi9kXGqO6RL2NORIHtAh8ZS3+Ew
	jgT2TK8OHe+zGyW5orH+hnXgU1NHt8ROcveFn542Wl1aKxcmVUgYAvyzNLpowjM3V7o3rAHp+CE66
	FYKW1+d+SshtKvJBJFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4se4-005Jvk-2P;
	Fri, 02 Jun 2023 00:27:56 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4se1-005Juj-36
	for ath10k@lists.infradead.org;
	Fri, 02 Jun 2023 00:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685665673; x=1717201673;
  h=date:from:to:cc:subject:message-id;
  bh=UZf+Dc9+6xOls+V0oHJgMtuayrblot/XYCqZvAAM/88=;
  b=UX/exSid/jcS5HTwt+nPKjrphKaru1GCnCwU6f0w9TVL3il4besXuTBz
   +zUWQ6nT8SKz5k+HYwQp1wKHJ027NhFm4v5jLsXwEhSZF2psVUbYZ34fM
   IF932O1k6Wly9cOetCvcrUkCyZQnZwyhX8Zf7RqePyXxkTJkibGvQQ8sQ
   6au1N0uVaUrLu1vGiS96IZg/ZdIh2JyAKXoXN7+/Cbz7X5qaWTINRxbDe
   iUTKBhR0T6/LZWSH1o8Qf9AIFGVrOwXkcqd3Z7XFBmB2NykBLdz/u4Key
   DFlIgOfR6oe43XlY7DfYOXzxU9SLywOuoqj1/LNxqyhHcCQ7YTcRpML3C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354579069"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="354579069"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 17:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="954237997"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="954237997"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2023 17:27:51 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4sdy-0002ov-3A;
	Fri, 02 Jun 2023 00:27:50 +0000
Date: Fri, 02 Jun 2023 08:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 a4756ac34a7002861c9bdf8cf45aec53a77fb78d
Message-ID: <20230602002655.ETfaG%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_172754_013299_C0B808C8 
X-CRM114-Status: UNSURE (   4.77  )
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
branch HEAD: a4756ac34a7002861c9bdf8cf45aec53a77fb78d  Add localversion-wireless-testing-ath

elapsed time: 727m

configs tested: 93
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230601   gcc  
alpha                randconfig-r025-20230531   gcc  
alpha                randconfig-r034-20230531   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230531   gcc  
arc          buildonly-randconfig-r002-20230531   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230531   clang
arm                  randconfig-r026-20230531   gcc  
arm                  randconfig-r046-20230531   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r036-20230531   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r005-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-r004-20230531   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230531   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230601   gcc  
microblaze           randconfig-r024-20230531   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230531   clang
mips                 randconfig-r003-20230531   clang
mips                 randconfig-r022-20230531   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230601   gcc  
openrisc             randconfig-r035-20230531   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230531   gcc  
s390                 randconfig-r011-20230601   gcc  
s390                 randconfig-r031-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230531   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r033-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
