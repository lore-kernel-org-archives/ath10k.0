Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E63C32771
	for <ath10k@archiver.kernel.org>; Wed, 21 Sep 2022 05:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHKXs0fvIhSydGqJdRjEkys5LoD5DKnrqVAe8tGsM7A=; b=Z7RCdR5oJs5WPa
	Jfp2E+rbsDsWOy58FoXvNz6R5INNgjaunmOPzro4GYrLBP2dP142pG0R0d8tbip2OeQ2OIhNxw/4p
	R4MK5YLyXDP7zwP6njmLL5NlMQjXnf3cXYRvnbzQsL1AQq3oqsHf+e80CpTmb6OQwitw7PSBSq7h+
	omkPzhL5PbQs+SagoMGPktBCrFrhY8m4J361kZ4AdVWPhPQSUdLCbLqBoWSiPa8/O3UY4KcY99shP
	Onn5o4Jj5kD3Ibw+/84bP+Ck2Rq42yqA92qCPenFeekktr+e7cabLW96CzD5M4F7IjcXDyYRC8QnP
	eyqw+33C23f/O1eg5JDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasSy-00958N-Fs; Wed, 21 Sep 2022 05:40:12 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasSv-00956o-Jm
	for ath10k@lists.infradead.org; Wed, 21 Sep 2022 05:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663738809; x=1695274809;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bJcVOjC6B6hO/mTUgUYcG/fsE3N6lHba/tDY/eB987o=;
  b=afF0IadkJCx5Ic5th4+jU59m0JLoilE6J2AjrVFXQMM0XVz1JbxEmZNQ
   v10RMmbaiPtKpYHOR+Vint/iciU++eieWzAbWSv6P41WHAUMZ5sstweIs
   k6OZP7Bi3n+kwKsDomXoq9TwT6CrjZ7uba/Vs+07HxnuJON5Ivyu46rKW
   tZmACAXF/JvknhCAQL7Uh/m++M5AZwiyhGm33v1lfcry0X9DskVO7JpP+
   njfANtFB+hvQVSxfiKiZvm2IJiE6rx0cvGcDrmaMw8YfXs3YgfNHS1uhO
   ikF7qfnz6DxpeQJAbK1WK3r7iEAipRXNxLd8iyLaH0JJ2Zs032XHxYihF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="298625043"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="298625043"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 22:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="687728077"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2022 22:40:05 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oasSq-0003HO-39;
	Wed, 21 Sep 2022 05:40:04 +0000
Date: Wed, 21 Sep 2022 13:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 5bf7c7d225c9c3fa43cd0d04e6e7093b81834c00
Message-ID: <632aa38f.sKsdX7ejm5/hMCJP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_224009_714714_F4416ECB 
X-CRM114-Status: UNSURE (   6.26  )
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
branch HEAD: 5bf7c7d225c9c3fa43cd0d04e6e7093b81834c00  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
s390                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
s390                             allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                                defconfig
arm                                 defconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
m68k                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                          rhel-8.3-func
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
