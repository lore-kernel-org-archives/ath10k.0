Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950EAECAAA1
	for <ath10k@archiver.kernel.org>; Fri, 16 Sep 2022 22:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AehnKnmpCqMVLIIv3qzj12EKVEObLSBIW1RWdAYx+5A=; b=sm1ukaFuf+lMi1
	Qg6Fck/QIoH4X0GBmKgCprvGztLHq7PoM6iJVtWMXqrovgo9vQ0Ia1G2MkrOP6/Xs9pTtFmMTyK3L
	97RDtNxrJaroHOXK6JSauzN5E8Wx4McvhYmiQS9Zd2XGGp8pM7Sh67ko1tTyiRFs5L7e0kUQBemFs
	fdxSf1iAccJkml+Ixdc0pXh2eB1oUQOMsj+4QTbFWiC7UQ4bJN+HDsMt66Wa4+5yUxlaxhAcG2AwK
	K2LGnqq5k0ENZ0FZ4I5s6Fkn/Ur4IRa8y4PZYQ9k82VPlWVhX5TpdPxEqviR+V9U99jS1CJWke88r
	ysP901EHNfdNnvgLgXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZK8l-000AU2-4s; Fri, 16 Sep 2022 22:48:55 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZK8i-000ASC-I8
	for ath10k@lists.infradead.org; Fri, 16 Sep 2022 22:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663368532; x=1694904532;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RBXwNF66rkTlHgo6GVFDolLF6jAOALV11jMdaxr83nI=;
  b=gF8vH6oMyUvEcqzDdzgSZAciTxWLEIZsdRHPDnU28tD5cgl3aj/GSl9e
   GGL7ixq6ceAZw6pVGdsf7IgToK6FaahqYysXvIvykz3Z3qLgNNOUl7uep
   gmwTqHYKNZFmdii8FNXdxDZbtdrYZ/kV+y8tkTN9MO/d/0ziqR7bcu9IV
   W3y4csjcTcvJ7sz+8qqplgR1XVd/4uzZXk4DTvGZ7+Tiq28aoOyRfk2UG
   25WzUWROSiY4IgpKuJyjs631R8AZrTP0lGCADvSdQu0I9cIanyjz7clcF
   frtyVLV0lBxjcfEYYsuQsmtENTSVnrHPzvhMh2qrDygK7CbcsLJCGuExX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="296681476"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="296681476"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 15:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="946537595"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2022 15:48:46 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZK8b-0002D3-19;
	Fri, 16 Sep 2022 22:48:45 +0000
Date: Sat, 17 Sep 2022 06:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 5fca28ce22bd3c2e952cf935c669e32ca2828c33
Message-ID: <6324fd46.xePZuQViFAiTN/T7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_154852_678909_13840E70 
X-CRM114-Status: UNSURE (   5.85  )
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
branch HEAD: 5fca28ce22bd3c2e952cf935c669e32ca2828c33  Merge branch 'ath-next' into ath-qca

elapsed time: 772m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
arm                                 defconfig
arc                  randconfig-r043-20220916
i386                                defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allmodconfig
x86_64                              defconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                               rhel-8.3
s390                             allyesconfig
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
alpha                            allyesconfig
i386                          randconfig-a003
arc                              allyesconfig
m68k                             allmodconfig
i386                          randconfig-a014
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a002
m68k                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a005
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
