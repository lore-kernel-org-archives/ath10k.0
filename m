Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5749C63797
	for <ath10k@archiver.kernel.org>; Tue, 17 Jan 2023 07:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ALQKbvUCZRkZOfnACOt+0ooeiALFwqvw+d/imlQMjoY=; b=3p+vATbjTlkkVb
	xaPpjVPFrIOsRCKylQxuBlUcTLSsnalUYQBzYobAB8MvGLNpnmg3YpmUJVpTcMMqn9G82/C+CblHk
	NDzJTJfbNmb7KE23YDvv/Ct/0MJEgs4qnYRNcEpT7g1jyEcr+Z7qXR/tnJ3uvqtdYfPhGLyc9aERh
	wTreECMZfxl6SZuIUL1OkEXLa884sk0dgMmWJFoU+cR4ZUF/+SFXb+SNJgd693n/QdembFii/qeGm
	293SXFcViVooATSu8NMeKFO+TaXs6XpYsKsqdLVqonlSzv2m5/VXO3cFhwmKkuhBwWqdMyqDlDmkT
	6CbB5yjz5w3pDQVMA+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfxc-00D6tU-68; Tue, 17 Jan 2023 07:00:44 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfxZ-00D6sX-Be
	for ath10k@lists.infradead.org; Tue, 17 Jan 2023 07:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673938841; x=1705474841;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bALhVIrEZLApSePIzzRm2ySz6UJLaLZhPR6VR07WzfQ=;
  b=AFUy08HN7GE3U/xoczjSrGADkpyIkteUlPSiGepcO3DcLW/M0jhkXMJb
   xt3Ea25HnaFMAnDEfbL6nxqXYPfN7UhKYkZ0Vr3NvLF13BU3ZVMarDcBQ
   9BRw292GtIkJDzTuItuoETCV8k1i3f04yD7H19pvkPo6kFanRUsMAb/G/
   hMLqEWihGZNIsv6Rx9GYexrB5HeETwawZaCKb1wdPidhEKFTErSfXsDuG
   rP21/a6gyJqls+cMNuCMgcH86IybqOtgczuxbI7Sg9t5VugcOB4VjrZDm
   zPYvW8hAkI4fvmls2Qy+vciB9gk4wsUHyI4gZinRqEngqBV/5EAf9EfBr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="323323812"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="323323812"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 23:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="722543177"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="722543177"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2023 23:00:18 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHfxB-000132-2L;
	Tue, 17 Jan 2023 07:00:17 +0000
Date: Tue, 17 Jan 2023 14:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 504fac6c0111460a75d5748c26abea526d8efa1e
Message-ID: <63c64751.9ZmGF2JK01m4MkC+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_230041_464266_D3313DAA 
X-CRM114-Status: UNSURE (   5.31  )
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
branch HEAD: 504fac6c0111460a75d5748c26abea526d8efa1e  Merge branch 'pending' into master-pending

elapsed time: 721m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
i386                                defconfig
x86_64                              defconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
ia64                             allmodconfig
i386                 randconfig-a014-20230116
i386                 randconfig-a013-20230116
arm                                 defconfig
i386                 randconfig-a012-20230116
i386                 randconfig-a011-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a015-20230116
x86_64                           allyesconfig
i386                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20230115
s390                 randconfig-r044-20230116
x86_64                           rhel-8.3-bpf
riscv                randconfig-r042-20230116
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
arm                              allyesconfig
x86_64               randconfig-a011-20230116
arm                  randconfig-r046-20230117
x86_64               randconfig-a013-20230116
arc                  randconfig-r043-20230117
x86_64               randconfig-a012-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
arm64                            allyesconfig
x86_64               randconfig-a015-20230116
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
hexagon              randconfig-r041-20230116
x86_64               randconfig-a004-20230116
riscv                randconfig-r042-20230117
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
hexagon              randconfig-r045-20230117
s390                 randconfig-r044-20230117
hexagon              randconfig-r045-20230115
hexagon              randconfig-r041-20230117
riscv                randconfig-r042-20230115
arm                  randconfig-r046-20230116
s390                 randconfig-r044-20230115
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230115
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a006-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
