Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC6FC10F1B
	for <ath10k@archiver.kernel.org>; Fri,  9 Dec 2022 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JFhSnPpfPkiNVkkpyB73jOYq0ryCkov0W7IMGT+8hkU=; b=ZdpKyIxjHOo+7a
	zGzi9X6kFSIXIcjZT8zDt5lF1v/dCHO1Cpa7n8M7qXPL4pDe7FS6S8/JImOVgoy8jnM3p0zHuadoR
	AzGnDp88vm3fGoa7RrfC876WZeRE4WliQqLi77yQS9lzzgQ18CChpE62VM7oM+EgcSEU9DYImxi0q
	MrQMjpARA7fJS168ooB0JSSqqa4zRCIM9XiTSC0yEatJLBsENhPAIPCyi7CpHQzBdt0gSYF4tO8nQ
	q1hZIc6zmspwmQUll4GbPEn6BIQAww8WbBKQdosnOlWsAtbcgVLwRGoy0OJ9M0liBpthuo7Hrcukh
	jMvR/9NkAxBkiXHnXK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Wwd-004cEy-FX; Fri, 09 Dec 2022 06:33:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3WwZ-004cCB-3P
	for ath10k@lists.infradead.org; Fri, 09 Dec 2022 06:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670567591; x=1702103591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=amOHxmNo92Tw2mcmnG2M/ZQEszFFhMyyF/vRIyNEquo=;
  b=dsjaU6zVtkgeJ1ju+NwNTsGR4YwKJqzxquGLdzLfZzEEv+Arl2bWlUQL
   jSX5LLKli05aeH060eMoqoFptWyV39HJo1OgoKkTxgttHJo6KXqdQ1Lnb
   RPIppU/sov4wZoGtd9KyXlt96mbM2Rj/MNjCZ3gzf6MiH50ZyKYZCBxhH
   PnbCIyi75kyxLzj6cAHRTfGMnssJbgPfCOFK0MnGMe3ojrNdKXFOd5bGC
   9eYwdYQHz3xVWgJK2kI2fsuhpOB3x4BHkWWQDss8BpVLwiqOPmEM6GT1b
   lCWRpyBDdWPDHV6MbDuw4jxc3Bi9SYFDs07GcQYe8292Umn3ki+IEoQgK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="297070113"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="297070113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 22:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="976178305"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="976178305"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Dec 2022 22:33:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3WwU-0001hF-1t;
	Fri, 09 Dec 2022 06:33:06 +0000
Date: Fri, 09 Dec 2022 14:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 950b43f8bd8a4d476d2da6d2a083a89bcd3c90d7
Message-ID: <6392d680.TfVpLxJ5Eh4i/WoP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_223311_189404_457D72A8 
X-CRM114-Status: UNSURE (   3.10  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 950b43f8bd8a4d476d2da6d2a083a89bcd3c90d7  wifi: ath11k: fix monitor mode bringup crash

elapsed time: 727m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
powerpc                           allnoconfig
x86_64                              defconfig
s390                                defconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
i386                          randconfig-a014
x86_64                        randconfig-a013
ia64                             allmodconfig
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a015
arc                  randconfig-r043-20221207
x86_64                        randconfig-a006
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                          rhel-8.3-rust
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
i386                          randconfig-a013
x86_64                        randconfig-a014
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a001
arm                  randconfig-r046-20221207
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221207
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221207
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
