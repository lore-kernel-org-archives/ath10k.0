Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273AC6FA8B
	for <ath10k@archiver.kernel.org>; Tue, 20 Sep 2022 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EQHlrPNsHzJAaIE2dJtsi6qkHbNsHBA9cG6Aw16xPuo=; b=A3hX9PjfBTVEnJ
	k7OblkIXEhfjlLYqeKGMXdsLVrcsBJprl/xsKBst6CzgUie6+mQVC5fHxKCjh4Wi+4anLzdZpcYBV
	8m/LmC5u5kiRBJYgf2vEveijMV0hn0Fc2o49zkvqBJXJEiLD/d++kk8anne3G8YviN+Au8esw2mHp
	AcvRcktW9gNapLmqrJVwL3s0NLsGhFcZm5EEqaGDDkjtuPhflIsPPSYPfZjsrk2A33sh4yUBFJ9X2
	GFfLDfnVybmoIM06/B1gcnD8UQCj6kl3+X1k6U7f6H6KVZ0F6S5ciRjNdRQiouVfQqmiP+xHOoRuK
	q8no7ny40YJj84iH05qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSEq-00H3e6-UK; Tue, 20 Sep 2022 01:39:52 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSEo-00H3cZ-Ga
	for ath10k@lists.infradead.org; Tue, 20 Sep 2022 01:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663637990; x=1695173990;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JJRyjzOi9kghuwUPuHDhUGIHK7k+SG8Bl8hYJyPypVA=;
  b=lhNRfzowBJnbGcxpT5aZ8EMivrJPSm8lYFo7QQG9DNCsj8/IpVPPkMsb
   57A2k5khsyrrhIMq/A5Boz1HnBbN29TyeKA9MvziY4euvTpVGmMV5JuRn
   F8WCgyG0LFczY4YHLhGT3U/T0kOPOwisA/Ivq55D/9EKDWtSFSy3nkPuc
   794A+IwgXgysn2GDfiVBB5XLPY/3cKBUluXn0+3JOkmc2+5WYVHxVbJIg
   VpoJtkPbUB+XUuAlhzG7U+0vEKUODYR5AFFE7maE+/V8rq5aPaiwYrhfK
   OtgWRzc9nVYJRjJoVUF9+BjAzzXTVMfk8I0/4xBaoCUT8HkZ/T2kXdzIJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299556483"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="299556483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 18:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="761101892"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2022 18:39:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaSEj-0002N7-0R;
	Tue, 20 Sep 2022 01:39:45 +0000
Date: Tue, 20 Sep 2022 09:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 af7df9fd0038374f6f318a047d89429cdddf4122
Message-ID: <632919d9.6C2ZWnEdOW37khxv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_183950_624331_F1CA42E6 
X-CRM114-Status: UNSURE (   6.33  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: af7df9fd0038374f6f318a047d89429cdddf4122  Merge branch 'ath-next' into ath-qca

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
sh                               allmodconfig
i386                                defconfig
i386                 randconfig-a013-20220919
i386                 randconfig-a012-20220919
s390                             allmodconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20220919
s390                             allyesconfig
i386                 randconfig-a011-20220919
s390                                defconfig
arm                                 defconfig
i386                 randconfig-a016-20220919
i386                 randconfig-a015-20220919
s390                 randconfig-r044-20220919
i386                 randconfig-a014-20220919
riscv                randconfig-r042-20220919
x86_64               randconfig-a012-20220919
x86_64               randconfig-a011-20220919
x86_64               randconfig-a015-20220919
x86_64               randconfig-a013-20220919
x86_64               randconfig-a014-20220919
x86_64               randconfig-a016-20220919
i386                             allyesconfig
m68k                             allmodconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm                              allyesconfig
m68k                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220919
i386                 randconfig-a001-20220919
hexagon              randconfig-r045-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a003-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a005-20220919
i386                 randconfig-a006-20220919
x86_64               randconfig-a003-20220919
x86_64               randconfig-a001-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a005-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
