Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D13C4332F
	for <ath10k@archiver.kernel.org>; Fri, 25 Nov 2022 01:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NurJRquCEzEa6E3cec7u7/uR5Kffel80XD2rv5SySL8=; b=WWWfWguEXDIoW3
	yPCFLBlDfZ4IgBdWUf4NVFvyr+mBseasHhPmOIDePHBurxrRPcJ/oZ1Ef28Kq289/E2cZnoclNtVe
	ikgKIQJBlo9suSSYifQ3rHn5A7wg2LCm/I7rhX7Pt+yk7vWQCIhdu8CzshP+WgBnLRtQDiff/z2+G
	P0f4p5OmNl7uZ3c6Yr8imSZFlyKwkNNr/zUuu46MquaaMmUpiygY7Ftas1ZBPsC8+sQBNU8wQPdWq
	bNUY6DnT4VbtEA3RBGMqj+uhwZcHY5YzEsnSz5iy2rW3m5YsSelmU0u1EHLbk3EtWwnYFLlBPQYrO
	ZOtQFYKouZ1/8REZ/IJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyND2-00C1vl-L8; Fri, 25 Nov 2022 01:08:52 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyND0-00C1v9-Sa
	for ath10k@lists.infradead.org; Fri, 25 Nov 2022 01:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669338530; x=1700874530;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hsEieNVeBkoqHL5SZgznxxfrRko6YMvKL8DmheEJSkw=;
  b=H6wpyOUg+kD5Na7kz4xqSQW8qxae0POmH7b8xNTB5kDZpgMqeX0ap46/
   H6rIeINy4gxqZOe9NtMuwbxXyXCCMu6uOhgHyFXemTw7IlS7bkkr+SJr0
   Xz5LU5uJ9o+G3am1V72uCB2T7Qv6jJSZR0F027mlMMAqRUFZ8Kj2pECcp
   2V0beoKNYEzsofsZwUwuJHHz0wVvfcUzAHWbk4+lcdOU1NTE6tHfpPA1R
   PD5c2FubYXe3Mb8tBc0rq+bkWf9qxOudEi9lZl1WpIRlM6QArVZCSysCf
   LQbEkFQ2NL03MHOsf38SWe6ItEQYZtmDxXLSF3iOzQ03rAPz8I+ILIHby
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="301959003"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="301959003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 17:08:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="642542174"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="642542174"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2022 17:08:47 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyNCw-0004Uz-0m;
	Fri, 25 Nov 2022 01:08:46 +0000
Date: Fri, 25 Nov 2022 09:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 8fc5530e811dd856e1561aac8846a4bfb99b574b
Message-ID: <63801567.1EWr9gSsyM3vKrsA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_170851_019096_2B153339 
X-CRM114-Status: UNSURE (   7.23  )
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
branch HEAD: 8fc5530e811dd856e1561aac8846a4bfb99b574b  Merge branch 'pending' into master-pending

elapsed time: 934m

configs tested: 35
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
alpha                               defconfig
arc                  randconfig-r043-20221124
s390                                defconfig
s390                             allyesconfig
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
